# Getting started with Shiny Gen

> Canonical version: **<https://shinygen.ai/docs/getting-started>**

Shiny Gen is an AI game maker: describe a game, play it, and edit its assets, code, and world with
built-in AI tools, in your browser or on your phone. The AI writes the game's code (GDScript on the
Godot engine, or a retro game compiled for its engine) and the game runs as it is written. This guide
takes you from nothing to a shared game.

## 1. Open Shiny Gen

Go to [shinygen.ai/play](https://shinygen.ai/play) in any modern browser, or get the app on the
[App Store](https://apps.apple.com/app/id6738890511) or
[Google Play](https://play.google.com/store/apps/details?id=com.shinygen.ai), and create a free account.
There is nothing to install on a computer, and new accounts get 30 free gems for AI generation. Once your
gems run out you get one free AI agent prompt each day.

## 2. Describe your game

A new game starts with a choice of engine: Godot, or one of the retro engines GBA, GBC, N64, GameCube,
and DS. Then type what you want in plain language: a genre, a scene, a mechanic, or a whole idea. In the
iPhone, iPad, and Android apps you can also attach a photo from your library or camera as a reference.
The AI writes the game's code and the game runs immediately. You can watch it come together and play it as you
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
- **Audio & music**: generate sound effects and music as editable scores that the app plays.

## 5. Iterate

Keep describing what to add or change. If something breaks, errors are reported back to the AI
automatically so it can fix them; you do not need to read stack traces.

## 6. Share your game

Share any game with a link. In the web app you can also export a game you own for the web (Share, then
**Export for the web**) as a zip you can host anywhere (exporting requires a purchase),
or embed it on any website with the `shinygen`
npm package. An export makes no calls to Shiny Gen, keeps its engine version pinned, and plays offline
once loaded. See [Embed games on your website](embed.md). For a retro game, see
[Export your game as a ROM](https://shinygen.ai/export-rom).

## Good to know

- Godot games are real GDScript on the Godot engine. A game on a retro engine compiles to a file you can
  download: a ROM (GBA, GBC, N64), a .dol (GameCube), or a .nds (DS). Exporting files requires a purchase. See [What is Shiny Gen?](what-is-shiny-gen.md)
- The exact supported API surface for game code is documented in the [GDScript API reference](gdscript-api-reference.md).
- You own what you make and can use it commercially. See the [FAQ](faq.md).
- Playing and sharing are free, and so is building by hand; AI generation and the built-in AI agent use
  gems. See [Gems and pricing](gems-and-pricing.md).
- You can also connect an AI assistant like Claude or ChatGPT to build with you. See [Connect AI
  assistants](mcp.md).

*Last updated: November 23, 2026*

[← Docs](README.md) · [Play](https://shinygen.ai/play)
