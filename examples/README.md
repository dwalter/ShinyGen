# Shiny Gen examples

Shiny Gen is an AI game maker: describe a game and the AI builds it, on web, iOS and Android.

Small, open-licensed example games written for the public from the [language docs](../docs/language/README.md).
Each one needs no art or model files, so it builds in a brand-new game. They are licensed MIT
([LICENSE](LICENSE)); the rest of the repository keeps its own license.

| Example | Engine | Language | What it shows |
|---|---|---|---|
| [coin-dash-gdscript](coin-dash-gdscript/README.md) | Godot Engine | GDScript | a 2D game built in code: stick input, collision, a timer, `report_status` |
| [reaction-timer-gba](reaction-timer-gba/README.md) | GBA Engine | sgba (GBA) | the `init`/`frame` shape, a text-only game, a state machine, probe words |
| [gem-walker-gbc](gem-walker-gbc/README.md) | GBC Engine | sgba (GBC) | `s16` pixel positions, tile collision, a window HUD, battery saves |
| [coin-field-n64](coin-field-n64/README.md) | N64 Engine | sgba (SG64) | `main()` with its own frame loop, `prim_box` 3D, the stick, a HUD |

## How to run one

1. In Shiny Gen press **+** and create a new game with the engine in the table.
2. Replace the game's code (the GDScript, `main.sgba` or `main.sg64`) with the example file, or ask the
   agent: "Replace the code with this" and paste it. A connected assistant can do the same with
   `set_source` (see [MCP](../docs/mcp/README.md)).
3. The game builds and runs. Ask the agent to change it ("make the timer 20 seconds", "add a second
   enemy") and it edits the source for you.

The cartridge examples were written from the language references. If a build reports an error, paste
the error to the agent and it will fix it.
