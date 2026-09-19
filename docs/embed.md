# Embed Shiny Gen games on your website

> Canonical version: **<https://shinygen.ai/docs/embed>**

A Shiny Gen game can run natively on any web page (your portfolio, blog, or game site) via the
`shinygen` npm package. One script tag loads the engine, and it runs the game's GDScript directly on
your page. It is **not an iframe**: the engine boots on your canvas. By default it picks the engine per
device: a desktop gets WebGPU when it supports it, and phones, tablets and browsers without WebGPU get WebGL.

## The easy way: export your game

In the Shiny Gen web app, open the **Share** menu on a game you own and choose **Export for the web**. You
get a zip with the page, your game, and a README, pinned to an exact engine version so the page keeps
working the same way. Upload the zip to itch.io, or put the files on any web host. Opening the page
straight from your disk does not work, because the browser will not let it load the game file; the
README explains how to test it on your own computer.

## Build your own page

For full control, put the engine script tag and your game's GDScript on any page:

```html
<!doctype html>
<canvas id="canvas"></canvas>

<script src="https://cdn.jsdelivr.net/npm/shinygen@4.6.5/shinygen.js"></script>
<script type="text/gdscript" name="Main">
extends Node3D

var cube: MeshInstance3D

func _ready():
    var camera = Camera3D.new()
    camera.transform.origin = Vector3(0.0, 2.0, 4.5)
    camera.look_at(Vector3(0.0, 0.8, 0.0))
    camera.fov = 55.0
    add_child(camera)

    var light = DirectionalLight3D.new()
    light.light_energy = 1.5
    light.light_color = Color(1.0, 0.9, 0.7)
    light.rotation_degrees = Vector3(-40.0, -30.0, 0.0)
    add_child(light)

    cube = MeshInstance3D.new()
    var box = BoxMesh.new()
    box.size = Vector3(2.0, 2.0, 2.0)
    cube.mesh = box
    cube.transform.origin = Vector3(0.0, 1.0, 0.0)

    var mat = StandardMaterial3D.new()
    mat.albedo_color = Color(0.9, 0.15, 0.1)
    mat.metallic = 0.25
    mat.roughness = 0.35
    cube.set_surface_override_material(0, mat)
    add_child(cube)

func _process(delta):
    cube.rotation.y += delta * 1.2
    cube.rotation.x += delta * 0.5
</script>
<script>
  ShinyGen.start({ canvas: "#canvas" });
</script>
```

Replace the script body with your own game's GDScript from Shiny Gen's code editor.

## Using npm and bundlers

`npm install shinygen` works too. The engine resolves all of its files relative to `shinygen.js`, so you
can serve the package from any static host, CDN, or bundler with no configuration.

## Options

```js
ShinyGen.start({
  canvas: "#canvas",   // selector or element (required)
  renderer: "auto",    // "auto" (default: chosen per device), "webgpu" or "webgl" (one engine, no fallback)
  engineBase: "...",   // where the lanes live (default: beside shinygen.js)
  i18n: true,          // opt-in: fetch ICU data (~2.2 MB) for complex-script text
  brotliWasm: false,   // opt-out of the .br engine fetch (default: on)
});
```

After boot, `ShinyGen.renderer` reports which engine is running (`"webgpu"` or `"webgl"`).

## Requirements

- **Default: either engine, chosen per device** (no `renderer`, or `renderer: "auto"`): the same choice the Shiny Gen web app makes. Phones and tablets get the WebGL engine; a desktop gets WebGPU when it has a hardware adapter and device, WebGL otherwise. If the WebGPU engine fails to start or loses its device, the page reloads once into WebGL and remembers that for the tab. `?lane=webgl` or `?lane=webgpu` pins a lane for 30 days, and `?lane=auto` clears the pin.
- **WebGPU engine only** (`renderer: "webgpu"`): a WebGPU-capable browser (Chrome/Edge 113+ on desktop; recent Safari and Firefox). No fallback: `ShinyGen.start()` reports a clear on-canvas message when WebGPU is unavailable, and `?lane=` is ignored.
- **WebGL engine only** (`renderer: "webgl"`): any WebGL2 browser, effectively all modern browsers. Renders with the engine's Compatibility renderer: full 2D and core 3D (PBR forward rendering, shadows), without the WebGPU-only effects (volumetric fog, SDFGI/VoxelGI and most screen-space effects). `?lane=` is ignored.

## Good to know

- The engine ships brotli-compressed (**~8.7 MB** over the wire for the WebGPU engine, **~6.6 MB** for the WebGL engine; decompressed in the browser), streamed from the CDN or your host. Only the engine your page boots is downloaded, and embedded pages need a network connection to load.
- Pin a version and your page keeps working the same way regardless of later engine releases.
- Games are written in GDScript, the Godot engine's scripting language, running in a sandboxed subset. The exact supported surface is the [GDScript API reference](gdscript-api-reference.md).
- You own the games you make and can publish them commercially. See the [FAQ](faq.md).

## License

The Shiny Gen Engine is proprietary, closed source. **Free to use — including commercially — to make
games**, provided you keep the "Made with Shiny Gen" notice visible (it shows at boot by default). You
may **not** use it to build a competing game maker, engine, asset editor/generator, or game catalog, or
to train an AI model, without a separate enterprise license (contact dwalter@shinygen.ai). The full
terms in [`LICENSE-ENGINE.txt`](../LICENSE-ENGINE.txt) govern. Embedded third-party components
(including a modified Godot Engine, MIT) are listed in the package's `THIRD_PARTY_NOTICES.txt`.

---

[← Docs](README.md) · [shinygen on npm](https://www.npmjs.com/package/shinygen)
