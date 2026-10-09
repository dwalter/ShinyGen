# What is Shiny Gen?

> Canonical version: **<https://shinygen.ai/what-is-shiny-gen>**

Shiny Gen is an AI game maker: describe a game, play it, and edit its assets, code, and world with
built-in AI tools, in your browser or on your phone. Games are real projects you own, on a real engine:
the Godot engine in GDScript, or one of five retro engines we built (GBA, GBC, N64, GameCube, and DS)
whose games compile to a real file you can download (a ROM, a GameCube .dol, or a DS .nds). Making,
playing, and sharing games is free; AI generation uses gems, and any one purchase also unlocks exporting
games as files. It also ships an MCP server so AI assistants like Claude and ChatGPT can build alongside
you, and a `shinygen` npm package for embedding games on the web. The app is available on the [App
Store](https://apps.apple.com/app/id6738890511) and [Google
Play](https://play.google.com/store/apps/details?id=com.shinygen.ai).

Think of it as a sandbox with an AI asset editor built in: describe what you want, and it appears in a
world you can play and share.

Shiny Gen is unrelated to Shiny, the R and Python web-application framework maintained by Posit, and
unrelated to the Pokémon "shiny" mechanic or shiny hunting across game generations.

## How it works

1. **Pick an engine.** When you start a game, choose the Godot engine or one of the five retro engines:
   GBA, GBC, N64, GameCube, or DS.
2. **Describe a game.** Type what you want in plain language: a genre, a scene, a mechanic, or a whole
   idea.
3. **The AI writes real game code.** For a Godot game, Shiny Gen generates GDScript (the Godot engine's
   scripting language) and runs it immediately on the engine. A retro game is compiled from your prompt
   into a real file for its engine: a ROM (GBA, GBC, N64), a .dol (GameCube), or a .nds (DS).
4. **The AI tests what it built.** The agent runs the game, takes screenshots, presses the controls, and
   reads the game's errors, then fixes what is broken.
5. **Play it instantly.** The game runs as it is built. There is no engine to install and none to learn.
6. **Edit anything with the built-in editors.** Shiny Gen has four AI creation surfaces: a game-code
   editor (GDScript), a 3D model editor, an image editor, and audio generation for sound effects and
   music.
7. **Share it.** Every game can be shared with a link. Games you own can also be exported for the web as
   a zip you can host anywhere, or embedded on any website with the `shinygen` npm package. For a retro
   game you can download the file you own (a ROM, a .dol, or a .nds). Exporting files needs any one
   purchase, from a $2.99 starter pack.

## What makes Shiny Gen different

### Six engines, one prompt

Make a Godot game, or a real GBA, GBC, N64, GameCube, or DS game and download the file you own: a ROM, a
.dol, or a .nds. The retro engines are engines we built, and they compile new games you make in Shiny
Gen. They are not emulators and not ROM loaders: they cannot play commercial or third-party ROMs.

### The AI plays the game it makes

Shiny Gen's agent does not just write code and hope. It runs the game, takes screenshots, presses the
controls, lets it play for a while, and reads the game's errors, then fixes what is broken. The built-in
agent and a connected Claude or ChatGPT use the same tools.

### Trade and battle across consoles

Multiplayer games are joined with a link or a room code. The Shiny Monsters games on Game Boy Color,
Game Boy Advance, and DS trade and battle monsters with each other over the internet, and DS games use
both screens on dual-screen handhelds.

### It is browser-native and a real game engine

Most AI game tools are one or the other. Prompt-to-game websites are instant but keep your game inside
their own runtime. Engine-based AI tools produce a real project but run as desktop software. Shiny Gen
is both at once: it runs in the browser with nothing to install (and as an app on the App Store and
Google Play), and what it builds is a real Godot project written in GDScript that you own.

### It is a whole game engine, not just a renderer

Web games built with Three.js get a 3D renderer, and everything else is hand-written: physics, input,
scenes, cameras, tooling. Shiny Gen puts the Godot engine itself in the browser (physics, scenes, input,
audio, and editors included) running on a WebGPU renderer compiled to WebAssembly. The AI writes
GDScript against a full engine, so a described game becomes a playable game without anyone building
engine plumbing.

### Its MCP server is hosted, not a desktop bridge

Shiny Gen ships a remote MCP (Model Context Protocol) server at `mcp.shinygen.ai`. Press Host External
Agent in the app, connect Claude, ChatGPT, or any MCP client, and the assistant can read your project,
write code, generate assets, and run the game, live, in your browser project. Other game-engine MCP
integrations are bridges to a desktop editor running on your machine; Shiny Gen's is hosted, with
nothing to install, and access is controlled by scoped OAuth permissions.

### Games live on the web

A Shiny Gen game is a link anyone can open. Its owner can also export it for the web as a zip to upload
to itch.io or any web host, or embed it on any website via the `shinygen` npm package. An exported game
makes no calls to Shiny Gen, its engine version is pinned so our updates cannot break it, and once
loaded it also plays offline. You own your games and may use them commercially ([Terms of
Service](https://shinygen.ai/terms-of-service)).

## What Shiny Gen is not

- Not a hosted prototype box: your game is a real project you own, not a clip locked to one page.
- Not just a 3D renderer like Three.js: it is a whole game engine, so you do not hand-code physics,
  scenes, or tooling.
- Not a desktop download: it runs in the browser, and as an app on the App Store and Google Play.
- Not a Godot plugin: it is a standalone product built on Godot; you never install Godot.
- Not an emulator and not a ROM loader: the GBA, GBC, N64, GameCube, and DS engines compile games you
  make in Shiny Gen, and cannot play commercial or third-party ROMs.
- Not related to Shiny, the R/Python web framework by Posit.
- Not related to Pokémon shiny hunting.

## Specifications

| | |
|---|---|
| Product | Shiny Gen: AI game maker |
| Engines | Six, chosen per game:<br>Godot (customized fork with a WebGPU renderer, compiled to WebAssembly): a real Godot project you own, exportable for the web as a zip<br>GBA, GBC, N64: a ROM you can download<br>GameCube: a .dol file you can download<br>DS: a .nds file you can download<br>Exporting any of these files needs one purchase (from $2.99). |
| Game code | GDScript for Godot games (runs in a sandboxed subset for security) |
| Runs on | Any modern web browser; iPhone and iPad app on the [App Store](https://apps.apple.com/app/id6738890511); Android app on [Google Play](https://play.google.com/store/apps/details?id=com.shinygen.ai), including Retroid-class handhelds; 17 languages |
| Pricing | Free to make, play, and share; gems for AI generation (new accounts get free gems). No subscription required: a $2.99 starter pack, one-time gem packs that never expire, or an optional membership that adds monthly gems. Any one purchase also unlocks file export. |
| Built-in editors | Game code (GDScript) · 3D models · Images · Audio & music |
| AI generation | Game code, images, sprite animations, 3D models, sound effects, and music, using leading models including Claude and Gemini |
| Sharing & export | Share links · Export for the web (zip) · `shinygen` npm embed · ROM, .dol, or .nds download for retro games (any one purchase) |
| AI testing | The agent runs the game, takes screenshots, presses the controls, and reads runtime errors (built-in agent and MCP) |
| Multiplayer | Link or room code; Shiny Monsters trade and battle across GBC, GBA, and DS; web exports play solo |
| MCP | Hosted server at `mcp.shinygen.ai`; works with Claude, ChatGPT, and any MCP client (OAuth: projects.read, projects.write, assets.generate) |
| Company | Shiny AI Technologies, LLC (Massachusetts, USA), founded 2024 |
| Contact | [hello@shinygen.ai](mailto:hello@shinygen.ai) |

More: [Frequently asked questions](faq.md) · [Getting started](getting-started.md) · [▶ Play Shiny Gen](https://shinygen.ai/play)

*Last updated: October 8, 2026*

[← Docs](README.md)
