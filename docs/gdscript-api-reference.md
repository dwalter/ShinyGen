# GDScript API reference (exact surface)

> This is the same reference Shiny Gen serves to connected AI assistants over its
> [MCP server](mcp.md), published here for people too. It describes the GDScript
> surface available to **game code** in Shiny Gen; see [Getting started](getting-started.md)
> for how to write and run it, and [Embed games on your website](embed.md) for running
> it on your own page. A copy of this file may lag the app; the connector always serves
> the current one.

MACHINE-GENERATED from the runtime's own validation tables — do not edit by hand.
This is the EXACT supported surface: **a class, property, method, or function not
listed here does not exist in this GDScript subset — no exceptions.** A class
inherits its parent's listed members (chains end at Node / Resource). Listed
properties also accept the engine's usual sub-forms (e.g. `position.x`).

Value types (Vector2/3, Color, Transform3D, String, Array, Dictionary, ...) are
NOT enumerated here, and their method set is a SUBSET of standard GDScript — the
common ones are present (`slice` `find` `duplicate` `reverse` `count` `is_empty`
`resize` `merge` `values` `erase` `substr` `replace` `begins_with` `contains`
`strip_edges` `snapped` `rotated` `limit_length` `direction_to` `abs` `floor`
`inverted` ...), but rarer ones are absent (measured missing: `String.format`,
`String.pad_zeros`, `String.num`, `Vector2.bounce`, `Vector2.slide`,
`Color.to_html`, `Color.blend`, `Dictionary.get_or_add`). A missing value-type
method is a RUNTIME error (`no method 'format' on String`), not a compile error,
so it halts the running game rather than coming back in the compile batch — keep
to the common ones. `Array.map` / `filter` / `sort_custom` exist but need a method
reference, since there are no lambdas.

## Nodes (3D)

### Node3D — extends Node
- Properties: position: Vector3, rotation: Vector3, rotation_degrees: Vector3, scale: Vector3, visible: bool, transform: Transform3D, global_transform: Transform3D
- Methods: look_at (1-2 args), look_at_from_position (2-3 args), rotate (2 args), rotate_object_local (2 args), rotate_x (1 arg), rotate_y (1 arg), rotate_z (1 arg), play_animation (1-2 args), stop_animation (0 args), set_part_color (2 args), get_part_color (1 arg), set_tint (1 arg), get_tint (0 args), set_part_visible (2 args), is_part_visible (1 arg), set_draw_on_top (1 arg), is_draw_on_top (0 args), set_depth_push (1 arg), get_depth_push (0 args), reset_appearance (0 args), get_build_params (0 args)

### GeometryInstance3D — extends Node3D *(not instantiable — obtained from the engine)*
- Properties: cast_shadow: int
- Constants: GeometryInstance3D.SHADOW_CASTING_SETTING_OFF, GeometryInstance3D.SHADOW_CASTING_SETTING_ON, GeometryInstance3D.SHADOW_CASTING_SETTING_DOUBLE_SIDED, GeometryInstance3D.SHADOW_CASTING_SETTING_SHADOWS_ONLY

### MeshInstance3D — extends GeometryInstance3D
- Properties: mesh: Mesh, material_override: Material, extra_cull_margin: float
- Methods: set_surface_override_material (2 args), get_surface_override_material (1 arg)

### Camera3D — extends Node3D
- Properties: fov: float, current: bool, near: float, far: float, projection: int, size: float
- Methods: make_current (0 args)
- Constants: Camera3D.PROJECTION_PERSPECTIVE, Camera3D.PROJECTION_ORTHOGONAL, Camera3D.PROJECTION_FRUSTUM

### Light3D — extends Node3D *(not instantiable — obtained from the engine)*
- Properties: light_energy: float, light_color: Color, shadow_enabled: bool, shadow_bias: float, shadow_normal_bias: float, shadow_blur: float

### DirectionalLight3D — extends Light3D
- Properties: directional_shadow_mode: int, directional_shadow_max_distance: float, directional_shadow_blend_splits: bool, shadow_normal_bias: float
- Constants: DirectionalLight3D.SHADOW_ORTHOGONAL, DirectionalLight3D.SHADOW_PARALLEL_2_SPLITS, DirectionalLight3D.SHADOW_PARALLEL_4_SPLITS

### ReflectionProbe — extends Node3D
- Properties: update_mode: int, intensity: float, size: Vector3, origin_offset: Vector3, box_projection: bool, interior: bool, enable_shadows: bool, max_distance: float, ambient_mode: int, ambient_color: Color, ambient_color_energy: float
- Constants: ReflectionProbe.UPDATE_ONCE, ReflectionProbe.UPDATE_ALWAYS, ReflectionProbe.AMBIENT_DISABLED, ReflectionProbe.AMBIENT_ENVIRONMENT, ReflectionProbe.AMBIENT_COLOR

### OmniLight3D — extends Light3D
- Properties: omni_range: float, omni_attenuation: float

### SpotLight3D — extends Light3D
- Properties: spot_range: float, spot_angle: float, spot_attenuation: float, spot_angle_attenuation: float

### Label3D — extends Node3D
- Properties: text: String, font_size: int, pixel_size: float, modulate: Color, outline_size: int, outline_modulate: Color, billboard: int

### CharacterBody3D — extends Node3D
- Properties: velocity: Vector3, collision_layer: int, collision_mask: int
- Methods: move_and_slide (0 args), is_on_floor (0 args), is_on_wall (0 args), is_on_ceiling (0 args)

### StaticBody3D — extends Node3D
- Properties: collision_layer: int, collision_mask: int

### AnimatableBody3D — extends Node3D
- Properties: collision_layer: int, collision_mask: int

### RigidBody3D — extends Node3D
- Properties: mass: float, gravity_scale: float, linear_velocity: Vector3, angular_velocity: Vector3, linear_damp: float, angular_damp: float, sleeping: bool, can_sleep: bool, physics_material_override: PhysicsMaterial, collision_layer: int, collision_mask: int, continuous_cd: bool
- Methods: apply_central_impulse (1 arg), apply_impulse (1-2 args)

### Area3D — extends Node3D
- Properties: monitoring: bool, monitorable: bool, collision_layer: int, collision_mask: int
- Methods: get_overlapping_bodies (0 args), get_overlapping_areas (0 args)
- Signals: body_entered, body_exited, area_entered, area_exited

### CollisionShape3D — extends Node3D
- Properties: shape: Shape3D, disabled: bool

### MultiMeshInstance3D — extends GeometryInstance3D
- Properties: multimesh: MultiMesh, material_override: Material

### GPUParticles3D — extends GeometryInstance3D
- Properties: amount: int, lifetime: float, emitting: bool, one_shot: bool, explosiveness: float, randomness: float, speed_scale: float, local_coords: bool, use_fixed_seed: bool, seed: int, process_material: Material, draw_pass_1: Mesh, visibility_aabb: AABB
- Methods: restart (0 args)

## Nodes (2D)

### Node2D — extends CanvasItem
- Properties: position: Vector2, rotation: float, rotation_degrees: float, scale: Vector2, global_position: Vector2, global_rotation: float

### Marker2D — extends Node2D

### CanvasLayer — extends Node
- Properties: layer: int, visible: bool, offset: Vector2, world_anchored: bool
- Methods: show (0 args), hide (0 args)

### AudioStreamPlayer2D — extends Node2D
- Properties: stream: AudioStream, volume_db: float, pitch_scale: float, autoplay: bool, max_distance: float
- Methods: play (0-1 args), stop (0 args)

### Sprite2D — extends Node2D
- Properties: texture: Texture2D, centered: bool, offset: Vector2, flip_h: bool, flip_v: bool, hframes: int, vframes: int, frame: int, region_enabled: bool, region_rect: Rect2

### Camera2D — extends Node2D
- Properties: offset: Vector2, zoom: Vector2, enabled: bool, limit_left: int, limit_top: int, limit_right: int, limit_bottom: int
- Methods: make_current (0 args)

### Polygon2D — extends Node2D
- Properties: polygon: PackedVector2Array, color: Color, vertex_colors: PackedColorArray, texture: Texture2D

### GPUParticles2D — extends Node2D
- Properties: amount: int, lifetime: float, emitting: bool, one_shot: bool, explosiveness: float, randomness: float, speed_scale: float, local_coords: bool, process_material: Material, texture: Texture2D
- Methods: restart (0 args)

### ParallaxBackground — extends CanvasLayer
- Properties: scroll_base_scale: Vector2, scroll_base_offset: Vector2

### ParallaxLayer — extends Node2D
- Properties: motion_scale: Vector2, motion_offset: Vector2, motion_mirroring: Vector2

### CollisionObject2D — extends Node2D *(not instantiable — obtained from the engine)*
- Properties: collision_layer: int, collision_mask: int

### PhysicsBody2D — extends CollisionObject2D *(not instantiable — obtained from the engine)*

### StaticBody2D — extends PhysicsBody2D
- Properties: physics_material_override: PhysicsMaterial

### AnimatableBody2D — extends StaticBody2D
- Properties: sync_to_physics: bool

### CharacterBody2D — extends PhysicsBody2D
- Properties: velocity: Vector2, up_direction: Vector2, floor_stop_on_slope: bool, floor_constant_speed: bool, floor_snap_length: float, platform_on_leave: int
- Methods: move_and_slide (0 args), is_on_floor (0 args), is_on_wall (0 args), is_on_ceiling (0 args)
- Constants: CharacterBody2D.PLATFORM_ON_LEAVE_ADD_VELOCITY, CharacterBody2D.PLATFORM_ON_LEAVE_ADD_UPWARD_VELOCITY, CharacterBody2D.PLATFORM_ON_LEAVE_DO_NOTHING

### RigidBody2D — extends PhysicsBody2D
- Properties: mass: float, gravity_scale: float, linear_velocity: Vector2, angular_velocity: float, lock_rotation: bool, contact_monitor: bool, max_contacts_reported: int, sleeping: bool, physics_material_override: PhysicsMaterial, continuous_cd: int
- Methods: apply_central_impulse (1 arg), apply_impulse (1-2 args)
- Constants: RigidBody2D.CCD_MODE_DISABLED, RigidBody2D.CCD_MODE_CAST_RAY, RigidBody2D.CCD_MODE_CAST_SHAPE
- Signals: body_entered, body_exited

### Area2D — extends CollisionObject2D
- Properties: monitoring: bool, monitorable: bool
- Methods: get_overlapping_bodies (0 args), get_overlapping_areas (0 args)
- Signals: body_entered, body_exited, area_entered, area_exited

### RayCast2D — extends Node2D
- Properties: enabled: bool, target_position: Vector2, collision_mask: int
- Methods: is_colliding (0 args), get_collider (0 args), force_raycast_update (0 args)

### CollisionShape2D — extends Node2D
- Properties: shape: Shape2D, disabled: bool, one_way_collision: bool, one_way_collision_margin: float

### CollisionPolygon2D — extends Node2D
- Properties: polygon: PackedVector2Array, disabled: bool, one_way_collision: bool, one_way_collision_margin: float

### TileMapLayer — extends Node2D
- Properties: tile_set: TileSet, collision_enabled: bool, enabled: bool
- Methods: set_cell (1-4 args), erase_cell (1 arg), clear (0 args), get_used_cells (0 args), get_cell_source_id (1 arg), get_cell_atlas_coords (1 arg), get_cell_alternative_tile (1 arg)

### TouchScreenButton — extends Node2D
- Properties: texture_normal: Texture2D, texture_pressed: Texture2D, shape: Shape2D, passby_press: bool
- Methods: is_pressed (0 args)
- Signals: pressed, released

## UI (Control)

### Control — extends CanvasItem
- Properties: position: Vector2, global_position: Vector2, size: Vector2, custom_minimum_size: Vector2, scale: Vector2, anchors_preset: int, anchor_left: float, anchor_top: float, anchor_right: float, anchor_bottom: float, offset_left: float, offset_top: float, offset_right: float, offset_bottom: float, grow_horizontal: int, grow_vertical: int, size_flags_horizontal: int, size_flags_vertical: int, size_flags_stretch_ratio: float, mouse_filter: int, focus_mode: int, tooltip_text: String
- Methods: set_anchors_preset (1 arg), grab_focus (0 args), get_combined_minimum_size (0 args), add_theme_color_override (2 args), add_theme_constant_override (2 args), add_theme_font_size_override (2 args), add_theme_stylebox_override (2 args)
- Constants: Control.PRESET_TOP_LEFT, Control.PRESET_TOP_RIGHT, Control.PRESET_BOTTOM_LEFT, Control.PRESET_BOTTOM_RIGHT, Control.PRESET_CENTER_LEFT, Control.PRESET_CENTER_TOP, Control.PRESET_CENTER_RIGHT, Control.PRESET_CENTER_BOTTOM, Control.PRESET_CENTER, Control.PRESET_LEFT_WIDE, Control.PRESET_TOP_WIDE, Control.PRESET_RIGHT_WIDE, Control.PRESET_BOTTOM_WIDE, Control.PRESET_VCENTER_WIDE, Control.PRESET_HCENTER_WIDE, Control.PRESET_FULL_RECT, Control.SIZE_SHRINK_BEGIN, Control.SIZE_FILL, Control.SIZE_EXPAND, Control.SIZE_EXPAND_FILL, Control.SIZE_SHRINK_CENTER, Control.SIZE_SHRINK_END, Control.MOUSE_FILTER_STOP, Control.MOUSE_FILTER_PASS, Control.MOUSE_FILTER_IGNORE, Control.FOCUS_NONE, Control.FOCUS_CLICK, Control.FOCUS_ALL, Control.GROW_DIRECTION_BEGIN, Control.GROW_DIRECTION_END, Control.GROW_DIRECTION_BOTH

### Panel — extends Control

### ColorRect — extends Control
- Properties: color: Color

### TextureRect — extends Control
- Properties: texture: Texture2D, expand_mode: int, stretch_mode: int

### Label — extends Control
- Properties: text: String, horizontal_alignment: int, vertical_alignment: int, autowrap_mode: int

### RichTextLabel — extends Control
- Properties: text: String, bbcode_enabled: bool, fit_content: bool, selection_enabled: bool, scroll_active: bool
- Methods: append_text (1 arg), clear (0 args)

### Container — extends Control *(not instantiable — obtained from the engine)*

### BoxContainer — extends Container *(not instantiable — obtained from the engine)*
- Properties: alignment: int
- Constants: BoxContainer.ALIGNMENT_BEGIN, BoxContainer.ALIGNMENT_CENTER, BoxContainer.ALIGNMENT_END

### VBoxContainer — extends BoxContainer

### HBoxContainer — extends BoxContainer

### PanelContainer — extends Container

### MarginContainer — extends Container

### CenterContainer — extends Container

### TabContainer — extends Container
- Properties: current_tab: int, tabs_visible: bool
- Signals: tab_changed

### SplitContainer — extends Container *(not instantiable — obtained from the engine)*
- Properties: split_offset: int, collapsed: bool

### HSplitContainer — extends SplitContainer

### VSplitContainer — extends SplitContainer

### FoldableContainer — extends Container
- Properties: title: String, folded: bool, title_position: int, foldable_group: FoldableGroup
- Signals: folding_changed

### BaseButton — extends Control *(not instantiable — obtained from the engine)*
- Properties: disabled: bool, toggle_mode: bool, button_pressed: bool, button_group: ButtonGroup
- Signals: pressed, toggled

### Button — extends BaseButton
- Properties: text: String, flat: bool

### LinkButton — extends BaseButton
- Properties: text: String

### CheckBox — extends Button

### CheckButton — extends Button

### ColorPickerButton — extends Button
- Properties: color: Color, edit_alpha: bool
- Signals: color_changed

### OptionButton — extends Button
- Properties: selected: int
- Methods: add_item (1-2 args), clear (0 args), get_item_count (0 args), get_item_text (1 arg), select (1 arg)
- Signals: item_selected

### Range — extends Control *(not instantiable — obtained from the engine)*
- Properties: value: float, min_value: float, max_value: float, step: float
- Signals: value_changed

### ProgressBar — extends Range
- Properties: show_percentage: bool, step: float

### Slider — extends Range *(not instantiable — obtained from the engine)*
- Properties: value: float, editable: bool, ticks_on_borders: bool, tick_count: int

### HSlider — extends Slider

### VSlider — extends Slider

### SpinBox — extends Range
- Properties: value: float, prefix: String, suffix: String, editable: bool

### TextureProgressBar — extends Range
- Properties: fill_mode: int, texture_under: Texture2D, texture_progress: Texture2D, texture_over: Texture2D

### LineEdit — extends Control
- Properties: text: String, placeholder_text: String, editable: bool, max_length: int, secret: bool
- Signals: text_changed, text_submitted

### TextEdit — extends Control
- Properties: text: String, editable: bool
- Signals: text_changed

### ItemList — extends Control
- Properties: select_mode: int, fixed_icon_size: Vector2i
- Methods: add_item (1-3 args), clear (0 args), get_item_count (0 args), get_item_text (1 arg), is_selected (1 arg), select (1-2 args)
- Signals: item_selected

### Tree — extends Control
- Properties: select_mode: int, columns: int, hide_root: bool
- Methods: create_item (0-1 args)
- Signals: item_selected

### Separator — extends Control *(not instantiable — obtained from the engine)*

### HSeparator — extends Separator

### VSeparator — extends Separator

### SubViewportContainer — extends Container
- Properties: stretch: bool, stretch_shrink: int

## Other nodes

### Node
- Properties: name: String, process_mode: int
- Methods: get_tree (0 args), add_child (1 arg), queue_free (0 args), get_node (1 arg), get_node_or_null (1 arg), get_parent (0 args), get_child_count (0 args), get_child (1 arg), get_children (0 args), get_viewport (0 args), set_meta (2 args), get_meta (1-2 args), has_meta (1 arg), remove_meta (1 arg)
- Constants: Node.PROCESS_MODE_INHERIT, Node.PROCESS_MODE_PAUSABLE, Node.PROCESS_MODE_WHEN_PAUSED, Node.PROCESS_MODE_ALWAYS, Node.PROCESS_MODE_DISABLED

### Timer — extends Node
- Properties: wait_time: float, one_shot: bool, autostart: bool, paused: bool, time_left: float
- Methods: start (0-1 args), stop (0 args), is_stopped (0 args)
- Signals: timeout

### CanvasItem — extends Node *(not instantiable — obtained from the engine)*
- Properties: visible: bool, modulate: Color, self_modulate: Color, z_index: int, z_as_relative: bool, top_level: bool, texture_filter: int, material: Material
- Methods: show (0 args), hide (0 args), queue_redraw (0 args), get_viewport_rect (0 args), set_as_top_level (1 arg)
- Constants: CanvasItem.TEXTURE_FILTER_PARENT_NODE, CanvasItem.TEXTURE_FILTER_NEAREST, CanvasItem.TEXTURE_FILTER_LINEAR, CanvasItem.TEXTURE_FILTER_NEAREST_WITH_MIPMAPS, CanvasItem.TEXTURE_FILTER_LINEAR_WITH_MIPMAPS, CanvasItem.TEXTURE_FILTER_NEAREST_WITH_MIPMAPS_ANISOTROPIC, CanvasItem.TEXTURE_FILTER_LINEAR_WITH_MIPMAPS_ANISOTROPIC

### AnimationPlayer — extends Node
- Properties: current_animation: String
- Methods: add_animation_library (2 args), play (1 arg), stop (0 args)

### AudioStreamPlayer — extends Node
- Properties: stream: AudioStream, volume_db: float, pitch_scale: float, autoplay: bool
- Methods: play (0-1 args), stop (0 args)

### WorldEnvironment — extends Node
- Properties: environment: Environment

### EmbedderHost — extends Node *(not instantiable — obtained from the engine)*
- Methods: get_shader (1 arg), load_texture (1 arg), load_audio (1 arg), load_model (1-2 args), load_texture_async (1 arg), load_audio_async (1 arg), load_model_async (1 arg), report_status (1 arg), set_safe_frame_aspect (1 arg), set_tick_mode (1 arg), set_physics_clock (1 arg), get_physics_clock (0 args), set_design_size (2 args), set_design_rect_portrait (4 args), set_virtual_controls (1 arg), set_multiplayer (1 arg), set_tilt_controls (1 arg), game_focused (0 args), app_focused (0 args), set_local_seats (1 arg), local_seats (0 args)

### Viewport — extends Node *(not instantiable — obtained from the engine)*
- Methods: get_visible_rect (0 args), get_texture (0 args), get_camera_3d (0 args), get_mouse_position (0 args)
- Constants: Viewport.DEFAULT_CANVAS_ITEM_TEXTURE_FILTER_NEAREST, Viewport.DEFAULT_CANVAS_ITEM_TEXTURE_FILTER_LINEAR

### SubViewport — extends Viewport
- Properties: size: Vector2i, render_target_update_mode: int, canvas_item_default_texture_filter: int, gui_embed_subwindows: bool
- Constants: SubViewport.UPDATE_DISABLED, SubViewport.UPDATE_ONCE, SubViewport.UPDATE_WHEN_VISIBLE, SubViewport.UPDATE_WHEN_PARENT_VISIBLE, SubViewport.UPDATE_ALWAYS

## Resources & helpers

### Shape3D — extends Resource *(not instantiable — obtained from the engine)*

### BoxShape3D — extends Shape3D
- Properties: size: Vector3

### SphereShape3D — extends Shape3D
- Properties: radius: float

### CapsuleShape3D — extends Shape3D
- Properties: radius: float, height: float

### PhysicsMaterial — extends Resource
- Properties: friction: float, bounce: float

### Tween *(not instantiable — obtained from the engine)*
- Methods: tween_property (4 args), tween_interval (1 arg), tween_callback (1 arg), tween_method (4 args), set_parallel (0-1 args), parallel (0 args), chain (0 args), set_loops (0-1 args), set_trans (1 arg), set_ease (1 arg), stop (0 args), pause (0 args), play (0 args), kill (0 args), is_valid (0 args), is_running (0 args), custom_step (1 arg)
- Constants: Tween.TRANS_LINEAR, Tween.TRANS_SINE, Tween.TRANS_QUINT, Tween.TRANS_QUART, Tween.TRANS_QUAD, Tween.TRANS_EXPO, Tween.TRANS_ELASTIC, Tween.TRANS_CUBIC, Tween.TRANS_CIRC, Tween.TRANS_BOUNCE, Tween.TRANS_BACK, Tween.TRANS_SPRING, Tween.EASE_IN, Tween.EASE_OUT, Tween.EASE_IN_OUT, Tween.EASE_OUT_IN
- Signals: finished

### PropertyTweener *(not instantiable — obtained from the engine)*
- Methods: set_trans (1 arg), set_ease (1 arg), set_delay (1 arg), from (1 arg), from_current (0 args)

### IntervalTweener *(not instantiable — obtained from the engine)*

### CallbackTweener *(not instantiable — obtained from the engine)*
- Methods: set_delay (1 arg)

### MethodTweener *(not instantiable — obtained from the engine)*
- Methods: set_trans (1 arg), set_ease (1 arg), set_delay (1 arg)

### ShinyEntity *(not instantiable — obtained from the engine)*
- Properties: position: Vector3, rotation_degrees: Vector3, height: float, orientation: String, visible: bool, name: String, id: String
- Methods: alive (0 args), get_state (1-2 args), set_state (2 args), run_event (1 arg), add_event (2 args), set_events (2 args), stop_events (0 args), has_running_events (0 args), emit_signal_uid (1 arg), remove (0 args), add_child (1 arg), move_by (1-2 args), jump (0 args), move_toward_player (0-1 args), move_away_player (0-1 args), move_toward (1-2 args)
- Signals: touched, player_collided

### Player — extends ShinyEntity *(not instantiable — obtained from the engine)*
- Methods: dash (0 args), close_attack (0 args), range_attack (0 args)

### Resource *(not instantiable — obtained from the engine)*
- Properties: resource_path: String

### Mesh — extends Resource *(not instantiable — obtained from the engine)*
- Methods: get_aabb (0 args)
- Constants: Mesh.PRIMITIVE_POINTS, Mesh.PRIMITIVE_LINES, Mesh.PRIMITIVE_LINE_STRIP, Mesh.PRIMITIVE_TRIANGLES, Mesh.PRIMITIVE_TRIANGLE_STRIP

### ArrayMesh — extends Mesh

### SurfaceTool — extends Resource
- Methods: begin (1 arg), add_vertex (1 arg), set_normal (1 arg), set_uv (1 arg), set_color (1 arg), set_custom (2 args), set_custom_format (2 args), set_material (1 arg), generate_tangents (0 args), commit (0 args)
- Constants: SurfaceTool.CUSTOM_RGBA8_UNORM, SurfaceTool.CUSTOM_RGBA8_SNORM, SurfaceTool.CUSTOM_RG_HALF, SurfaceTool.CUSTOM_RGBA_HALF, SurfaceTool.CUSTOM_R_FLOAT, SurfaceTool.CUSTOM_RG_FLOAT, SurfaceTool.CUSTOM_RGB_FLOAT, SurfaceTool.CUSTOM_RGBA_FLOAT

### ImmediateMesh — extends Mesh
- Methods: surface_begin (1-2 args), surface_add_vertex (1 arg), surface_set_color (1 arg), surface_set_normal (1 arg), surface_set_uv (1 arg), surface_end (0 args), clear_surfaces (0 args)

### PrimitiveMesh — extends Mesh *(not instantiable — obtained from the engine)*
- Properties: material: Material

### BoxMesh — extends PrimitiveMesh
- Properties: size: Vector3

### SphereMesh — extends PrimitiveMesh
- Properties: radius: float, height: float, radial_segments: int, rings: int

### CylinderMesh — extends PrimitiveMesh
- Properties: top_radius: float, bottom_radius: float, height: float, radial_segments: int, rings: int

### CapsuleMesh — extends PrimitiveMesh
- Properties: radius: float, height: float, radial_segments: int, rings: int

### PlaneMesh — extends PrimitiveMesh
- Properties: size: Vector2, subdivide_width: int, subdivide_depth: int, orientation: int
- Constants: PlaneMesh.FACE_X, PlaneMesh.FACE_Y, PlaneMesh.FACE_Z

### QuadMesh — extends PrimitiveMesh
- Properties: size: Vector2

### PrismMesh — extends PrimitiveMesh
- Properties: size: Vector3, left_to_right: float

### TorusMesh — extends PrimitiveMesh
- Properties: inner_radius: float, outer_radius: float, rings: int, ring_segments: int

### Material — extends Resource *(not instantiable — obtained from the engine)*

### BaseMaterial3D — extends Material *(not instantiable — obtained from the engine)*
- Properties: albedo_color: Color, metallic: float, roughness: float, emission: Color, emission_enabled: bool, emission_energy_multiplier: float, transparency: int, shading_mode: int, blend_mode: int, billboard_mode: int, vertex_color_use_as_albedo: bool, cull_mode: int, no_depth_test: bool, alpha_scissor_threshold: float, texture_filter: int, metallic_specular: float, clearcoat_enabled: bool, clearcoat: float, clearcoat_roughness: float, albedo_texture: Texture2D, emission_texture: Texture2D, use_point_size: bool, point_size: float, disable_receive_shadows: bool, uv1_scale: Vector3, uv1_offset: Vector3, rim_enabled: bool, rim: float, rim_tint: float
- Constants: BaseMaterial3D.TRANSPARENCY_DISABLED, BaseMaterial3D.TRANSPARENCY_ALPHA, BaseMaterial3D.TRANSPARENCY_ALPHA_SCISSOR, BaseMaterial3D.TRANSPARENCY_ALPHA_HASH, BaseMaterial3D.TRANSPARENCY_ALPHA_DEPTH_PRE_PASS, BaseMaterial3D.SHADING_MODE_UNSHADED, BaseMaterial3D.SHADING_MODE_PER_PIXEL, BaseMaterial3D.SHADING_MODE_PER_VERTEX, BaseMaterial3D.BILLBOARD_DISABLED, BaseMaterial3D.BILLBOARD_ENABLED, BaseMaterial3D.BILLBOARD_FIXED_Y, BaseMaterial3D.BILLBOARD_PARTICLES, BaseMaterial3D.BLEND_MODE_MIX, BaseMaterial3D.BLEND_MODE_ADD, BaseMaterial3D.BLEND_MODE_SUB, BaseMaterial3D.BLEND_MODE_MUL, BaseMaterial3D.BLEND_MODE_PREMULT_ALPHA, BaseMaterial3D.CULL_BACK, BaseMaterial3D.CULL_FRONT, BaseMaterial3D.CULL_DISABLED, BaseMaterial3D.TEXTURE_FILTER_NEAREST, BaseMaterial3D.TEXTURE_FILTER_LINEAR, BaseMaterial3D.TEXTURE_FILTER_NEAREST_WITH_MIPMAPS, BaseMaterial3D.TEXTURE_FILTER_LINEAR_WITH_MIPMAPS
- Property aliases: emission_energy → emission_energy_multiplier

### StandardMaterial3D — extends BaseMaterial3D

### Environment — extends Resource
- Properties: background_mode: int, background_color: Color, background_energy_multiplier: float, sky: Sky, ambient_light_source: int, ambient_light_color: Color, ambient_light_energy: float, tonemap_mode: int, tonemap_exposure: float, glow_enabled: bool, glow_intensity: float, glow_strength: float, glow_bloom: float, glow_hdr_threshold: float, glow_hdr_scale: float, tonemap_white: float, ssr_enabled: bool, reflected_light_source: int, glow_blend_mode: int, fog_enabled: bool, fog_light_color: Color, fog_light_energy: float, fog_density: float, fog_sky_affect: float
- Constants: Environment.BG_CLEAR_COLOR, Environment.BG_COLOR, Environment.BG_SKY, Environment.BG_CANVAS, Environment.BG_KEEP, Environment.BG_CAMERA_FEED, Environment.AMBIENT_SOURCE_BG, Environment.AMBIENT_SOURCE_DISABLED, Environment.AMBIENT_SOURCE_COLOR, Environment.AMBIENT_SOURCE_SKY, Environment.TONE_MAPPER_LINEAR, Environment.TONE_MAPPER_REINHARDT, Environment.TONE_MAPPER_FILMIC, Environment.TONE_MAPPER_ACES, Environment.TONE_MAPPER_AGX, Environment.REFLECTION_SOURCE_BG, Environment.REFLECTION_SOURCE_DISABLED, Environment.REFLECTION_SOURCE_SKY, Environment.GLOW_BLEND_MODE_ADDITIVE, Environment.GLOW_BLEND_MODE_SCREEN, Environment.GLOW_BLEND_MODE_SOFTLIGHT, Environment.GLOW_BLEND_MODE_REPLACE, Environment.GLOW_BLEND_MODE_MIX

### Sky — extends Resource
- Properties: sky_material: Material

### ProceduralSkyMaterial — extends Material
- Properties: sky_top_color: Color, sky_horizon_color: Color, sky_curve: float, sky_energy_multiplier: float, ground_bottom_color: Color, ground_horizon_color: Color, ground_curve: float, ground_energy_multiplier: float, sun_angle_max: float, sun_curve: float

### Shader — extends Resource
- Properties: code: String

### ShaderMaterial — extends Material
- Properties: shader: Shader
- Methods: set_shader_parameter (2 args), get_shader_parameter (1 arg)

### Texture2D — extends Resource *(not instantiable — obtained from the engine)*
- Methods: get_width (0 args), get_height (0 args)

### Image — extends Resource *(not instantiable — obtained from the engine)*
- Methods: set_pixel (3 args), get_pixel (2 args), get_width (0 args), get_height (0 args), fill (1 arg)
- Static methods: Image.create (4 args)
- Constants: Image.FORMAT_L8, Image.FORMAT_LA8, Image.FORMAT_R8, Image.FORMAT_RG8, Image.FORMAT_RGB8, Image.FORMAT_RGBA8

### ImageTexture — extends Texture2D
- Methods: set_speed_scale (1 arg), get_speed_scale (0 args), set_paused (1 arg), is_paused (0 args), update (1 arg)
- Static methods: ImageTexture.create_from_image (1 arg)

### AtlasTexture — extends Texture2D
- Properties: atlas: Texture2D, region: Rect2

### AudioStream — extends Resource *(not instantiable — obtained from the engine)*
- Methods: get_length (0 args)

### AudioStreamWAV — extends AudioStream *(not instantiable — obtained from the engine)*

### AudioStreamOggVorbis — extends AudioStream *(not instantiable — obtained from the engine)*

### AudioStreamMP3 — extends AudioStream *(not instantiable — obtained from the engine)*

### Animation — extends Resource
- Properties: length: float, loop_mode: int
- Methods: add_track (1 arg), track_set_path (2 args), value_track_set_update_mode (2 args), track_set_interpolation_type (2 args), track_insert_key (3-4 args)
- Constants: Animation.TYPE_VALUE, Animation.TYPE_POSITION_3D, Animation.TYPE_ROTATION_3D, Animation.TYPE_SCALE_3D, Animation.TYPE_BLEND_SHAPE, Animation.TYPE_METHOD, Animation.TYPE_BEZIER, Animation.TYPE_AUDIO, Animation.TYPE_ANIMATION, Animation.UPDATE_CONTINUOUS, Animation.UPDATE_DISCRETE, Animation.UPDATE_CAPTURE, Animation.LOOP_NONE, Animation.LOOP_LINEAR, Animation.LOOP_PINGPONG, Animation.INTERPOLATION_NEAREST, Animation.INTERPOLATION_LINEAR, Animation.INTERPOLATION_CUBIC

### AnimationLibrary — extends Resource
- Methods: add_animation (2 args)

### FontFile — extends Resource *(not instantiable — obtained from the engine)*

### Gradient — extends Resource
- Methods: add_point (2 args)

### GradientTexture1D — extends Texture2D
- Properties: gradient: Gradient, width: int

### GradientTexture2D — extends Texture2D
- Properties: gradient: Gradient, width: int, height: int, fill_from: Vector2, fill_to: Vector2

### FastNoiseLite — extends Resource
- Properties: noise_type: int, seed: int, frequency: float, fractal_octaves: int, fractal_lacunarity: float, fractal_gain: float
- Constants: FastNoiseLite.TYPE_SIMPLEX, FastNoiseLite.TYPE_SIMPLEX_SMOOTH, FastNoiseLite.TYPE_CELLULAR, FastNoiseLite.TYPE_PERLIN, FastNoiseLite.TYPE_VALUE_CUBIC, FastNoiseLite.TYPE_VALUE

### NoiseTexture2D — extends Texture2D
- Properties: width: int, height: int, seamless: bool, noise: FastNoiseLite, color_ramp: Gradient

### MultiMesh — extends Resource
- Properties: instance_count: int, transform_format: int, use_colors: bool, use_custom_data: bool, mesh: Mesh
- Methods: set_instance_transform (2 args), get_instance_transform (1 arg), set_instance_color (2 args), get_instance_color (1 arg), set_instance_custom_data (2 args), get_instance_custom_data (1 arg)
- Constants: MultiMesh.TRANSFORM_2D, MultiMesh.TRANSFORM_3D

### ParticleProcessMaterial — extends Material
- Properties: direction: Vector3, spread: float, gravity: Vector3, initial_velocity_min: float, initial_velocity_max: float, scale_min: float, scale_max: float, color: Color, color_ramp: Texture2D, emission_shape: int, emission_box_extents: Vector3, emission_sphere_radius: float, emission_ring_axis: Vector3, emission_ring_height: float, emission_ring_radius: float, emission_ring_inner_radius: float, radial_accel_min: float, radial_accel_max: float, tangential_accel_min: float, tangential_accel_max: float
- Constants: ParticleProcessMaterial.EMISSION_SHAPE_POINT, ParticleProcessMaterial.EMISSION_SHAPE_SPHERE, ParticleProcessMaterial.EMISSION_SHAPE_SPHERE_SURFACE, ParticleProcessMaterial.EMISSION_SHAPE_BOX, ParticleProcessMaterial.EMISSION_SHAPE_POINTS, ParticleProcessMaterial.EMISSION_SHAPE_DIRECTED_POINTS, ParticleProcessMaterial.EMISSION_SHAPE_RING

### Shape2D — extends Resource *(not instantiable — obtained from the engine)*

### RectangleShape2D — extends Shape2D
- Properties: size: Vector2

### CircleShape2D — extends Shape2D
- Properties: radius: float

### CapsuleShape2D — extends Shape2D
- Properties: radius: float, height: float

### TileSet — extends Resource
- Properties: tile_size: Vector2i
- Methods: add_physics_layer (0-1 args), set_physics_layer_collision_layer (2 args), set_physics_layer_collision_mask (2 args), add_source (1-2 args), get_source_count (0 args)

### TileSetAtlasSource — extends Resource
- Properties: texture: Texture2D, margins: Vector2i, separation: Vector2i, texture_region_size: Vector2i
- Methods: create_tile (1-2 args), create_alternative_tile (1-2 args), get_tile_data (2 args), has_tile (1 arg), get_tile_texture_region (1-2 args)

### TileData *(not instantiable — obtained from the engine)*
- Properties: flip_h: bool, flip_v: bool, transpose: bool
- Methods: add_collision_polygon (1 arg), set_collision_polygon_points (3 args), set_collision_polygon_one_way (3 args)

### FoldableGroup — extends Resource
- Properties: allow_folding_all: bool

### ButtonGroup — extends Resource

### TreeItem *(not instantiable — obtained from the engine)*
- Methods: set_text (2 args), get_text (1-2 args)

### StyleBox — extends Resource *(not instantiable — obtained from the engine)*
- Properties: content_margin_left: float, content_margin_top: float, content_margin_right: float, content_margin_bottom: float
- Methods: set_content_margin_all (1 arg)

### StyleBoxFlat — extends StyleBox
- Properties: bg_color: Color, draw_center: bool, border_color: Color, border_width_left: int, border_width_top: int, border_width_right: int, border_width_bottom: int, corner_radius_top_left: int, corner_radius_top_right: int, corner_radius_bottom_right: int, corner_radius_bottom_left: int
- Methods: set_corner_radius_all (1 arg), set_border_width_all (1 arg)

### SceneTree *(not instantiable — obtained from the engine)*
- Properties: paused: bool

### InputEventKey — extends Resource
- Properties: keycode: int, physical_keycode: int, pressed: bool, alt_pressed: bool, shift_pressed: bool, ctrl_pressed: bool

### ViewportTexture — extends Texture2D *(not instantiable — obtained from the engine)*

## Globals & facades

### Global host functions
- after (2 args), create_tween (0 args), load (1 arg)

### Time
- Methods: get_ticks_msec (0 args), get_ticks_usec (0 args)

### Input
- Methods: is_action_pressed (1-2 args), is_action_just_pressed (1-2 args), is_action_just_released (1-2 args), get_action_strength (1-2 args), get_axis (2-3 args), get_vector (4-6 args), is_key_pressed (1 arg), get_connected_joypads (0 args), is_joy_button_pressed (2 args), get_joy_axis (2 args), on_joy_connection_changed (1 arg), get_gravity (0 args), get_accelerometer (0 args), get_gyroscope (0 args), get_magnetometer (0 args)

### world
- Methods: set_environment (1 arg), pointer (0 args), pointer_world (0 args), touches (0 args), wheel (0 args), chrome (0 args), budget (0 args), on_surface (2-3 args)

### JSON
- Methods: parse_string (1 arg), stringify (1 arg)

### Engine
- Methods: get_process_frames (0 args), get_physics_frames (0 args)

### InputMap
- Methods: add_action (1-2 args), erase_action (1 arg), has_action (1 arg), action_add_event (2 args)

### Entities
- Methods: find (1 arg), find_all (1 arg), all (0 args), nearby (2 args), player (0 args), spawn (2 args), on_entity_added (1 arg), on_entity_removed (1 arg), on_entity_touched (1 arg), on_signal (2 args)

### Camera
- Methods: follow (1 arg), follow_player (0 args), shake (2 args)

### Settings
- Methods: get_setting (1 arg), set_setting (2 args)

### Save
- Methods: set (2 args), get (1-2 args), delete (1 arg), has (1 arg), clear (0 args), set_min_version (1 arg), get_version (0 args), get_min_version (0 args)

### Room
- Methods: active (0 args), me (0 args), peers (0 args), is_host (0 args), sync (2 args), desync (1 arg), peer_objects (1 arg), send (1 arg), send_to (2 args), on_message (1 arg), on_join (1 arg), on_leave (1 arg), state_set (2 args), state_allow (1 arg), state_get (1-2 args), on_state (1 arg), request_host (0-2 args), request_join (1-2 args), request_leave (0-1 args), open_menu (0 args), close_menu (0 args), menu_open (0 args), on_menu (1 arg)

## Built-in functions

- print (variadic), prints (variadic), printt (variadic), print_rich (variadic), printerr (variadic), push_error (variadic), push_warning (variadic), str (variadic), len (1 arg), range (1-3 args), typeof (1 arg), type_string (1 arg), char (1 arg), randf (0 args), randi (0 args), randf_range (2 args), randi_range (2 args), randfn (2 args), seed (1 arg), randomize (0 args), abs (1 arg), absf (1 arg), absi (1 arg), ceil (1 arg), ceilf (1 arg), ceili (1 arg), floor (1 arg), floorf (1 arg), floori (1 arg), round (1 arg), roundf (1 arg), roundi (1 arg), sqrt (1 arg), pow (2 args), exp (1 arg), log (1 arg), sin (1 arg), cos (1 arg), tan (1 arg), asin (1 arg), acos (1 arg), atan (1 arg), atan2 (2 args), sinh (1 arg), cosh (1 arg), tanh (1 arg), deg_to_rad (1 arg), rad_to_deg (1 arg), sign (1 arg), signf (1 arg), signi (1 arg), snapped (2 args), snappedf (2 args), snappedi (2 args), clamp (3 args), clampf (3 args), clampi (3 args), lerp (3 args), lerpf (3 args), lerp_angle (3 args), inverse_lerp (3 args), remap (5 args), smoothstep (3 args), pingpong (2 args), move_toward (3 args), min (variadic), max (variadic), minf (2 args), mini (2 args), maxf (2 args), maxi (2 args), fmod (2 args), fposmod (2 args), posmod (2 args), wrapf (3 args), wrapi (3 args), is_nan (1 arg), is_inf (1 arg), is_finite (1 arg), is_equal_approx (2 args), is_zero_approx (1 arg), is_instance_valid (1 arg), StringName (1 arg), NodePath (1 arg)

## Built-in constants

- PI, TAU, INF, NAN, TYPE_NIL, TYPE_BOOL, TYPE_INT, TYPE_FLOAT, TYPE_STRING, TYPE_VECTOR2, TYPE_VECTOR2I, TYPE_RECT2, TYPE_RECT2I, TYPE_VECTOR3, TYPE_VECTOR3I, TYPE_AABB, TYPE_BASIS, TYPE_TRANSFORM3D, TYPE_COLOR, TYPE_OBJECT, TYPE_CALLABLE, TYPE_DICTIONARY, TYPE_ARRAY, TYPE_PACKED_INT32_ARRAY, TYPE_PACKED_FLOAT32_ARRAY, TYPE_PACKED_VECTOR2_ARRAY, TYPE_PACKED_VECTOR3_ARRAY, TYPE_PACKED_COLOR_ARRAY, KEY_SPACE, KEY_ESCAPE, KEY_TAB, KEY_BACKSPACE, KEY_ENTER, KEY_KP_ENTER, KEY_LEFT, KEY_UP, KEY_RIGHT, KEY_DOWN, KEY_PAGEUP, KEY_PAGEDOWN, KEY_SHIFT, KEY_CTRL, KEY_ALT, KEY_0, KEY_1, KEY_2, KEY_3, KEY_4, KEY_5, KEY_6, KEY_7, KEY_8, KEY_9, KEY_A, KEY_B, KEY_C, KEY_D, KEY_E, KEY_F, KEY_G, KEY_H, KEY_I, KEY_J, KEY_K, KEY_L, KEY_M, KEY_N, KEY_O, KEY_P, KEY_Q, KEY_R, KEY_S, KEY_T, KEY_U, KEY_V, KEY_W, KEY_X, KEY_Y, KEY_Z, KEY_F1, KEY_F2, KEY_F3, KEY_F4, KEY_F5, KEY_F6, KEY_F7, KEY_F8, KEY_F9, KEY_F10, KEY_F11, KEY_F12, HORIZONTAL_ALIGNMENT_LEFT, HORIZONTAL_ALIGNMENT_CENTER, HORIZONTAL_ALIGNMENT_RIGHT, HORIZONTAL_ALIGNMENT_FILL, VERTICAL_ALIGNMENT_TOP, VERTICAL_ALIGNMENT_CENTER, VERTICAL_ALIGNMENT_BOTTOM, VERTICAL_ALIGNMENT_FILL
