# Connect Claude or ChatGPT to Shiny Gen

> Canonical version: **<https://shinygen.ai/docs/mcp>**

Shiny Gen ships a hosted MCP server at `https://mcp.shinygen.ai/mcp`. Connect an AI assistant (Claude,
ChatGPT, or any MCP client) and it can build, edit, and play-test your Shiny Gen project, live in your
browser. There is nothing to install: unlike MCP integrations that bridge to a desktop engine running on
your machine, Shiny Gen's server is remote and operates the project in your open browser tab.

> MCP (Model Context Protocol) is an open standard that lets AI assistants use external tools. Shiny Gen
> exposes its editors and generation models as MCP tools.

## Connect

**Start hosting in Shiny Gen:** open your game at [shinygen.ai](https://shinygen.ai), open the **Agent**
tab, tap the model name to open the AI model picker, choose **Connect external model with MCP**, and
press **Host External Agent**. The app shows "Waiting for your AI to connect". Your assistant cannot
connect until you do this, once per session, and the steps for each client appear right there in the app.

**Claude (web or desktop):** add a custom connector in Settings and paste the server URL:

```
https://mcp.shinygen.ai/mcp
```

**Claude Code:**

```
claude mcp add --transport http shinygen https://mcp.shinygen.ai/mcp
```

**ChatGPT or any other MCP client:** add the same URL wherever your client configures connectors or MCP
servers.

**Approve access:** your browser opens a Shiny Gen consent page. Sign in and approve. Authorization uses
OAuth, and you can disconnect at any time.

**Keep Shiny Gen open:** the assistant operates your live session, so the app must stay open while it
works. Hosting stays open as long as the app is.

## If the connection fails

- **The assistant says Shiny Gen is not hosting an external agent:** press **Host External Agent** in the
  app (the first step above), then connect again. If Shiny Gen was closed or lost its connection, hosting
  stopped with it: press the button again.
- **No sign-in window appeared, and the client says the connection failed:** your browser is almost
  certainly blocking the pop-up. Allow pop-ups for your AI client's site and connect again.
- **Check the URL includes the path:** the server address is `https://mcp.shinygen.ai/mcp`. The host on
  its own is not the endpoint.
- **The assistant says agent access is switched off:** "Allow AI agents to connect" is off for your
  account. The consent page offers to turn it back on, or turn it on in the app under **Agent access &
  spending**.

## Permissions

| Scope | What it allows |
|---|---|
| `projects.read` | See your project: what is on screen, the focused document, and its current state. |
| `projects.write` | Write and edit game code and asset documents. Code edits are free. |
| `assets.generate` | Run AI generation (images, 3D models, audio); this spends your gems, and a daily gem cap limits how much a connected assistant can spend in one day. |

## What a connected assistant can do

- Read what is on screen and which document is focused.
- Write or patch the game's GDScript; the game compiles, runs, and reports errors back with line numbers.
- Start a **new game** for you, list the games in your account, and open any one of them, so you can say "go back to the platformer" and it will.
- Take screenshots to see what you see, including frame bursts to check motion.
- Press keys and actions on the running game to play-test what it built, including whole input timelines when a game needs two controls at once.
- Generate images, 3D models, and audio with Shiny Gen's generation models, browse and restore earlier versions of an asset, and remove an image's background.
- Build and edit 3D models and 2D art as code, and render views of a model to check it.
- Get a share link for the game it has been working on.

## What it costs, and the limits

Connecting is free, and **writing code is always free**; only AI generation spends gems. Two separate
limits apply to an assistant working in your project:

- **A daily gem cap.** Caps how many gems a connected assistant can spend in a single day, so an
  assistant left running cannot drain your balance. Every paid result reports your gems before, spent,
  and remaining.
- **A weekly action allowance on the free tier.** Your first connection starts a **30-day
  full-connector trial**. After that, free accounts get an allowance of assistant actions that change
  something (writing code, generating, running the game) per week, currently 300, reset every
  Monday (UTC). **Reading is never limited**, and **anyone who has made a purchase is not subject to
  this allowance** at all.
  The connector reports your current status and when the allowance resets.

## The AI agent built into the app

You do not need an outside assistant at all: Shiny Gen has its own AI agent built into the app, with
the same abilities described on this page: it reads your project, writes game code, generates assets,
and play-tests what it builds. Connect Claude or ChatGPT when you would rather drive from a tool you
already use; otherwise the in-app agent is right there.

Both work the same way where it counts: generation spends gems, and the daily gem cap and the free-tier
weekly allowance apply to both. The difference is who runs the model. An outside assistant runs on your
own AI plan, so its code editing costs no gems. The built-in agent's model runs on Shiny Gen, so each of
its chat steps spends gems; the model picker shows what each model costs.

## The docs travel with the connector

Once connected, the assistant automatically receives Shiny Gen's language references and the exact API
surface for game code, served through the connector itself. You do not need to teach your assistant
anything or paste documentation; it looks up the contract as it works.

The same game-code surface is published here as the
[GDScript API reference](gdscript-api-reference.md).

## Safety

- Permissions are scoped and revocable; disconnect at any time.
- Everything the assistant does happens in your open tab; you watch edits live and can pause or stop it from the app.
- Writing code is free; only AI generation spends gems, with a daily gem cap for connected assistants. Every generation reports your remaining balance.

---

Questions? See the MCP section of the [FAQ](faq.md) or [contact support](support.md).

[← Docs](README.md)
