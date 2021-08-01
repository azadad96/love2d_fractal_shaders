uniform int MAX_ITER = 1000;
uniform float scale = 1.5;
uniform vec2 translate = vec2(0.5, 0.5);
uniform float tolerance = 0.01;

float rand(vec2 uv) {
    return fract(sin(dot(uv, vec2(12.9898, 78.233))) * 43758.5453123);
}

vec4 effect(vec4 col, Image tex, vec2 tx, vec2 sc) {
    vec2 uv = translate + scale * ((vec2(2 * sc.x, love_ScreenSize.y) - sc) - 0.5 * love_ScreenSize.xy) / love_ScreenSize.y;

    vec2 xy = vec2(0, 0);
    vec2 next = vec2(0, 0);

    float r = rand(uv);
    for (int i = 0; i < MAX_ITER; i++) {
        r = rand(vec2(uv.x + r, uv.y - r));
        if (r < 0.333) {
            next = 0.5 * xy;
        } else if (r < 0.666) {
            next = 0.5 * xy + vec2(0.25, 0.5);
        } else {
            next = 0.5 * xy + vec2(0.5, 0);
        }

        if (length(uv.xy - next) < tolerance) {
            return vec4(1, 1, 1, 1);
        }

        xy = next;
    }

    return vec4(0, 0, 0, 1);
}
