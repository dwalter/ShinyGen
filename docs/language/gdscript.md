# GDScript in Shiny Gen (Godot Engine)

Shiny Gen is an AI game maker: describe a game and the AI builds it, on web, iOS and Android.

> Part of the [Shiny Gen game languages](README.md). Canonical site: **<https://shinygen.ai>**

Games on the Godot Engine are written in GDScript and run live inside Shiny Gen's sandboxed Godot
runtime. The language is a strict subset of GDScript 4: code that works in stock Godot can still be
rejected, so follow the contract below. The exact supported class and method surface is in the
[GDScript API reference](../gdscript-api-reference.md).

## How the code runs

- The game is one GDScript file. The runtime instantiates it as a single node and runs it.
- Build the whole scene in code in `_ready()`. Animate and simulate in `_process(delta)`.
- Start with `extends Node3D` for a 3D game or `extends Node2D` for a 2D game.
- A runtime error halts the game and a compile error keeps the previous scene running. Either way the
  error text, with line numbers, comes back to the agent or assistant for a fix.
- `print()` is a channel tools read. Prefix lines with a tag, such as `print("[QA] wave 3 cleared")`,
  so a tool can wait for a specific line.

## Language rules

- Indent with 4 spaces.
- No triple-quoted strings, no lambdas, no `await`, coroutines or `yield`, no `_draw()`.
  Connect signals to named methods (`timer.timeout.connect(_on_timer_done)`) and use `Timer` nodes or
  accumulate time in `_process`.
- No file, network, OS, window, thread or JavaScript access. Use `get_viewport_rect().size` for the
  screen size.
- The runtime is deterministic: no wall-clock time. Drive everything from `delta`. `randf()`,
  `randi()` and `RandomNumberGenerator` work without seeding.
- Only the classes listed in the API reference exist. Referencing anything else is a compile error.
- A freed node is not null: guard with `is_instance_valid(node)`.

## Scene basics for 3D

Add a `Camera3D`, a `DirectionalLight3D` and a `WorldEnvironment` in `_ready()`. Build meshes from
primitives (`BoxMesh`, `SphereMesh`, `CylinderMesh`) with `StandardMaterial3D`. Make something visible
render immediately.

```gdscript
extends Node3D

var cube: MeshInstance3D

func _ready():
    var camera = Camera3D.new()
    camera.transform.origin = Vector3(0.0, 2.0, 4.5)
    camera.look_at(Vector3(0.0, 0.8, 0.0))
    add_child(camera)

    var light = DirectionalLight3D.new()
    light.light_energy = 1.5
    light.rotation_degrees = Vector3(-40.0, -30.0, 0.0)
    add_child(light)

    cube = MeshInstance3D.new()
    var box = BoxMesh.new()
    box.size = Vector3(2.0, 2.0, 2.0)
    cube.mesh = box
    cube.transform.origin = Vector3(0.0, 1.0, 0.0)
    add_child(cube)
    print("[cube] ready")

func _process(delta):
    cube.rotation.y += delta * 1.2
```

## Scene basics for 2D

A 2D game declares the coordinate system it lays itself out in:

```gdscript
get_parent().set_design_size(960, 540)
```

`get_viewport_rect().size` then answers exactly that on every device. Build visuals from nodes
(`ColorRect`, `Polygon2D`, `Sprite2D`, `Label`). A full 2D example is in
[examples/coin-dash-gdscript](../../examples/coin-dash-gdscript/README.md).

## Input

- Movement: `var v = Input.get_vector("move_left", "move_right", "move_up", "move_down")`. It is analog
  and already has a dead zone applied, so scale speed by it directly: `pos += v * speed * delta`.
- Actions: `Input.is_action_pressed`, `is_action_just_pressed`, `is_action_just_released` with the names
  `move_left`, `move_right`, `move_up`, `move_down`, `jump`, `fire`, `interact`, `tap` and the
  `ui_*` family.
- Keyboard: `Input.is_key_pressed(KEY_SPACE)` and the other key constants.
- On-screen controls for touch devices: `get_parent().set_virtual_controls({"stick": true})`, and
  buttons such as `{"buttons": {"A": "interact"}}`. The call returns whether this device draws touch
  controls, so label prompts accordingly rather than hardcoding a key name.

## Using the game's assets

Images, sounds and 3D models made in Shiny Gen load by display name through the parent node, once,
usually in `_ready()`:

```gdscript
var tex = get_parent().load_texture("goblin")      # ImageTexture or null
var snd = get_parent().load_audio("boom")          # AudioStream or null
var scene = get_parent().load_model("statue")      # Node3D handle or null
```

Each loader has an `_async` twin for assets requested during play. It returns null until the asset is
ready, so call it again with the same name on a later frame.

## Reporting game state

`get_parent().report_status({"phase": "playing", "score": score})` publishes state that the app and
connected tools read, so a game can be play-tested by state instead of by guessing from pixels. Keys
merge, with at most 16 short keys and values that are booleans, numbers or short strings.

## Other things the runtime gives you

- **Entities:** `Entities.find`, `Entities.spawn`, `Entities.player()` and per-entity scripts for games
  built with the app's map and entity editors.
- **Safe frame (3D):** `get_parent().set_safe_frame_aspect(16.0 / 9.0)` declares the aspect of the
  region that must stay visible at every window shape.
- **Multiplayer:** `get_parent().set_multiplayer({"online": true})` declares that a game is meant to be
  played with other people.

---

[Back to the language overview](README.md)
