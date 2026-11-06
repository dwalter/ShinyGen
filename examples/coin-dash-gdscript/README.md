# Coin Dash (GDScript)

Shiny Gen is an AI game maker: describe a game and the AI builds it, on web, iOS and Android.

A complete 2D game on the Godot Engine in one script, with no asset files. Steer the square with WASD,
the arrow keys, a controller or the on-screen stick, and collect coins before 30 seconds run out.

**What it shows**

- A 2D game built entirely in `_ready()` from `ColorRect` and `Label` nodes.
- `get_parent().set_design_size(960, 540)` to lay out in a fixed coordinate system on every device.
- Analog input with `Input.get_vector`, and `set_virtual_controls` for touch devices.
- Rectangle overlap tests, a countdown driven by `delta`, and no lambdas or `await` (the runtime forbids them).
- `report_status`, so tools and connected assistants can test the game by state.

**Run it in Shiny Gen**

1. Press **+** and create a new game with the **Godot Engine**.
2. Replace the game's code with [main.gd](main.gd), or ask the agent to use it.
3. It runs on the first build. Try: "make coins worth different points" or "add an enemy square that chases me".

See [GDScript in Shiny Gen](../../docs/language/gdscript.md). License: MIT ([../LICENSE](../LICENSE)).
