# GBA profile (GBA Engine)

Shiny Gen is an AI game maker: describe a game and the AI builds it, on web, iOS and Android.

> Part of the [Shiny Gen game languages](README.md). Canonical site: **<https://shinygen.ai>**

The GBA Engine compiles one source file, `main.sgba`, to ARM Thumb machine code and links it into a
real GBA cartridge image. The same file plays in the app and on real hardware through a flash cart.

## The machine

| | |
|---|---|
| screen | 240x160, 15-bit colour, 4 bits per pixel |
| CPU budget | about 280,000 cycles per frame, no FPU |
| frame rate | about 59.73 Hz, one `frame()` per video frame |
| entry points | `void init(void)` once, `void frame(void)` every frame |
| types | `int` and `s32` are 32 bits; `fx` is 24.8 fixed point |
| sprites | 128 alive at once; up to 32 sheets at a time; 1,024 sprite tiles in video memory |
| palettes | 16 banks of 15 colours plus transparent |
| backgrounds | four layers, with rotation and scaling available |
| stack | 7,932 bytes, bounded at build time (this is why recursion is refused) |
| cartridge | 32 MiB shared by code, constants, art, sound and data |
| saves | four slots in 128 KB of flash |
| audio | a mixer; a minute of music is about 784 KiB of the cartridge |

Globals live in work memory and start zeroed. Locals live on the stack and start at zero.

## A complete small game

```c
#define START_X 24

s32 hero;
s32 x, y;

void init(void) {
    asset_bg_load(BG_world, 0, 0, 28);
    hero = spr_new(asset_spr_load(SPR_hero), asset_spr_shape(SPR_hero),
                   asset_spr_size(SPR_hero), asset_spr_pal(SPR_hero));
    spr_show(hero);            // spr_new makes a hidden sprite
    x = START_X;
    y = 88;
    text_init(1, 2, 30, 15);
    text_print(1, 1, "HELLO");
    eng_video_on();            // the screen is white until this is called
}

void frame(void) {
    if (key_down(KEY_RIGHT)) { x = x + 1; }
    if (key_down(KEY_LEFT))  { x = x - 1; }
    spr_pos_world(hero, x, y);
    probe_game(0, (u32)(y << 16) | (u32)x);
}
```

`BG_world` and `SPR_hero` are assets made in the same game. See
[Assets are constants](#assets-are-constants). A runnable text-only game is in
[examples/reaction-timer-gba](../../examples/reaction-timer-gba/README.md).

## Fixed point

`fx` is signed 24.8 fixed point. `FX_ONE` is 1.0 and `FX_HALF` is 0.5.

- Literals end in `fx`: `1.5fx`, `0.25fx`.
- `fx * fx` and `fx / fx` shift for you. `fx` and integers never mix; use `fx_from_int` and `fx_to_int`.
- `fx_to_int` floors toward minus infinity. `fx_trunc` goes toward zero and `fx_round` to the nearest.
- `fx_sin(angle)` and `fx_cos(angle)` take a `u16` angle where a full turn is 65536.
- `fx_atan2(dy, dx)` answers in that same angle unit.
- `fx_sqrt`, `isqrt`, `abs`.

## Engine functions

These are the functions that exist besides the ones you write. Each group lists the main calls; the
agent and the connected MCP reference carry the complete table with signatures.

| Group | Main calls |
|---|---|
| Boot and timing | `eng_video_on()`, `eng_video_off()`, `vblank_wait()`, `frame_count()` |
| Input | `key_down(mask)` held, `key_hit(mask)` pressed this frame, `key_up_hit(mask)` released |
| Backgrounds | `bg_init`, `bg_load_tiles`, `bg_load_map`, `bg_set_palette`, `bg_scroll(layer, x, y)`, `bg_set_tile`, `bg_show`, `bg_fill_rect` |
| Sprites | `spr_new(tile, shape, size, pal)`, `spr_pos`, `spr_show`, `spr_hide`, `spr_flip`, `spr_prio`, `spr_free` |
| Sprite animation | `spr_anim(h, ANIM_x)`, `spr_anim_once`, `spr_anim_stop`, `spr_anim_playing`, `spr_anim_set_speed` |
| Rotation and scaling | `spr_affine`, `spr_affine_set(slot, angle_turns, sx, sy)`, `bg_affine_*`, `bg_mode7_lines` |
| Camera and world | `cam_attach(bg, layer)`, `cam_follow(x, y, margin_x, margin_y)`, `spr_pos_world(h, x, y)`, `cam_parallax` |
| Collision | `bg_flags_at_px`, `bg_solid_rect`, `move_x_solid`, `move_y_solid`, `rect_overlap`, `bg_tile_patch` |
| Text | `text_init(layer, charblock, screenblock, pal_bank)`, `text_print`, `text_print_int`, `text_print_int_w`, `text_clear`, `text_color` |
| Text box | `textbox_open`, `textbox_say`, `textbox_update`, `textbox_done`, `textbox_close` |
| Save | `save_write(slot, ptr, size)`, `save_read`, `save_exists`, `save_erase` |
| Sound | `snd_music(id, loop)`, `snd_music_stop`, `snd_sfx(id)`, `snd_volume`, `snd_master`, `snd_tone` |
| Blending and fades | `bld_set`, `bld_alpha`, `bld_bright`, `fade_to_black(frames)`, `fade_from_black`, `fade_to_white` |
| Tweens and timers | `tween(from, to, t)`, `ease_in`, `ease_out`, `ease_in_out`, `ease_bounce`, `timer_start(id, frames)`, `timer_done(id)` |
| Random | `rand_seed`, `rand_seed_frame()`, `rand()`, `rand_range(lo, hi)` |
| Data | `data_rows`, `data_int`, `data_str`, `data_get` for tables, JSON and scripts shipped as files |
| Debugging | `debug_print(s)`, `probe_game(slot, value)`, `probe_mode(n)` |

### Keys

`KEY_A`, `KEY_B`, `KEY_SELECT`, `KEY_START`, `KEY_RIGHT`, `KEY_LEFT`, `KEY_UP`, `KEY_DOWN`, `KEY_R`,
`KEY_L`. Masks combine with `|`.

### Text

`text_init` is called once in `init()` on a layer that is not the camera's. Use the predeclared
`TEXT_PAL_BANK` as the palette bank so the font never collides with your art:
`text_init(1, 1, 29, TEXT_PAL_BANK)`.

- Text is placed in 8x8 tiles on a 30 by 20 screen and is clipped at column 30. Each print call
  returns how many glyphs landed on screen.
- For a HUD number use `text_print_int_w(x, y, value, width)`, which clears a field and right-aligns,
  so a score going from 100 to 99 does not leave a stray digit behind.
- `text_color` repaints the whole layer, so call it once per screen.

### Saving

```c
struct Save { s32 level; s32 score; };
Save g_save;

void store_progress(void) {
    g_save.level = 3;
    g_save.score = 120;
    save_write(0, &g_save, sizeof(Save));
}

void restore_progress(void) {
    if (save_exists(0)) {
        save_read(0, &g_save, sizeof(Save));
    }
}
```

A rebuild keeps the saved data so you can keep testing from where you were. `run` is the power cycle
that clears it.

## Assets are constants

A picture or sound you make in Shiny Gen is converted to GBA formats and minted as one constant per
asset. The compiler predeclares them the way it predeclares `KEY_A`.

| Prefix | Example | What it is |
|---|---|---|
| `SPR_` | `SPR_hero` | a sprite sheet; also `SPR_hero_FRAMES`, `_W`, `_H` |
| `BG_` | `BG_world` | a tilemap; also `BG_world_W`, `BG_world_H` |
| `ANIM_` | `ANIM_hero_walk_down` | a named animation, for `spr_anim` |
| `PAL_` | `PAL_OBJ_0` | a palette bank |
| `SND_` | `SND_music` | a sound or a music score |
| `DATA_` | `DATA_items` | a data file the game reads |

A pixel is transparent only when its alpha is below 128, never because of its colour. A sheet may use
at most 15 distinct colours.

## Budgets

Every build reports each budget as used of total, and a build that exceeds a size budget fails with a
code and the overage.

- About 280,000 CPU cycles a frame. A per-frame loop over more than a few hundred items drops frames.
- 128 sprites alive, 32 sprite sheets loaded at once (`asset_spr_reset()` frees video memory between
  scenes), 1,024 sprite tiles.
- Three tilesets is the practical ceiling for video memory; the build refuses a clash it can read.
- Stack 7,932 bytes. Globals fit in the 256 KiB of work memory less what the runtime keeps.
- Code must fit a 3.5 MiB slot; constants may go after it, up to the 32 MiB cartridge.

Time is the budget that breaks. A cartridge can pass every size budget and still overrun its frame, so
the build and every input reply report where the frame ended and the peak since the run began.

## What a GBA C programmer must unlearn

`#include <tonc.h>`: no. `REG_DISPCNT = ...`: no. `memcpy`: `sgba_memcpy`. `printf`: `debug_print` or
`text_print`. `float`: `fx`. `malloc`: a global array. `main()`: `init()` and `frame()`. Raw OAM or VRAM
pointers: `spr_*` and `bg_*`. Everything else about writing a small C game for a 2002 handheld is
unchanged, including counting cycles.

---

[Back to the language overview](README.md)
