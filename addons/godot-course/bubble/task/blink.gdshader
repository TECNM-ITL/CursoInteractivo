shader_type canvas_item;

uniform vec3 color : source_color;
uniform float speed : hint_range(0.1, 5.0) = 1.0;

void fragment() {
	vec4 icon_texture = texture(TEXTURE, UV);
	float t = (sin(TIME * speed) + 1.0) / 2.0;
	COLOR = mix(vec4(0.0, 0.0, 0.0, icon_texture.a), vec4(color, icon_texture.a), t);
}
