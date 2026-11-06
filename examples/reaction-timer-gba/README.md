# Reaction Timer (GBA Engine)

Shiny Gen is an AI game maker: describe a game and the AI builds it, on web, iOS and Android.

A small text-only game in the GBA profile of sgba. Press A to start, wait for GO, then press A as fast
as you can. The result is in frames (about 60 a second) and the best run is kept for the session.

**What it shows**

- The two entry points: `init()` once, `frame()` every video frame. No main loop.
- Text on its own layer with `text_init(1, 1, 29, TEXT_PAL_BANK)`; `TEXT_PAL_BANK` is chosen by the
  build so the font never clashes with art.
- `text_print_int_w` for a HUD number that cleans up after itself.
- A small state machine, redrawing only when something changed.
- `probe_game`, which publishes state so an agent or test can read it without a screenshot.
- `eng_video_on()`: the screen stays white until it is called.

**Run it in Shiny Gen**

1. Press **+** and create a new game with the **GBA Engine**.
2. Replace the contents of `main.sgba` with [main.sgba](main.sgba), or ask the agent to.
3. It builds and starts. Try: "show the result in milliseconds" or "add a beep with a sound effect".

See the [GBA profile](../../docs/language/gba.md). License: MIT ([../LICENSE](../LICENSE)).
