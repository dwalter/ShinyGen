# GBC profile (GBC Engine)

Shiny Gen is an AI game maker: describe a game and the AI builds it, on web, iOS and Android.

> Part of the [Shiny Gen game languages](README.md). Canonical site: **<https://shinygen.ai>**

The GBC Engine compiles one source file, `main.sgba`, to SM83 machine code and links it into a real
color-handheld cartridge image. It is the same language as the GBA profile, given a smaller machine.
Where a GBA habit does not port, this page says so.

## The machine

| | |
|---|---|
| screen | 160x144, 20x18 tiles of 8x8 |
| backgrounds | one background (a 32x32 tile map) plus one window; no rotation or scaling anywhere |
| sprites | 40 on screen, at most 10 on any one scanline; 8x8, or 8x16 for the whole screen with `spr_tall(1)` |
| palettes | 8 background palettes and 8 sprite palettes, four colours each (colour 0 of a sprite palette is transparent) |
| tiles | two video banks: 256 tiles in bank 0 and 160 in bank 1, shared by backgrounds and sprite sheets |
| game RAM | 4,608 bytes of globals |
| stack | 1,022 usable bytes; one function's frame is at most 127 bytes |
| game ROM | 8,128 bytes in bank 1 for code and small constants; more code banks open on their own, and big `const` tables go to data banks automatically |
| frame | about 35,112 machine cycles, no multiply or divide instruction |
| audio | four voices: two pulse, one wave, one noise; the cartridge plays a score you author |
| saves | three slots on the cartridge battery |

## Widths: the part that bites

| | GBA | GBC |
|---|---|---|
| `int`, `s32`, `u32` | 32 bits | **16 bits** |
| `fx` | 24.8 in 32 bits | **8.8 in 16 bits**, range about -128 to 127.99 |
| pointer | 4 bytes | **2 bytes** |
| struct layout | padded | **packed** |
| shift counts mask to | 31 | **15** |

A screen is wider than an 8.8 `fx` can reach, so **a position is never an `fx` here**. Write positions
as `s16` pixels, and carry any sub-pixel remainder in a separate `u16` of 1/256ths:

```c
s16 player_x;   /* whole pixels */
u16 sub_x;      /* 1/256ths, carries into player_x */

void step(u16 speed, s16 *pos, u16 *sub, s16 dir) {
    u16 acc = (u16)(*sub + speed);
    while (acc >= 256) { acc = (u16)(acc - 256); *pos = (s16)(*pos + dir); }
    *sub = acc;
}
```

The compiler reports differences as coded diagnostics. Warnings mean "this is defined, and means
something different from the same line on a GBA". Examples: a constant shift of 16 or more, a
comparison that mixes a 16-bit unsigned value with a signed one, and `/` or `%` by a run-time value
(a software routine of about 400 cycles; a constant divisor is free).

## A complete small game

```c
#define START_X 24
#define START_Y 120

u8 hero_tile;
s16 x, y;

void init(void) {
    asset_bg_load(BG_world);          /* tiles, palettes and the map, in one call */
    asset_spr_load(SPR_player);
    hero_tile = asset_spr_frame(SPR_player, 0);   /* looked up once, here */
    x = START_X;
    y = START_Y;
    text_init(7);                     /* the font, in palette bank 7 */
    text_put(2, 1, "HELLO");
}

void frame(void) {
    if (key_down(KEY_RIGHT)) { x = (s16)(x + 1); }
    if (key_down(KEY_LEFT))  { x = (s16)(x - 1); }
    spr_set_world(0, x, y, hero_tile, 0);
    probe_game(0, (u32)(((u16)y << 9) | (u16)x));
}
```

A game that needs no art at all, drawing its world from the font's own tiles, is in
[examples/gem-walker-gbc](../../examples/gem-walker-gbc/README.md).

## Engine functions

| Group | Main calls |
|---|---|
| Boot | `eng_video_on()`, `eng_video_off()`, `frame_count()`, `eng_frame_cost_peak()`, `eng_overruns()` |
| Input | `key_down(mask)`, `key_hit(mask)`, `key_up_hit(mask)`. Eight keys: A, B, Select, Start and the four directions. There is no L or R |
| Background | `bg_map_set(tx, ty, tile, attr)`, `bg_map_upload()`, `bg_map_row_queue`, `bg_map_rect_queue`, `bg_set_tile`, `bg_scroll(x, y)`, `bg_split` |
| Window | `win_show(on)`, `win_pos(x, y)`, `win_set_tile`, `win_fill_row` |
| Sprites | `spr_set(index, x, y, tile, attrs)` (you own the index), `spr_hide(index)`, `spr_hide_from(n)`, `spr_tall(on)` |
| Palettes | `pal_set_bg(n, c0, c1, c2, c3)`, `pal_set_obj`, `pal_load_bg`, `pal_load_obj` |
| Assets | `asset_bg_load(id)`, `asset_spr_load(id)`, `asset_spr_frame(id, n)`, `asset_spr_pal(id, n, obj)`, `asset_bg_tile`, `asset_bg_attr` |
| Animation | `anim_play(sprite, ANIM_x)`, `anim_play_once`, `anim_stop`, `anim_tile(sprite)` |
| Camera | `cam_attach(bg)`, `cam_set`, `cam_follow(x, y, margin_x, margin_y)`, `spr_set_world(index, x, y, tile, attrs)` |
| Collision | `move_x_solid`, `move_y_solid`, `bg_solid_rect`, `bg_flags_at_px`, `rect_overlap`, `body_set`, `body_hit`, `body_hit_box` |
| Text | `text_init(pal_bank)`, `text_put`, `text_win`, `print_int`, `print_int_win`, `text_clear_row`, `text_clear_win`, `text_win_n` |
| Save | `save_write(slot, src, size)`, `save_read`, `save_exists`, `save_erase`, `save_capacity` |
| Sound | `snd_music(id, loop)`, `snd_music_stop`, `snd_sfx(id)`, `snd_volume`, `snd_master` |
| Math and random | `fx_mul`, `fx_div`, `fx_sin(u8 angle)`, `fx_cos`, `fx_isqrt(u16)`, `rand_seed`, `rand_u16()`, `rand_range(lo, hi)` |
| Debugging | `probe_game(slot, value)` with two slots, `probe_game_get` |

Three engine functions belong to the runtime and a game must not call them: `eng_init`, `vblank_wait`
and `key_poll`.

### Sprites, tiles and palettes

- Every sprite is 8x8, or 8x16 for the whole screen. A 16x16 character is two objects.
- A sprite sheet gets three visible inks, because a sprite palette is four entries and the first is the
  transparent hole. Draw for three inks from the start, and give things that must be told apart their
  own hue, not just their own shade.
- Pass the attribute from `asset_spr_pal(...)` straight to `spr_set` untouched: it carries the palette
  and the video bank the build chose.
- Ask for assets in `init()` and keep the answers in globals. An `asset_*` lookup inside `frame()` is
  the classic overrun.

### Text and the HUD

Text is placed in cells on a 20x18 screen. `text_put` writes to the scrolling background, so what it
wrote can be streamed away by the camera. A HUD belongs in the window: `text_win`, `print_int_win`,
`win_show(1)` and `win_pos(0, 128)`. The window covers from its Y to the bottom of the screen and has
four rows of content. `print_int` and `print_int_win` right-align into `width` cells and blank-pad.

## Assets are constants

| Prefix | Example | What it is |
|---|---|---|
| `SPR_` | `SPR_player` | a sprite sheet; also `SPR_player_FRAMES`, `_OBJS`, `_TALL` |
| `BG_` | `BG_world` | a background; also `BG_world_W`, `BG_world_H` (the world's size in tiles, which may exceed the 32x32 the hardware shows) |
| `BG_..._TILE_` | `BG_world_TILE_DOOR` | a tile the map named; also an `_ATTR` constant |
| `ANIM_` | `ANIM_player_walk` | a named animation |
| `BGPAL_`, `OBJPAL_` | `OBJPAL_0_2` | a quantized palette colour, for recolouring |

## Budgets

| Wall | Total |
|---|---|
| code, constants and initialized-data image | 8,128 bytes in bank 1, then more banks as needed |
| globals | 4,608 bytes |
| stack, over the whole call graph | 1,022 bytes |
| one function's frame | 127 bytes |
| tiles | 256 in bank 0, then 160 in bank 1 |
| palettes | 8 background and 8 sprite |
| sprites | 40 on screen, 10 per scanline |
| collision bodies | 24 |
| animating sprites | 14 |
| save slots | 3 |

Time is the budget that breaks sooner than a GBA programmer expects.

- A frame is about 35,112 cycles. VBlank carries four units of transfer work, shared by everything
  drawn. A pass that rewrites a whole 32x32 map takes about five frames, so use `bg_map_row_queue` and
  `bg_map_rect_queue` to spread it out.
- An all-pairs test over 24 boxes is about three frames. Use the `body_*` grid instead of a loop over
  pairs.
- `a * b` with two variables is a routine, and `a / b` with a run-time `b` is about 400 cycles.
- A `switch` is a compare chain, not a jump table.

## What a GBA sgba programmer must unlearn

| On a GBA | On the GBC profile |
|---|---|
| `int` is 32 bits | 16 bits, and a pointer is 2 bytes |
| a position fits in `fx` | a position is an `s16` of pixels |
| four layers and rotation | one background and a window; draw rotations as frames |
| `spr_new` returns a handle | you own the index: `spr_set(index, ...)` and `spr_hide_from(n)` |
| 128 sprites | 40, and 10 per scanline |
| 16 palette banks of 15 colours | 8 palettes of four, colour 0 of a sprite palette is the hole |
| `bg_scroll(layer, x, y)` | `bg_scroll(x, y)`: there is no layer argument |
| text on a layer of its own | `text_put` on the background, a HUD in the window |
| the entity pool, platform library and cutscene interpreter | not ported; use `anim_*`, `cam_*`, `body_*` and `text_*` |
| eight probe words | two |
| `fx_sqrt`, `fx_atan2`, `isqrt` | `fx_isqrt(u16)` only; keep a direction as a small integer |

---

[Back to the language overview](README.md)
