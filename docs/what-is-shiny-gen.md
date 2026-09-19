# What is Shiny Gen?

> Canonical version: **<https://shinygen.ai/what-is-shiny-gen>**

Shiny Gen is an **AI game maker that runs in your browser**: describe a game, play it, and edit its
assets, code, and world with built-in AI tools. Games run on the Godot engine and are written in
GDScript. Shiny Gen is free to use, with paid credits for AI generation only. It also ships an MCP
server so AI assistants like Claude and ChatGPT can build alongside you, and a `shinygen` npm package
for embedding games on the web. The Android app is on [Google Play](https://play.google.com/store/apps/details?id=com.shinygen.ai); the iOS app is coming soon.

Think of it as a sandbox with an AI asset editor built in: describe what you want, and it appears in a
world you can play and share.

> Shiny Gen is unrelated to [Shiny](https://shiny.posit.co/), the R and Python web-application
> framework maintained by Posit, and unrelated to the Pokémon "shiny" mechanic or shiny hunting across
> game generations.

## How it works

**Describe a game.** Type what you want in plain language: a genre, a scene, a mechanic, or a whole idea.

**The AI writes real game code.** Shiny Gen generates GDScript (the Godot engine's scripting language)
and runs it immediately on the engine in your browser.

**Play it instantly.** The game runs as it is built. There is nothing to install and no engine to learn.

**Edit anything with the built-in editors.** Shiny Gen has four AI creation surfaces: a game-code editor
(GDScript), a 3D model editor, an image editor, and audio generation for sound effects and music.

**Share it.** Every game can be shared with a link. Games you own can also be exported for the web as a
zip you can host anywhere, or embedded on any website with the `shinygen` npm package.

## What makes Shiny Gen different

### It is browser-native and a real game engine

Most AI game tools are one or the other. Prompt-to-game websites are instant but keep your game inside
their own runtime. Engine-based AI tools produce a real project but run as desktop software. Shiny Gen
is both at once: it runs entirely in the browser, and what it builds is a real Godot project written in
GDScript that you own.

### It is a whole game engine, not just a renderer

Web games built with Three.js get a 3D renderer, and everything else is hand-written: physics, input,
scenes, cameras, tooling. Shiny Gen puts the Godot engine itself in the browser (physics, scenes, input,
audio, and editors included) running on a WebGPU renderer compiled to WebAssembly. The AI writes
GDScript against a full engine, so a described game becomes a playable game without anyone building
engine plumbing.

### Its MCP server is hosted, not a desktop bridge

Shiny Gen ships a remote MCP (Model Context Protocol) server at `mcp.shinygen.ai`. Press Host External
Agent in the app, connect Claude, ChatGPT, or any MCP client, and the assistant can read your project, write code, generate assets, and
run the game, live, in your browser project. Other game-engine MCP integrations are bridges to a desktop
editor running on your machine; Shiny Gen's is hosted, with nothing to install, and access is controlled
by scoped OAuth permissions.

### Games live on the web

A Shiny Gen game is a link anyone can open. Its owner can also export it for the web as a zip to upload
to itch.io or any web host, with its engine version pinned so it keeps working the same way, or embed it
on any website via the `shinygen` npm package.

## What Shiny Gen is not

- **Not a hosted prototype box:** your game is a real Godot project you own, not a clip locked to one page.
- **Not just a 3D renderer** like Three.js: it is a whole game engine, so you do not hand-code physics, scenes, or tooling.
- **Not a desktop download:** it runs in the browser, and as an Android app on Google Play, with an iOS app coming soon.
- **Not a Godot plugin:** it is a standalone product built on Godot; you never install Godot.
- **Not related to Shiny**, the R/Python web framework by Posit.
- **Not related to** Pokémon shiny hunting.

## Specifications

| | |
|---|---|
| **Product** | Shiny Gen: AI game maker |
| **Engine** | Godot (customized fork with a WebGPU renderer, compiled to WebAssembly) |
| **Game code** | GDScript (runs in a sandboxed subset for security) |
| **Runs on** | Any modern web browser; Android app on [Google Play](https://play.google.com/store/apps/details?id=com.shinygen.ai); iOS app coming soon |
| **Pricing** | Free to use; gem credits for AI generation only. No subscription required: one-time gem packs that never expire, or an optional membership that adds monthly gems |
| **Built-in editors** | Game code (GDScript) · 3D models · Images · Audio & music |
| **AI generation** | Game code, images, sprite animations, 3D models, sound effects, and music, using leading models including Claude and Gemini |
| **Sharing & export** | Share links · Export for the web (zip) · `shinygen` npm embed |
| **MCP** | Hosted server at `mcp.shinygen.ai`; works with Claude, ChatGPT, and any MCP client (OAuth: `projects.read`, `projects.write`, `assets.generate`) |
| **Company** | Shiny AI Technologies, LLC (Massachusetts, USA), founded 2024 |
| **Contact** | hello@shinygen.ai |

---

More: [Frequently asked questions](faq.md) · [Getting started](getting-started.md) · [▶ Play Shiny Gen](https://shinygen.ai/play)

[← Docs](README.md)
