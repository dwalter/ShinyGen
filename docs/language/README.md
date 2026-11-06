# The Shiny Gen game languages

Shiny Gen is an AI game maker: describe a game and the AI builds it, on web, iOS and Android.

> Canonical site: **<https://shinygen.ai>**

Every Shiny Gen game is written in one of two kinds of language. The AI agent writes it for you, and
you (or a connected assistant such as Claude or ChatGPT) can read it, edit it and write it directly.

| Engine (as the New screen labels it) | Language | Code file | Reference |
|---|---|---|---|
| Godot Engine | GDScript (a sandboxed subset of GDScript 4) | one game script | [GDScript](gdscript.md) and the [API reference](../gdscript-api-reference.md) |
| GBA Engine | **sgba**, the GBA profile | `main.sgba` | [GBA profile](gba.md) |
| GBC Engine | **sgba**, the GBC profile (also called sgbc) | `main.sgba` | [GBC profile](gbc.md) |
| N64 Engine | **sgba**, the SG64 profile (also called sg64) | `main.sg64` | [SG64 profile](sg64.md) |

The GameCube Engine and the DS Engine are separate engines with their own languages and are not
covered here. All of the retro engines compile games you make in Shiny Gen. They are not emulators
and cannot play commercial or third-party ROMs.

## What the cartridge language is

For the GBA, GBC and N64 engines the game is not a game scene and it is not GDScript. It is a single
source file in **sgba**, a strict subset of C. Shiny Gen compiles that file to real machine code on the
device and links it into a real cartridge image, which is what plays in the app and what you download
as a ROM (downloading needs any one purchase; see [Gems and pricing](../gems-and-pricing.md)).

One language, three machines. The grammar, the type checker and the compiler are shared. Each
machine gets a **profile** that narrows or widens it to match the hardware: integer widths, the fixed
point format, the engine functions and the budgets. Code written for one profile often needs changes
for another, and each profile page lists exactly what differs.

## How a game is structured

- **One file.** There is no `#include`, no second file and no header. The engine functions and the
  names of your assets are already in scope.
- **GBA and GBC: two entry points.** `void init(void)` runs once, and `void frame(void)` runs once per
  video frame (about 59.7 times a second), forever. You never write a main loop.
- **SG64: one entry point.** `void main(void)` owns the frame loop. Call `sys_init(30)` first, then
  loop with `frame_begin` and `frame_end`. Returning from `main` is a panic.
- **Assets are constants.** A picture you made in Shiny Gen becomes a constant such as `SPR_hero`
  (sprite sheet) or `BG_world` (background); a 3D model becomes `MESH_duck`; a sound becomes
  `SND_theme`. You name your art and never write a number.
- **Memory is static.** No heap, no `malloc`, no recursion. Use fixed-size global arrays.
- **Hardware is behind the engine API.** You never touch a register or an address. That is the point
  of the profile.
- **Panics, not undefined behavior.** A broken rule (a bad handle, a failed `assert`, a stack overflow)
  stops the game with a code, rather than carrying on with a wrong state.

Declaration order does not matter: there are no prototypes. A struct or enum tag is a type name on
its own (`Entity e;`, never `struct Entity e;`).

## What is kept from C

- Types `s8 s16 s32 u8 u16 u32 bool` (and `int`), plus the fixed-point type `fx`.
- Fixed-size and multi-dimensional arrays, `struct`, `enum`, `const`, globals, locals and static
  initializers.
- The full C operator set on integers, `sizeof`, `if`/`else`, `while`, `for`, `do`, `switch`, `break`,
  `continue`, `return`.
- Pointers to structs and arrays inside game memory, with pointer arithmetic.
- `#define NAME value` constants.
- `assert(cond)`, which stops the game with a panic carrying the line number.

Semantics are pinned so two compilers cannot disagree: signed overflow wraps, shifts are masked to the
type width, uninitialized locals are zero, arguments evaluate left to right, and a constant division by
zero is a compile error.

## What is removed, and what to write instead

Every one of these is a compile error whose message names the replacement.

| Removed | Write instead |
|---|---|
| `float` and `double` (on GBA and GBC), fractional literals like `0.5` | `fx` and a fixed-point literal such as `1.5fx` (SG64 also has `f32`, written `1.5f`) |
| `malloc`, any heap, variable-length arrays | a fixed-size global array |
| recursion | a loop with an explicit array as the stack |
| `#include`, function-like macros | `#define NAME value`, or a function |
| function pointers | call directly, or `switch` on a small integer |
| `volatile`, casts to or from addresses, literal addresses | the engine API |
| `goto`, `union`, `typedef`, `extern`, `static` locals | `break`/`continue`/`return` and a state variable; a struct; a global |
| the C standard library | the engine API is the library |

The compiler reports every independent error at once, with a stable code, a line, a column and a
caret, so the list you get back is the whole list. Fix all of it in one edit.

### Fixed point: `fx`

`fx` is a first-class type. A literal ends in `fx` (`1.5fx`, `-3.0fx`). `fx * fx` and `fx / fx` do the
shift for you. An `fx` and a plain integer never mix silently: convert with `fx_from_int(n)` and
`fx_to_int(v)`. The format differs per machine:

| | GBA | GBC | SG64 |
|---|---|---|---|
| `int`, `s32`, `u32` | 32 bits | 16 bits | 32 bits |
| `fx` | 24.8 in 32 bits | 8.8 in 16 bits | 16.16 in 32 bits |
| `f32` (IEEE single) | no | no | yes |
| pointer | 4 bytes | 2 bytes | 4 bytes |
| screen | 240x160 | 160x144 | 320x240 |
| angles | full turn = 65536 | full turn = 256 | full turn = 1.0 (turns) |

## Writing and running a game

- **Ask the agent.** Create a new game, choose the engine on the New screen, and describe the game.
  The agent writes the source, builds it, plays it with screenshots and button presses, reads the
  errors and fixes them.
- **Write it yourself.** Open the code document (`main.sgba` or `main.sg64`) and edit it. A good build
  reloads the cartridge you are watching and restarts it from frame 0, keeping the saved data. A
  failed build changes nothing: the last good cartridge keeps running while you fix the source.
- **Connect an assistant.** Claude, ChatGPT or any MCP client can do the same through the hosted MCP
  server. See [Connect Claude or ChatGPT](../mcp/README.md).

Each build reports its budgets (used of total) so you find out at 80 percent and not at 101 percent.
Size budgets fail the build. Time budgets (frame cost) are measured by playing the game.

## The Shiny Gen splash

An exported cartridge opens on a short Shiny Gen splash before your first frame. It costs the game
nothing it can see.

## Next

- [GBA profile](gba.md)
- [GBC profile](gbc.md)
- [SG64 profile](sg64.md)
- [GDScript](gdscript.md)
- [Examples you can paste in](../../examples/README.md)
