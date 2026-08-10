# Frequently asked questions

> Canonical version: **<https://shinygen.ai/faq>**

Everything about Shiny Gen: pricing, the Godot engine, platforms, ownership, export, and connecting AI
assistants. New here? Start with [What is Shiny Gen?](what-is-shiny-gen.md)

## What is Shiny Gen?

Shiny Gen is an AI game maker that runs in your browser: describe a game, play it, and edit its assets,
code, and world with built-in AI tools. Games run on the Godot engine and are written in GDScript. It is
free to use, with paid gem credits for AI generation only.

## Is Shiny Gen free to use?

Yes. Shiny Gen is free to use, and no subscription is required. Building, playing, and sharing games
costs nothing; AI generation spends gem credits. New accounts start with free gems, and you can buy gem
packs that never expire, or an optional membership that adds monthly gems.

## Is Shiny Gen built on the Godot engine?

Yes. Shiny Gen is built on the Godot engine, a customized Godot fork with a WebGPU renderer, compiled to
WebAssembly so the whole engine runs in your browser. Game code is GDScript, Godot's scripting language.

## Do I need to know how to code to use Shiny Gen?

No. You describe what you want in plain language and Shiny Gen's AI writes the game code for you. The
code is always there to open and edit if you want to learn or fine-tune, but you never have to.

## Do Shiny Gen games use real GDScript?

Yes. Games are written in GDScript, the Godot engine's scripting language, running in the browser.
Scripts run in a sandboxed GDScript subset for security, so a small number of engine APIs are
unavailable; everyday game code works as it does in Godot. The exact supported surface is documented in
the [GDScript API reference](gdscript-api-reference.md).

## What platforms does Shiny Gen run on?

Shiny Gen runs in any modern web browser; there is nothing to install. iOS and Android apps are coming
soon. Shared games also run in the browser, on desktop or mobile.

## Can I sell games I make with Shiny Gen? Who owns them?

You own the games and assets you create with Shiny Gen, and you can use them commercially. You grant
Shiny Gen a license to host and display your content so sharing and publishing features work. See the
[Terms of Service](https://shinygen.ai/terms-of-service) for the exact terms.

## Who owns the assets I generate with AI?

You do. Images, 3D models, audio, and code generated in your project are yours, under the same terms as
the rest of your content.

## Can I export my game from Shiny Gen?

Yes. A game can be downloaded as a single HTML file that runs on any website, with its engine version
pinned so it keeps working identically forever (the page streams the engine from a CDN). Every game can
also be shared instantly with a link, and games can be embedded on the web with the `shinygen` npm
package.

## What is the Shiny Gen MCP server?

Shiny Gen ships a hosted MCP (Model Context Protocol) server at `mcp.shinygen.ai`, so AI assistants like
Claude and ChatGPT can connect to your project and build alongside you. Unlike MCP bridges that require
a desktop engine running on your machine, Shiny Gen's MCP server is remote and drives your live browser
project; there is nothing to install.

## How do I connect Claude or ChatGPT to Shiny Gen?

Add Shiny Gen as a connector (MCP server) in your AI assistant using the URL
`https://mcp.shinygen.ai/mcp`, then approve access with your Shiny Gen account. Authorization uses OAuth
with scoped permissions: `projects.read`, `projects.write`, and `assets.generate`. See
[Connect Claude or ChatGPT](mcp.md).

## What can a connected AI assistant do in Shiny Gen?

A connected assistant can read your project, write and edit game code, generate assets such as images,
3D models, and audio, run the game, and see the results. Permissions are scoped and revocable.

## How is Shiny Gen different from Rosebud AI?

Rosebud AI is a fast way to prompt a playable browser prototype that lives on Rosebud's platform. Shiny
Gen also builds playable games from a description in the browser, but on the real Godot engine, with
GDScript code you can open, edit, own, and export as an HTML file that runs anywhere. Rosebud is
excellent for quick experiments; Shiny Gen is built for games you keep.

## How is Shiny Gen different from building with Three.js?

Three.js is a JavaScript 3D rendering library; with it, you hand-code everything else: physics, input,
scenes, and tooling. Shiny Gen puts a whole game engine (Godot) in the browser, with physics, scenes,
input, audio, and editors included, and AI that writes the GDScript. If you want full manual control of
a renderer, Three.js is great; if you want a complete game without building an engine, that is Shiny Gen.

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
Godot editor. You do not need Godot installed; everything runs at [shinygen.ai](https://shinygen.ai) in
your browser.

---

Still curious? Read [What is Shiny Gen?](what-is-shiny-gen.md) or just
[start playing](https://shinygen.ai/play).

[← Docs](README.md)
