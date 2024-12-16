shader_type canvas_item;

uniform vec3 color : source_color;
uniform float max_rotation_degrees : hint_range(0.0, 180.0) = 45.0;
uniform float speed : hint_range(0.1, 5.0) = 1.0;

void fragment() {
	float max_rotation_radians = radians(max_rotation_degrees);
	float rotation_angle = max_rotation_radians * sin(TIME * speed);
	vec2 center = vec2(0.5, 0.5);
	vec2 offset_uv = UV - center;
	float cos_angle = cos(rotation_angle);
	float sin_angle = sin(rotation_angle);
	mat2 rotation_matrix = mat2(vec2(cos_angle, -sin_angle), vec2(sin_angle, cos_angle));
	offset_uv = rotation_matrix * offset_uv;
	offset_uv += center;
	if (offset_uv.x < 0.0 || offset_uv.x > 1.0 || offset_uv.y < 0.0 || offset_uv.y > 1.0) {
		discard;
	}
	
	vec4 tex = texture(TEXTURE, offset_uv);
	COLOR = tex * vec4(color, tex.a);
}
