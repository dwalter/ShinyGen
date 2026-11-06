# Connect Claude or ChatGPT to Shiny Gen with MCP

Shiny Gen is an AI game maker: describe a game and the AI builds it, on web, iOS and Android.

> Canonical version: **<https://shinygen.ai/docs/mcp>**. The shorter overview is [../mcp.md](../mcp.md).

Shiny Gen ships a hosted MCP server at `https://mcp.shinygen.ai/mcp`. MCP (Model Context Protocol) is
an open standard that lets AI assistants use external tools. Connect Claude, ChatGPT or any MCP client
and the assistant can read your project, write game code, generate assets, run the game, look at it
and press its controls. Nothing is installed: the server is remote and operates the project in a Shiny
Gen tab, either yours or the AI's own.

## Connect

There are two ways in.

**1. Host from your open app.** Open your game at [shinygen.ai](https://shinygen.ai), open the **Agent**
tab, tap the model name, choose **Connect external model with MCP**, and press **Host External Agent**.
The app shows "Waiting for your AI to connect". Then add the server in your client:

```
claude mcp add --transport http shinygen https://mcp.shinygen.ai/mcp
```

For Claude on the web or desktop, add a custom connector in Settings and paste
`https://mcp.shinygen.ai/mcp`. For ChatGPT or any other MCP client, add the same URL where it
configures connectors. Your browser opens a Shiny Gen consent page; sign in and approve. Keep Shiny
Gen open while the assistant works.

**2. Give your AI an agent session link.** In Shiny Gen press **+**, then **Link** under **Bring your
own agent** (or, with a game open, choose **Connect external model with MCP** and **Create an agent
session link**). Pick one hour or 24 hours, copy the link and paste it to your AI. The AI opens the
link in its own browser (a headless Chromium its own code starts is fine), and connects its MCP client
to the same URL with the bearer token the page leaves. Your app can be closed the whole time.

Authorization uses OAuth 2.1 with PKCE. Scopes:

| Scope | What it allows |
|---|---|
| `projects.read` | See your project: what is on screen, the focused document and its state. |
| `projects.write` | Write and edit game code and asset documents. Code edits are free. |
| `assets.generate` | Run AI generation (images, 3D models, audio). Spends gems, with a daily cap for connected assistants. |

Writing code is free; only AI generation spends gems. See [Gems and pricing](../gems-and-pricing.md).

## Start every session the same way

1. `get_context` first. It reports what is on screen, which document is focused, the platform
   (`godot`, `gba`, `gbc`, `sg64`), whether the editor is ready, and which tools are unavailable and
   why.
2. `get_reference` before writing code. Pass the topic for the language:
   - `compact`: every symbol of every surface on one page. A good first read.
   - `gdscript` and `gdscript_api`: game scenes on the Godot Engine.
   - `sgba`: the cartridge language. Pass `platform` (`gba`, `gbc` or `sg64`) from `get_context`, because
     one reference carries a profile per machine and the wrong platform gives the wrong page.
   - `model_script`, `image_script`, `audio_script`: 3D models, 2D art and audio as code.
3. Build, then look: run, screenshot, play, read errors, fix.
4. `save_game` as the last call of the turn. It returns only once the cloud has the game.

## The main tools

| Tool | What it does |
|---|---|
| `get_context` | What is on screen, the focused source, version, platform and limits. |
| `create_game` | Start a new game and focus it. `type` is `godot` (default), `gba`, `gbc`, `n64` or `gamecube`. |
| `list_games`, `open_game`, `browse_games`, `remix_game` | Move between your games and the public catalog. |
| `set_source` | Replace the focused code document, then compile, run and observe. Returns compile errors, runtime errors and `print()` output. |
| `edit_source` | Patch the document with exact string replacements, guarded by the version you last read. |
| `read_source`, `search_source` | Read a range or find lines in a large document. |
| `run` | Restart the game unchanged and observe. `keep_save: true` keeps saved data. |
| `screenshot` | A PNG of the game, or a burst of frames to check motion. |
| `send_input` | Press actions or keys, tap a position, or play a timeline of overlapping inputs. |
| `get_run_state` | Live errors, history, `print()` output and the game's `report_status` values. |
| `create_asset`, `edit_asset`, `cartridge_set_asset` | Make images, 3D models, audio and sprites, or adopt a picture into a cartridge. |
| `render_views` | Render views of a 3D model to check it. |
| `export_cartridge` | Write a cartridge game to a ROM file (export needs any one purchase). |
| `get_share_link` | A link to the game. It cannot change who else may open it. |
| `save_game` | Save to the cloud and wait. |

Cartridge games add `cartridge_step` and `cartridge_hold` for frame-exact play.

## Example prompts

Paste these to a connected assistant.

- "Using Shiny Gen, make a small 2D game where I steer a square with a stick and collect coins before a
  30 second timer ends. Run it, take a screenshot, play it, and fix any errors."
- "Create a GBC Engine game in Shiny Gen: a top-down room with four gems to collect and a score in the
  window HUD. Read the sgba reference for the gbc platform first."
- "Create a new N64 Engine game in Shiny Gen with a field of colored tiles, a camera that follows a
  box, and coins to collect. Keep it under 2,500 triangles at 30 Hz."
- "Open my game Moon_Hopper in Shiny Gen, find why the player falls through the floor, fix it with the
  smallest edit, and show me a screenshot before and after."
- "Take the game that is on screen and add a title screen and a pause menu. Report the phase through
  report_status so you can test it by state."

## Example tool sequence

A new 2D Godot game from nothing to played and saved.

1. `get_context` returns `editor: ready`, the account and the platform. If the editor is not ready,
   ask the person to press **Host External Agent**, or use an agent session link.
2. `get_reference` with `topic: "compact"`, then `topic: "gdscript"`.
3. `create_game` with `name: "Coin_Dash"` and `type: "godot"`. The reply carries `game_id` and the
   stored project name.
4. `set_source` with the complete GDScript in `source`. The reply carries compile errors (all of them at
   once), runtime errors and `print()` output.
5. `screenshot` to see what the game shows.
6. `send_input` with an action such as `move_right` and `duration_ms: 400`, then `screenshot` again.
7. `get_run_state` for `current_errors` and the game's `report_status` values.
8. If something is wrong, `edit_source` with `expected_version` from the last reply, and repeat from 5.
9. `save_game`, then `get_share_link` to hand the person a link.

For a cartridge game the sequence is the same with `create_game` `type: "gbc"` (or `gba`, `n64`),
`get_reference` `topic: "sgba"` with the matching `platform`, and source written to `main.sgba`
(`main.sg64` for the N64 Engine). A build failure leaves the last good cartridge running, and the
reply lists every independent error at once.

## Build your own MCP client

Any program that speaks MCP can connect:

- Transport: Streamable HTTP at `https://mcp.shinygen.ai/mcp`.
- Sign-in: OAuth 2.1 with PKCE (S256). A request without a token gets a 401 whose `WWW-Authenticate`
  header points at `https://mcp.shinygen.ai/.well-known/oauth-protected-resource`.
- Registration: clients register themselves at `https://mcp.shinygen.ai/oauth/register`. Public clients
  only.
- Redirect URI: https, or loopback http for a client that catches the redirect on a local port.

## If the connection fails

- The assistant says Shiny Gen is not hosting an external agent: press **Host External Agent** again,
  or use an agent session link.
- No sign-in window appeared: your browser is probably blocking the pop-up.
- Check that the URL includes the path `/mcp`. The host alone is not the endpoint.
- The assistant says agent access is switched off: turn on "Allow AI agents to connect" in the app
  under **Agent access & spending**.

## Safety

Permissions are scoped and revocable. Hosted from your app, everything happens in your open tab and
you can pause or stop it. An agent session works in its own browser and can be revoked at any time
under **Agent access and spending**. The built-in Shiny Gen agent has the same abilities if you would
rather not connect an outside assistant.

---

Questions? See the [FAQ](../faq.md) or [support](../support.md).
