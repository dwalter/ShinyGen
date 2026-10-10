# Shiny Gen vs other AI game makers

> Canonical version: **<https://shinygen.ai/compare>**

Shiny Gen is an AI game maker that runs in the browser and as an app on iPhone, iPad, and Android, and
builds games on a real engine: real GDScript on the Godot engine, or one of five retro engines we built
(GBA, GBC, N64, GameCube, and DS) whose games compile to a file you can download. Its agent plays the
game it just made to find and fix bugs. Here is how that compares with the other kinds of AI game maker,
including where another tool is the better pick.

## The kinds of AI game maker

- **Prompt-to-play websites.** Sites such as Rosebud AI turn a description into a playable browser game
  in minutes and share it with a link. They are fast and fun for quick experiments. The game usually
  lives on the site that made it.
- **AI tools built around a desktop engine.** These add AI generation to a game engine you install on a
  computer. You get a real project and native builds, but it is desktop software: no phone or tablet,
  and something to install and learn first.
- **An AI coding assistant with a desktop engine.** A general assistant (Claude, ChatGPT, Cursor)
  writing code for a desktop engine such as Godot is the most flexible route. You set up the engine,
  find or make the art and sound, and run and test the game yourself.
- **Web 3D libraries.** Libraries such as Three.js give you a 3D renderer for the web. Physics, input,
  scenes, cameras, and tooling are hand-written. Shiny Gen puts a whole engine (Godot, on a WebGPU
  renderer) in the browser instead.

## Side by side

Other tools vary and change often, so their columns describe the kind of tool, not any one product.

| | Shiny Gen | Prompt-to-play websites | Desktop AI engines | AI assistant + desktop engine |
|---|---|---|---|---|
| Where you make games | Browser, iPhone and iPad, Android, Retroid-class handhelds | Browser | Desktop computer | Desktop computer |
| Install | None: the web app is the desktop version (Windows, Mac, Linux, Chromebook), about 17 MB to load | None | An app to install | An engine and an assistant |
| Engine | Godot (real GDScript) or our GBA, GBC, N64, GameCube, and DS engines | The site's own runtime | Usually a real engine | Any engine you install |
| AI art, 3D, sound, music | Built in, in the same project | Often built in | Often built in | Separate tools |
| AI plays and tests its game | Yes: runs it, takes screenshots, presses the controls, reads the errors | Varies | Varies | Only if you wire it up |
| Bring your own AI | Hosted MCP server for Claude, ChatGPT, or any MCP client; their code edits cost no gems | Rarely | Some, through a local bridge | Yes, it is the assistant |
| Multiplayer | By link or room code; Shiny Monsters trade and battle across GBC, GBA, and DS | Varies | Yes, you build it | Yes, you build it |
| Take a game with you | Web export (a zip you host anywhere, no calls to Shiny Gen, plays offline) or a ROM, .dol, or .nds file | Usually stays on the site | Native builds | Native builds |
| Native desktop or mobile build of your game | Not yet | Rarely | Yes | Yes |
| Open in the stock Godot editor | No: real GDScript you can read and copy, on our sandboxed Godot fork | No | Depends on the tool | Yes, with Godot |
| Price | Free to make, play, and share; gems for AI (free gems to start); exporting files needs any one purchase, from $2.99 | Free tier, then paid | Free tier, then paid | Engine often free; assistant paid |

## Where Shiny Gen is ahead

- **One maker on every device.** The same games in the browser, on iPhone and iPad, on Android, and on
  handhelds, in 17 languages. DS games use both screens on dual-screen handhelds.
- **The AI tests what it builds.** The agent runs the game, takes screenshots, presses the controls,
  and reads the errors, then fixes what is broken.
- **Real retro consoles.** Make a GBA, GBC, N64, GameCube, or DS game and download the file you own.
  The engines compile games you make; they are not emulators and cannot play commercial ROMs.
- **A whole engine in the browser.** Godot with physics, scenes, input, and audio, on a WebGPU
  renderer, so there is no engine to build or install.
- **Your own AI, hosted.** Connect Claude or ChatGPT to `mcp.shinygen.ai` and it builds in your live
  project, with nothing to install. Host it from your open app, or give it an agent session link and it
  runs Shiny Gen in its own browser while your app stays closed ([how](https://shinygen.ai/docs/mcp#agent-session)).
- **No desktop install.** The web app is the desktop version: the full engine and editors in your
  browser on Windows, Mac, Linux, and Chromebooks, and the first load is about 17 MB. Phones and tablets
  get the iPhone, iPad, and Android apps. (A game you make is exported for the web or as a retro file,
  not as a native app; exporting needs any one purchase, from $2.99.)
- **You own your games** and may use them commercially
  ([Terms of Service](https://shinygen.ai/terms-of-service), section 4).

## When another tool is the better pick

- **You need a native build of your game today** (Windows, macOS, Steam, or an app store). Shiny Gen
  exports for the web and as retro-console files, not native builds yet. A desktop engine is the right
  tool.
- **You need the project in the stock Godot editor.** Shiny Gen's code is real GDScript, but the
  project runs on our sandboxed fork.
- **You want to build your own engine on the web from a renderer up:** use a library such as Three.js.

## What Shiny Gen does not do yet

- Native desktop or mobile builds of a game you made.
- Multiplayer in a game exported for the web (it plays solo; multiplayer works inside Shiny Gen).
- Web export from the iPhone, iPad, or Android app (it is in the web app; retro ROM, .dol, and .nds
  downloads also work in the iPhone and iPad app).
- Saving a retro ROM, .dol, or .nds file from the Android app: download it from a browser for now.
- A download of a game's source as a project. The code is real GDScript you can read and copy in the
  app, but it runs on Shiny Gen's own engine, a Godot 4.6.2 fork with a lot added, so a source export
  would not run in stock Godot. That is why exports are a web zip that runs anywhere, or a retro ROM,
  .dol, or .nds file (exporting needs any one purchase, from $2.99).

Comparisons describe kinds of tool as of the date below; individual products change often, so check
each one's own site. Tell us about anything out of date at hello@shinygen.ai.

*Last updated: October 10, 2026*

[← Docs](README.md)
