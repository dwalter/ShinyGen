# Connect Claude or ChatGPT to Shiny Gen

> Canonical version: **<https://shinygen.ai/docs/mcp>**

Shiny Gen ships a hosted MCP server at `https://mcp.shinygen.ai/mcp`. Connect an AI assistant (Claude,
ChatGPT, or any MCP client) and it can build, edit, and play-test your Shiny Gen project. There is
nothing to install: unlike MCP integrations that bridge to a desktop engine running on your machine,
Shiny Gen's server is remote and operates the project in a Shiny Gen tab, either yours or the AI's own.

There are two ways in, and only one needs your app open:

- **Host from your open app** (below): press **Host External Agent**, connect your assistant, and watch
  it work in your app. It works while that app stays open.
- **Give your AI an agent session link** ([below](#let-your-ai-run-shiny-gen-itself-nothing-open-on-your-side)):
  the AI opens the link in its own browser and runs Shiny Gen there, so nothing has to stay open on your
  side. Your AI needs to be able to run a browser; code that starts a headless Chromium counts.

> MCP (Model Context Protocol) is an open standard that lets AI assistants use external tools. Shiny Gen
> exposes its editors and generation models as MCP tools.

## Connect from your open app

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

**Keep Shiny Gen open for this way:** the assistant operates your live session, so the app must stay
open while it works. Hosting stays open as long as the app is. To let your AI work with your app closed,
use an agent session link instead (next section).

## Let your AI run Shiny Gen itself (nothing open on your side)

With an agent session link, the AI runs Shiny Gen in its own browser, and your app can be closed the
whole time.

1. Make the link. For a new game (or a remix), press **+** and then **Link** under **Bring your own
   agent**. For a game you have open, open the model picker, choose **Connect external model with MCP**,
   then **Create an agent session link**.
2. Choose how long the session lasts: 1 hour or 24 hours.
3. Press **Copy link** and paste it to your AI. The copy includes a short note that tells it how to open
   the link. That is all you do: you can close Shiny Gen.

The link looks like `https://shinygen.ai/agent_session#...`; the part after the `#` is a one-time code
that browsers never send to a server. Your AI opens the whole link in a browser (a headless Chromium its
own code starts is fine), gets a Shiny Gen editor on that game, and connects its MCP client to
`https://mcp.shinygen.ai/mcp` with the token the page leaves, with no registration or consent step.
Limits: the link works once, within an hour; your account has one live agent session at a time, so a
newer link ends the older one; up to 10 unused links can wait at once; while a session runs, your own
copy of that game opens read-only with an **End agent session** button; and you can see and revoke
sessions under **Agent access and spending**. Gems work exactly as they do for any connected assistant.
Full details, including resuming a session after the AI's browser closes:
[shinygen.ai/docs/mcp](https://shinygen.ai/docs/mcp#agent-session).

## If the connection fails

- **The assistant says Shiny Gen is not hosting an external agent:** press **Host External Agent** in the
  app (the first step above), then connect again. If Shiny Gen was closed or lost its connection, hosting
  stopped with it: press the button again, or give your AI an agent session link so it does not depend
  on your app.
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
