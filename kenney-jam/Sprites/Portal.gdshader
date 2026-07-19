shader_type spatial;

render_mode unshaded, cull_disabled, blend_mix;

uniform vec4 portal_color : source_color = vec4(0.2, 0.6, 1.0, 1.0);
uniform float glow = 5.0;

void fragment() {
    vec2 uv = UV * 2.0 - 1.0;

    float r = length(uv);
    float a = atan(uv.y, uv.x);

    float swirl = sin(a * 10.0 - TIME * 3.0 + r * 20.0);
    float rings = sin(r * 35.0 - TIME * 8.0);

    float mask = smoothstep(1.0, 0.75, r);

    vec3 color = portal_color.rgb;
    color += vec3(swirl * 0.15 + rings * 0.1);

    ALBEDO = color;
    EMISSION = color * glow * mask;
    ALPHA = mask;
}