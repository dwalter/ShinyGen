# Gem Walker (GBC Engine)

Shiny Gen is an AI game maker: describe a game and the AI builds it, on web, iOS and Android.

A whole GBC game with no art at all. It draws its world out of the font's own tiles, walks a sprite
around it with tile collision, keeps a HUD in the window, and saves to the cartridge battery.
Walk with the D-pad, collect the gems, press Start to save.

**What it shows**

- Positions as `s16` pixels with a separate `u16` sub-pixel remainder: on this profile an `fx` only
  reaches about +/-127, so a position is never an `fx`.
- `text_init`, `bg_map_set` and `bg_map_upload` to paint a map under forced blank in `init()`.
- Your own collision map (`map_flags`) and a `blocked()` test against 8x8 cells.
- A HUD in the window (`text_win`, `print_int_win`, `win_show`, `win_pos`) redrawn only when it changes.
- `spr_set` and `spr_hide_from` so no sprite lingers from an earlier frame.
- Saving a struct with `save_write` and `save_read`.
- `probe_game` in both of the two available slots.

**Run it in Shiny Gen**

1. Press **+** and create a new game with the **GBC Engine**.
2. Replace the contents of `main.sgba` with [main.sgba](main.sgba), or ask the agent to.
3. It builds and starts. Try: "make the gems animate" or "add an enemy that patrols the room".

See the [GBC profile](../../docs/language/gbc.md). License: MIT ([../LICENSE](../LICENSE)).
