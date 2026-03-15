shader_type canvas_item;

uniform sampler2D gradient: repeat_enable, filter_linear;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	float x = SCREEN_UV.x + (TIME / 3.);
	
	COLOR.rgb = COLOR.rgb * (texture(gradient, vec2(x, 0))).rgb;
	// Called for every pixel the material is visible on.
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
