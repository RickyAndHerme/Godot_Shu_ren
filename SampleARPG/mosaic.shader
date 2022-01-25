shader_type canvas_item;

uniform float size : hint_range(0.0, 0.2);

void fragment() {
	vec2 uv = SCREEN_UV;
	uv -= mod(uv, vec2(size, size));
	
	COLOR.rgb = textureLod(SCREEN_TEXTURE, uv, 0.0).rgb;
}