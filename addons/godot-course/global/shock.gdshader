shader_type canvas_item;

//from https://godotshaders.com/shader/shock-damage/
uniform vec4 base_color : source_color = vec4(1.0);
/**
Color to use for the shock.
*/
uniform vec3 shock_color : source_color = vec3(1.0, 0.0, 0.0);
/**
Initial amplitude of the shock. This will start at this amplitude and
gradually attenuate.
*/
uniform float amplitude = 30.0;
/**
How fast shold it move side to side, more frequency means it'll move more quickly
side to side.
*/
uniform float frequecy = 10.0;
uniform bool flip_direction = false;

void vertex() {
	float exponent = mod(TIME, 3.0);
	if (flip_direction){
		VERTEX.x -= amplitude * exp(-3.0*exponent) * sin(frequecy*exponent);
	} else {
		VERTEX.x += amplitude * exp(-3.0*exponent) * sin(frequecy*exponent);
	}
}

void fragment() {
	float exponent = mod(TIME, 3.0);
	vec4 normal_color = vec4(texture(TEXTURE, UV).rgb, texture(TEXTURE, UV).a);
	COLOR = mix(normal_color * base_color, vec4(shock_color, normal_color.a), exp(-3.0*exponent));
}
