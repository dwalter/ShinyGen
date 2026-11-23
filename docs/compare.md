# Shiny Gen compared: Rosebud and GDevelop

> Canonical versions: **<https://shinygen.ai/compare>** ·
> **<https://shinygen.ai/shiny-gen-vs-rosebud>** · **<https://shinygen.ai/shiny-gen-vs-gdevelop>**

Shiny Gen is an AI game maker for the browser and for iPhone, iPad, and Android that builds games on a
real engine: real GDScript on the Godot engine, or one of five retro engines we built (GBA, GBC, N64,
GameCube, and DS) whose games compile to a file you can download. Its agent plays the game it just made
to find and fix bugs. This page sums up how it compares with Rosebud and GDevelop, including where each
of them is the better pick. Details for the other tools come from each tool's own site and change
often, so check each one's site for current features and prices.

## Shiny Gen vs Rosebud

| | Shiny Gen | Rosebud |
|---|---|---|
| Best at | Making, editing, and playing games on every device, on a real engine, including real retro-console games | Turning a description into a playable 2D, 3D, or voxel game fast, and sharing it in a browser |
| Where it runs | Any modern browser, plus iPhone, iPad, and Android apps | In the browser, per its site |
| Engine and output | The Godot engine in real GDScript, or GBA, GBC, N64, GameCube, and DS engines; retro games compile to a ROM, .dol, or .nds (downloading a file requires a purchase) | 2D games, 3D games, and voxel worlds, with a code editor you can open; Pro plans export a Windows build for Steam |
| AI approach | An agent that writes the code, runs the game, takes screenshots, presses the controls, and fixes errors; built-in AI art, 3D, sound, and music; a hosted MCP server so Claude or ChatGPT can build in your project | You describe a game, its assistant asks a few questions, then builds a first playable version with code, art, and sound; you change it in chat |
| Pricing model | Free to make, play, and share; AI generation uses gems; exporting files requires a purchase | A free plan with credits; paid plans add credits and features |

**Choose Rosebud if you want** a quick browser prototype of a 2D, 3D, or voxel game with nothing to
install; to share by link, post to X, and remix other people's games in its community; or a Windows
build for Steam from a Pro plan, which Shiny Gen does not offer yet.

**Choose Shiny Gen if you want** the same editor and agent on iPhone, iPad, Android, and the browser;
real GDScript on the Godot engine, or a real GBA, GBC, N64, GameCube, or DS game as a file; or an agent
that tests its own game, with Claude or ChatGPT able to build in your project over MCP.

Full page: [Shiny Gen vs Rosebud](https://shinygen.ai/shiny-gen-vs-rosebud).

## Shiny Gen vs GDevelop

| | Shiny Gen | GDevelop |
|---|---|---|
| Best at | Describing a game and having an AI agent build, test, and fix it, on every device, including real retro-console games | A free, open-source, no-code engine you control, with built-in multiplayer services and native exports |
| Where it runs | Any modern browser, plus iPhone, iPad, and Android apps | A web app, desktop apps for Windows, macOS, and Linux, and mobile apps |
| Engine and output | The Godot engine in real GDScript, or GBA, GBC, N64, GameCube, and DS engines; retro games compile to a ROM, .dol, or .nds (downloading a file requires a purchase) | A 2D and 3D engine with a no-code event system, extensible with JavaScript; publishing to desktop, web, and mobile (some targets on paid plans) |
| AI approach | Prompt first: an agent writes the code, runs the game, takes screenshots, presses the controls, and fixes errors; built-in AI art, 3D, sound, and music; a hosted MCP server | AI inside a conventional editor: an AI tutor and an AI agent that adds objects and events to your project; use is limited by plan |
| Pricing model | Free to make, play, and share; AI generation uses gems; exporting files requires a purchase | The engine and editor are free and open source; paid plans add online services such as cloud storage, publishing, and AI credits |

**Choose GDevelop if you want** a free, open-source engine and full control of your game's logic through
events; native publishing to desktop and mobile, which Shiny Gen does not offer yet; or built-in
multiplayer lobbies, leaderboards, and player accounts, and an editor on the desktop.

**Choose Shiny Gen if you want** to start from a description and have an agent build and test the game;
real GDScript on the Godot engine, or a real GBA, GBC, N64, GameCube, or DS game as a file; or the same
editor on iPhone, iPad, Android, and the browser, with Claude or ChatGPT able to build in your project
over MCP.

Full page: [Shiny Gen vs GDevelop](https://shinygen.ai/shiny-gen-vs-gdevelop).

## Where Shiny Gen is ahead

- **One maker on every device.** The same games in the browser, on iPhone and iPad, on Android, and on
  handhelds, in 17 languages. DS games use both screens on dual-screen handhelds.
- **The AI tests what it builds.** The agent runs the game, takes screenshots, presses the controls,
  and reads the errors, then fixes what is broken.
- **Real retro consoles.** Make a GBA, GBC, N64, GameCube, or DS game and download the file you own.
  The engines compile games you make; they are not emulators and cannot play commercial ROMs.
- **A whole engine in the browser.** Godot with physics, scenes, input, and audio, on a WebGPU
  renderer, so there is no engine to build or install. The web app is the desktop version: the first
  load is about 17 MB, and on a Mac with Apple silicon the iPad app also installs from the Mac App Store.
- **Your own AI, hosted.** Connect Claude or ChatGPT to `https://mcp.shinygen.ai/mcp` and it builds in
  your live project, with nothing to install. Host it from your open app, or give it an agent session
  link and it runs Shiny Gen in its own browser while your app stays closed
  ([how](https://shinygen.ai/docs/mcp#agent-session)).
- **You own your games** and may sell them: Shiny Gen takes no revenue share
  ([Terms of Service](https://shinygen.ai/terms-of-service), section 4).

## When another tool is the better pick

- **You need a native build of your game today** (Windows, macOS, Steam, or an app store). Shiny Gen
  exports for the web and as retro-console files, not native builds yet. A desktop engine is the right
  tool.
- **You need the project in the stock Godot editor.** Shiny Gen's code is real GDScript, but the
  project runs on our sandboxed fork. Use Godot itself.
- **You want to build your own engine on the web from a renderer up:** use a web 3D library.

## What Shiny Gen does not do yet

- Native desktop or mobile builds of a game you made.
- Multiplayer in a game exported for the web (it plays solo; multiplayer works inside Shiny Gen).
- Web export from the iPhone, iPad, or Android app (it is in the web app; retro ROM, .dol, and .nds
  files can also be saved from the apps).
- Saving a retro ROM, .dol, or .nds file from an Android app older than version 1.1.38: update the app
  or download the file from a browser.
- A download of a game's source as a project. The code is real GDScript you can read and copy in the
  app, but it runs on Shiny Gen's own engine, a Godot 4.6.2 fork with a lot added, so a source export
  would not run in stock Godot. That is why exports are a web zip that runs anywhere, or a retro ROM,
  .dol, or .nds file (exporting requires a purchase).

Comparisons describe each product as of November 2026; products change often, so check each one's own
site. Tell us about anything out of date at hello@shinygen.ai.

*Last updated: November 23, 2026*

[← Docs](README.md)
