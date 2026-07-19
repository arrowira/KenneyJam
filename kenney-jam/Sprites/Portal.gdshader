shader_type spatial;

render_mode unshaded, cull_disabled, blend_mix;

uniform vec4 portal_color : source_color = vec4(0.0, 0.45, 1.0, 1.0);
uniform float glow = 7.0;

void fragment() {
    vec2 uv = UV * 2.0 - 1.0;

    float r = length(uv);
    float a = atan(uv.y, uv.x);

    float swirl = sin(a * 12.0 - TIME * 4.0 + r * 22.0);
    float rings = sin(r * 45.0 - TIME * 10.0);

    float mask = smoothstep(1.0, 0.75, r);

    // Deep blue base
    vec3 color = vec3(0.0, 0.25, 1.0);

    // Blue animation instead of white
    color += vec3(0.0, 0.08, 0.25) * swirl;
    color += vec3(0.0, 0.05, 0.15) * rings;

    ALBEDO = color;
    EMISSION = color * glow * mask;
    ALPHA = mask;
}