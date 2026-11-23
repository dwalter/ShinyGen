# Frequently asked questions

> Canonical version: **<https://shinygen.ai/faq>**

Everything about Shiny Gen: pricing, the engines, platforms, ownership, export, and connecting AI
assistants. New here? Start with [What is Shiny Gen?](what-is-shiny-gen.md)

## What is Shiny Gen?

Shiny Gen is an AI game maker: describe a game, play it, and edit its assets, code, and world with
built-in AI tools, in your browser or on your phone. Games are real projects you own, on a real engine:
the Godot engine in GDScript, or one of five retro engines we built (GBA, GBC, N64, GameCube, and DS)
whose games compile to a real file you can download (a ROM, a GameCube .dol, or a DS .nds). It is free
to make, play, and share games; AI generation uses gems, and new accounts get 30 free gems.

## What engines can I make games for?

You choose the engine when you start a game, and there are six. The Godot engine makes real Godot
projects written in GDScript. The five retro engines are engines we built for GBA, GBC, N64, GameCube,
and DS games, and each one compiles your game into a real file you can download and keep: a ROM for GBA,
GBC, and N64, a .dol for GameCube, or a .nds for DS (exporting the file requires a purchase). The retro engines are not emulators and not ROM loaders: they compile games you
make in Shiny Gen, and cannot play commercial or third-party ROMs.

## Can AI make a Game Boy Advance (GBA) game?

Yes. Start a new game in Shiny Gen, pick the GBA Engine and describe the game. The AI builds a real GBA
game, then plays it with the keypad to find and fix bugs, and you keep changing it by chat. Exporting
the .gba ROM requires a purchase. The ROM plays in GBA emulators and on a
real Game Boy Advance through a flash cart (we have played them on a Game Boy Advance and a DS Lite,
saves included). More: [AI GBA game maker](https://shinygen.ai/gba-ai).

## Can I make a Game Boy Color (GBC) game with AI?

Yes. Pick the GBC Engine when you start a game. The AI writes and compiles a real Game Boy Color game
that you can play right away in the browser or the app. You can export the ROM (requires a purchase) and play it on real hardware through a flash cart. More:
[AI Game Boy Color game maker](https://shinygen.ai/gbc-ai).

## Can AI make a DS, N64, or GameCube game?

Yes. Shiny Gen has a DS Engine that uses both screens, an N64 Engine, and a GameCube Engine, all engines
we built. Each one compiles the game you describe into a real file you can download: a .nds for DS, a
ROM for N64, and a .dol for GameCube. Exporting the file requires a purchase. More: [Export your game as a ROM](https://shinygen.ai/export-rom).

## Is there a free AI game maker with no coding?

Shiny Gen is one. Making, playing, and sharing games is free, and you describe the game in plain words
instead of writing code; the AI builds it and plays it to fix bugs. AI generation uses gems, and new accounts get 30 free gems. Exporting a game as a file requires a purchase.

## Is Shiny Gen free to use?

Yes. Making, playing, sharing, and remixing games is free, and no subscription is required. AI
generation spends gems: new accounts start with 30 free gems, once your gems run out you get one free AI
agent prompt each day, and you can buy a $2.99 starter pack, gem
packs that never expire, or an optional membership that adds monthly gems. Exporting your games as files (a web zip, a ROM, a .dol, or a .nds) requires a purchase. If you connect your own Claude or
ChatGPT, the code it writes costs no gems. Prices: [shinygen.ai/pricing](https://shinygen.ai/pricing).

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

## Can I show the AI a photo?

Yes, in the iPhone, iPad, and Android apps. Tap the photo button in the agent chat to attach a
picture from your library or take one with the camera, and the AI uses it as a reference: a sketch
of a level, a pet to turn into a character, or a screenshot of a style you like. Photos are not in
the web app yet.

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

## Is there a Shiny Gen desktop app?

The web app is the desktop version. The full engine and editors run in your browser on Windows, Mac,
Linux, and Chromebooks, with nothing to install, and the first load is about 17 MB. Phones and tablets get
the iPhone, iPad, and Android apps. On a Mac with Apple silicon, the iPad app also installs from the Mac App Store. This is about Shiny Gen itself: a game you make is exported for the
web as a zip or as a retro ROM, .dol, or .nds file (exporting requires a purchase), not as
a native desktop or mobile app.

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

Yes. You own the games and assets you create with Shiny Gen, including AI-generated art, models, audio,
and code, and the Terms of Service allow personal and commercial use. To sell a game, export it for the
web as a zip and publish it on itch.io or any store or site that sells web games, or download a retro
game's ROM, .dol, or .nds file. Exporting requires a purchase, and Shiny
Gen takes no revenue share. As with any game, you need the rights to whatever you put in it. You grant
Shiny Gen a license to use your content to run and improve the service; see the
[Terms of Service](https://shinygen.ai/terms-of-service), section 4.

## Who owns the assets I generate with AI?

You do. Images, 3D models, audio, and code generated in your project are yours, under the same terms as
the rest of your content.

## Can I export my game from Shiny Gen?

Yes. In the web app, open the Share menu on a game you own and choose **Export for the web**. You get a
zip you can upload to itch.io or any web host. The exported game makes no calls to Shiny Gen, its engine
version is pinned so it keeps working the same way after we update, and once a player has loaded it, it
also plays offline. For a game on a retro engine you can download the file you own: a ROM (GBA, GBC,
N64), a .dol (GameCube), or a .nds (DS). Exporting requires a purchase.
In the Android app, version 1.1.38 or later saves the file; on an older version, update the app or use
a browser. Every game can also be shared free with a link, and embedded on the web with the `shinygen` npm package.

## Can I open a Shiny Gen game in the desktop Godot editor?

Not as a project file. Your game's code is real GDScript you can read, edit, and copy, but it runs on
Shiny Gen's sandboxed Godot fork, which the stock Godot editor cannot open. To take a game elsewhere,
export it for the web, or download the ROM, .dol, or .nds of a retro-engine game.

## Can I download my game's source code?

Not as a project download. Your game's code is real GDScript you can read and copy in the app, but
it runs on Shiny Gen's own engine, a Godot 4.6.2 fork with a lot added, so a source export would not run
in stock Godot. That is why exports are a web zip that runs anywhere, or a retro ROM, .dol, or .nds file.
Exporting requires a purchase.

## What happens to my games if I stop using Shiny Gen, or if it shuts down?

Exported games keep working without Shiny Gen. A game exported for the web is a zip you host yourself:
it makes no calls to Shiny Gen, its engine is pinned to an exact version of the public `shinygen`
package on a public CDN, and once loaded it plays offline. A retro game's ROM, .dol, or .nds is a file
you keep and can play without Shiny Gen. Games you have not exported live in your Shiny Gen account, so
export the ones you want a copy of. You own your games under the Terms of Service, and you can
[delete your account and its data](https://shinygen.ai/delete-data) at any time.

## What is the Shiny Gen MCP server?

Shiny Gen ships a hosted MCP (Model Context Protocol) server at `mcp.shinygen.ai`, so AI assistants like
Claude and ChatGPT can connect to your project and build alongside you. Unlike MCP bridges that require
a desktop engine running on your machine, Shiny Gen's MCP server is remote and drives your live browser
project; there is nothing to install.

## How do I connect Claude or ChatGPT to Shiny Gen?

There are two ways. **From your open app:** open your game, open the **Agent** tab, tap the model name
to open the AI model picker, choose **Connect external model with MCP**, and press **Host External
Agent**. Your assistant cannot connect this way until you do. Then add Shiny Gen as a connector (MCP
server) in your AI assistant using the URL `https://mcp.shinygen.ai/mcp`, and approve access with your
Shiny Gen account. Authorization uses OAuth with scoped permissions: `projects.read`, `projects.write`,
and `assets.generate`. This way works while your app stays open. **With an agent session link:** if your
AI can run a browser, give it a link instead, and it runs Shiny Gen in its own browser with nothing open
on your side (see the next answer). [Step-by-step setup](mcp.md).

## Does Shiny Gen have to stay open while my AI works?

No, not if you use an agent session link. Hosting from your open app (**Host External Agent**) works
while that app stays open. An agent session link does not need your app at all: on the **+** screen
press **Link** under **Bring your own agent** (or, for a game you have open, **Create an agent session
link** in the model picker's **Bring your own AI** page), choose 1 hour or 24 hours, and paste the copied
link to your AI. It opens the link in its own browser, which can be a headless browser its code starts,
and runs Shiny Gen there on that game. The link works once, within an hour; your account has one live
agent session at a time; while it runs, your own copy of that game opens read-only; and you can revoke it
any time under **Agent access and spending**.

## What can a connected AI assistant do in Shiny Gen?

A connected assistant can read your project, write and edit game code, generate assets such as images,
3D models, and audio, and play the game it built: it runs it, takes screenshots, presses the controls,
and reads the game's errors, so it can find and fix its own bugs. Permissions are scoped and revocable.

## Does connecting my own AI cost anything?

Connecting is free, and the code a connected assistant writes costs no gems, because it runs on your own
AI plan; only the AI generation it runs spends gems, with a daily gem cap. Accounts that have never made
a purchase get a one-time free allowance of assistant actions that change something (currently 100). It
does not reset. Reading is never limited, and any purchase, from the $2.99 starter pack, removes the
allowance for good. Details: [Connect Claude or ChatGPT](mcp.md).

## Why use Shiny Gen instead of just asking Claude or ChatGPT to make a game?

You can use both. Asked directly, a general AI assistant usually gives you a one-file web game in the
chat, or code for an engine you install, run, and test yourself. Shiny Gen adds what sits around the
code:

- A whole game engine already running in your browser and in the iPhone, iPad, and Android apps: Godot,
  or our GBA, GBC, N64, GameCube, and DS engines, which compile your game to a file you can download.
- AI art, 3D models, sound, and music built into the same project.
- An agent that plays the game it made: it takes screenshots, presses the controls, and reads the
  errors, then fixes what is broken.
- Map, sprite, and code editors, so you can change one thing without regenerating the whole game.
- Share links, multiplayer by link or join code, and web or retro-file export (exporting requires a purchase).

If you already pay for Claude or ChatGPT, connect it to Shiny Gen over [MCP](mcp.md) and it builds in
your live project; the code it writes costs no gems. Asking an assistant directly is still a good fit
for a tiny one-screen game, for any language or engine you like, or for a native desktop or app-store
build, which Shiny Gen does not make yet.

## How is Shiny Gen different from Rosebud?

Rosebud is a browser-based AI game maker for quick 2D, 3D, and voxel games that you share by link. Shiny
Gen is an AI game maker for the browser, iPhone, iPad, and Android that builds on a real engine (Godot in
real GDScript, or five retro engines) and can give you a real console file. Rosebud is the better pick
for a quick browser prototype shared by link, for remixing in its community, or for a Windows build for
Steam on a Pro plan. Shiny Gen is the better fit for the same editor and agent on every device, real
GDScript on the Godot engine, or a real retro-console file. Both are free to start. Full comparison:
[Shiny Gen vs Rosebud](https://shinygen.ai/shiny-gen-vs-rosebud).

## How is Shiny Gen different from GDevelop?

GDevelop is a free, open-source, no-code game engine with an event system and native exports, with AI
helpers added to a conventional editor. Shiny Gen starts from a description instead: an AI agent builds
the game, plays it, and fixes errors, on the Godot engine or one of five retro engines. GDevelop is the
better pick for full control of your game's logic through events and native publishing to desktop and
mobile. Shiny Gen is the better fit for starting from a description, having an agent build and test the
game, or making a real retro-console game. Both are free to start. Full comparison:
[Shiny Gen vs GDevelop](https://shinygen.ai/shiny-gen-vs-gdevelop).

## How is Shiny Gen different from building with a web 3D library?

A web 3D library gives you a renderer; with it, you hand-code everything else: physics, input, scenes,
and tooling. Shiny Gen puts a whole game engine (Godot) in the browser, with physics, scenes, input,
audio, and editors included, and AI that writes the GDScript. If you want full manual control of a
renderer, a library is a good fit; if you want a complete game without building an engine, that is
Shiny Gen.

For more, including when another tool is the better pick, see [Shiny Gen compared](compare.md) and
[AI game makers compared](https://shinygen.ai/compare).

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

*Last updated: November 23, 2026*

[← Docs](README.md)
