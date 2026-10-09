# Getting started with Shiny Gen

> Canonical version: **<https://shinygen.ai/docs/getting-started>**

Shiny Gen makes real games from plain-language descriptions, right in your browser. The AI writes
GDScript (the Godot engine's scripting language) and the game runs as it is written. This guide takes
you from nothing to a shared game.

## 1. Open Shiny Gen

Go to [shinygen.ai/play](https://shinygen.ai/play) in any modern browser and create a free account.
There is nothing to install, and new accounts include free gems for AI generation.

## 2. Describe your game

A new game starts with a choice of engine: Godot, or one of the retro engines GBA, GBC, N64, GameCube,
and DS. Then type what you want in plain language: a genre, a scene, a mechanic, or a whole idea. The AI
writes the game's code and the game runs immediately. You can watch it come together and play it as you
go.

## 3. Or remix an example

The [home page](https://shinygen.ai) has a gallery of [playable examples](examples.md). Open one, play it, then
describe changes (new rules, new art, new levels) to make it yours.

## 4. Edit with the built-in editors

- **Game code**: the game's GDScript is always there to open, read, and edit, with the AI assisting.
- **3D models**: build and edit meshes, entities, and worlds in the 3D model editor, or generate models
  from a description or an image.
- **Images**: generate images with AI, edit them in the built-in editor, or import your own with a file
  picker or drag-and-drop.
- **Audio & music**: generate sound effects and short music clips.

## 5. Iterate

Keep describing what to add or change. If something breaks, errors are reported back to the AI
automatically so it can fix them; you do not need to read stack traces.

## 6. Share your game

Share any game with a link. In the web app you can also export a game you own for the web (Share, then
**Export for the web**) as a zip you can host anywhere, or embed it on any website with the `shinygen`
npm package. An export makes no calls to Shiny Gen, keeps its engine version pinned, and plays offline
once loaded. See [Embed games on your website](embed.md).

## Good to know

- Godot games are real GDScript on the Godot engine. A game on a retro engine compiles to a file you can
  download: a ROM (GBA, GBC, N64), a .dol (GameCube), or a .nds (DS). Exporting files needs any one
  purchase, from a $2.99 starter pack. See [What is Shiny Gen?](what-is-shiny-gen.md)
- The exact supported API surface for game code is documented in the [GDScript API reference](gdscript-api-reference.md).
- You own what you make and can use it commercially. See the [FAQ](faq.md).
- Playing and sharing are free, and so is building by hand; AI generation and the built-in AI agent use
  gems. See [Gems and pricing](gems-and-pricing.md).
- You can also connect an AI assistant like Claude or ChatGPT to build with you. See [Connect AI
  assistants](mcp.md).

*Last updated: October 8, 2026*

[← Docs](README.md) · [▶ Play](https://shinygen.ai/play)
