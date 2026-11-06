# Coin Field (N64 Engine, SG64 profile)

Shiny Gen is an AI game maker: describe a game and the AI builds it, on web, iOS and Android.

A small 3D game that needs no model files. Move the orange box with the analog stick across a
checkered floor and collect the six spinning coins. The camera follows from behind and above.

**What it shows**

- `void main(void)` with a frame loop you own: `sys_init(30)`, then `frame_begin` / `frame_end`.
- 3D from `prim_box` into an arena you own, flushed with `prim_flush`, with `light_dir` and `light_ambient`.
- One camera per frame with `cam_perspective` and `cam_look`; angles in turns (the coins spin by adding to an `fx`).
- `pad_stick_x()` and `pad_stick_y()`, which are `fx` from -1.0 to 1.0.
- The 2D layer (`text_color`, `text_print`) drawn after all the 3D.
- A scene well inside the triangle budget (about 2,970 triangles at 30 Hz): 64 flat floor boxes, six coins and a player.

**Run it in Shiny Gen**

1. Press **+** and create a new game with the **N64 Engine**.
2. Replace the contents of `main.sg64` with [main.sg64](main.sg64), or ask the agent to.
3. It builds and starts. Try: "add a jump", "put walls around the floor" or "add enemies that drift toward me".

See the [SG64 profile](../../docs/language/sg64.md). License: MIT ([../LICENSE](../LICENSE)).
