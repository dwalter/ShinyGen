# Frequently asked questions

> Canonical version: **<https://shinygen.ai/faq>**

Everything about Shiny Gen: pricing, the engines, platforms, ownership, export, and connecting AI
assistants. New here? Start with [What is Shiny Gen?](what-is-shiny-gen.md)

## What is Shiny Gen?

Shiny Gen is an AI game maker: describe a game, play it, and edit its assets, code, and world with
built-in AI tools, in your browser or on your phone. Games are real projects you own, on a real engine:
the Godot engine in GDScript, or one of five retro engines we built (GBA, GBC, N64, GameCube, and DS)
whose games compile to a real file you can download (a ROM, a GameCube .dol, or a DS .nds). It is free
to make, play, and share games; AI generation uses gems, and new accounts get free gems.

## What engines can I make games for?

You choose the engine when you start a game, and there are six. The Godot engine makes real Godot
projects written in GDScript. The five retro engines are engines we built for GBA, GBC, N64, GameCube,
and DS games, and each one compiles your game into a real file you can download and keep: a ROM for GBA,
GBC, and N64, a .dol for GameCube, or a .nds for DS (exporting the file needs any one purchase, from a
$2.99 starter pack). The retro engines are not emulators and not ROM loaders: they compile games you
make in Shiny Gen, and cannot play commercial or third-party ROMs.

## Is Shiny Gen free to use?

Yes. Making, playing, sharing, and remixing games is free, and no subscription is required. AI
generation spends gems: new accounts start with free gems, and you can buy a $2.99 starter pack, gem
packs that never expire, or an optional membership that adds monthly gems. Any one purchase also unlocks
exporting your games as files (a web zip, a ROM, a .dol, or a .nds). If you connect your own Claude or
ChatGPT, the code it writes costs no gems.

## Is Shiny Gen built on the Godot engine?

Yes. Shiny Gen is built on the Godot engine, a customized Godot fork with a WebGPU renderer, compiled to
WebAssembly so the whole engine runs in your browser. Game code is GDScript, Godot's scripting language.

## Do I need to know how to code to use Shiny Gen?

No. You describe what you want in plain language and Shiny Gen's AI writes the game code for you. The
code is always there to open and edit if you want to learn or fine-tune, but you never have to.

## Does the AI test the games it makes?

Yes. Shiny Gen's agent plays the game it just built: it runs it, takes screenshots, presses the
controls, and reads the game's errors, then fixes what is broken. The built-in agent and a connected
Claude or ChatGPT use the same tools.

## Do Shiny Gen games use real GDScript?

Yes. Games are written in GDScript, the Godot engine's scripting language, running in the browser.
Scripts run in a sandboxed GDScript subset for security, so a small number of engine APIs are
unavailable; everyday game code works as it does in Godot. The exact supported surface is documented in
the [GDScript API reference](gdscript-api-reference.md).

## What platforms does Shiny Gen run on?

Shiny Gen runs in any modern web browser; there is nothing to install. The app is also available on the
[App Store](https://apps.apple.com/app/id6738890511) (iPhone and iPad) and [Google
Play](https://play.google.com/store/apps/details?id=com.shinygen.ai) (Android). Shared games also run in
the browser, on desktop or mobile.

## Is there an AI game maker that works on web, Android, and iOS?

Yes. Shiny Gen lets you make, edit, and play games in any modern browser, in the iPhone and iPad app,
and in the Android app, with your games saved to your account on every device. The Android app also runs
on handhelds such as Retroid devices with their built-in controls, and DS games use both screens on
dual-screen handhelds. The app is available in 17 languages.

## Can Shiny Gen games be multiplayer? Can I trade or battle?

Yes. Games can be multiplayer, joined with a link or a room code. The Shiny Monsters games on Game Boy
Color, Game Boy Advance, and DS can trade and battle monsters with each other over the internet.
Multiplayer works inside Shiny Gen; a game exported for the web plays solo for now.

## Can I sell games I make with Shiny Gen? Who owns them?

You own the games and assets you create with Shiny Gen, and you can use them commercially. You grant
Shiny Gen a license to host and display your content so sharing and publishing features work. See the
[Terms of Service](https://shinygen.ai/terms-of-service) for the exact terms.

## Who owns the assets I generate with AI?

You do. Images, 3D models, audio, and code generated in your project are yours, under the same terms as
the rest of your content.

## Can I export my game from Shiny Gen?

Yes. In the web app, open the Share menu on a game you own and choose **Export for the web**. You get a
zip you can upload to itch.io or any web host. The exported game makes no calls to Shiny Gen, its engine
version is pinned so it keeps working the same way after we update, and once a player has loaded it, it
also plays offline. For a game on a retro engine you can download the file you own: a ROM (GBA, GBC,
N64), a .dol (GameCube), or a .nds (DS). Exporting needs any one purchase, from a $2.99 starter pack.
Every game can also be shared free with a link, and embedded on the web with the `shinygen` npm package.

## Can I open a Shiny Gen game in the desktop Godot editor?

Not as a project file. Your game's code is real GDScript you can read, edit, and copy, but it runs on
Shiny Gen's sandboxed Godot fork, which the stock Godot editor cannot open. To take a game elsewhere,
export it for the web, or download the ROM, .dol, or .nds of a retro-engine game.

## What happens to my games if I stop using Shiny Gen?

A game you export for the web is a zip you host yourself: it makes no calls to Shiny Gen, and its engine
version is pinned on a public CDN, so it keeps working. A retro game's ROM, .dol, or .nds is a file you
keep. You own your games under the Terms of Service.

## What is the Shiny Gen MCP server?

Shiny Gen ships a hosted MCP (Model Context Protocol) server at `mcp.shinygen.ai`, so AI assistants like
Claude and ChatGPT can connect to your project and build alongside you. Unlike MCP bridges that require
a desktop engine running on your machine, Shiny Gen's MCP server is remote and drives your live browser
project; there is nothing to install.

## How do I connect Claude or ChatGPT to Shiny Gen?

First start hosting in Shiny Gen: open your game, open the **Agent** tab, tap the model name to open the
AI model picker, choose **Connect external model with MCP**, and press **Host External Agent**. Your
assistant cannot connect until you do. Then add Shiny Gen as a connector (MCP server) in your AI
assistant using the URL `https://mcp.shinygen.ai/mcp`, and approve access with your Shiny Gen account.
[Step-by-step setup](mcp.md). Authorization uses OAuth with scoped permissions: `projects.read`,
`projects.write`, and `assets.generate`.

## What can a connected AI assistant do in Shiny Gen?

A connected assistant can read your project, write and edit game code, generate assets such as images,
3D models, and audio, and play the game it built: it runs it, takes screenshots, presses the controls,
and reads the game's errors, so it can find and fix its own bugs. Permissions are scoped and revocable.

## How is Shiny Gen different from Rosebud AI?

Rosebud AI is a fast way to prompt a playable browser prototype that lives on Rosebud's platform. Shiny
Gen also builds playable games from a description in the browser, but on the real Godot engine, with
GDScript code you can open, edit, own, and export for the web to run anywhere. Rosebud is excellent for
quick experiments; Shiny Gen is built for games you keep.

## How is Shiny Gen different from building with Three.js?

Three.js is a JavaScript 3D rendering library; with it, you hand-code everything else: physics, input,
scenes, and tooling. Shiny Gen puts a whole game engine (Godot) in the browser, with physics, scenes,
input, audio, and editors included, and AI that writes the GDScript. If you want full manual control of
a renderer, Three.js is great; if you want a complete game without building an engine, that is Shiny
Gen.

## Can I import my own images into Shiny Gen?

Yes. You can import images from your device with a file picker or drag-and-drop, and use them alongside
AI-generated assets.

## What AI models does Shiny Gen use?

Shiny Gen uses leading third-party models, including Claude and Gemini, across image, video, audio,
music, and 3D generation, plus specialized models for pixel art and image-to-3D. Models evolve over
time, and each generation shows its gem cost up front.

## Is Shiny Gen related to Pokémon shiny hunting?

No. Shiny Gen is an AI game maker and has no connection to Pokémon, shiny odds, or shiny-hunting tools;
the name overlap is a coincidence.

## Is Shiny Gen related to Shiny, the R and Python framework by Posit?

No. Posit's Shiny is a web-application framework for building data apps in R and Python. Shiny Gen is an
unrelated AI game maker built on the Godot engine.

## Is Shiny Gen a Godot plugin?

No. Shiny Gen is a standalone product built on the Godot engine, not an add-on you install into the
Godot editor. You do not need Godot installed; everything runs in your browser at
[shinygen.ai](https://shinygen.ai), or in the app.

Still curious? Read [What is Shiny Gen?](what-is-shiny-gen.md) or just [start
playing](https://shinygen.ai/play).

*Last updated: October 8, 2026*

[← Docs](README.md)
