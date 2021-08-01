uniform int MAX_ITER = 2500;
uniform float scale = 12;
uniform vec2 translate = vec2(5, 1);
uniform float tolerance = 0.12;

float rand(vec2 uv) {
    return fract(sin(dot(uv, vec2(12.9898, 78.233))) * 43758.5453123);
}

vec4 effect(vec4 col, Image tex, vec2 tx, vec2 sc) {
    vec2 uv = translate + scale * ((vec2(2 * sc.x, love_ScreenSize.y) - sc) - 0.5 * love_ScreenSize.xy) / love_ScreenSize.y;
    uv.xy = vec2(uv.y, uv.x);

    float x = 0, y = 0;
    float nextx, nexty;

    float r = rand(uv);
    for (int i = 0; i < MAX_ITER; i++) {
        r = rand(vec2(uv.x + r, uv.y - r));
        if (r < 0.01) {
            nextx = 0;
            nexty = 0.16 * y;
        } else if (r < 0.86) {
            nextx = 0.85 * x + 0.04 * y;
            nexty = -0.04 * x + 0.85 * y + 1.6;
        } else if (r < 0.93) {
            nextx = 0.2 * x - 0.26 * y;
            nexty = 0.23 * x + 0.22 * y + 1.6;
        } else {
            nextx = -0.15 * x + 0.28 * y;
            nexty = 0.26 * x + 0.24 * y + 0.44;
        }

        if (length(uv.xy - vec2(nextx, nexty)) < tolerance) {
            return vec4(0, 1, 0, 1);
        }

        x = nextx;
        y = nexty;
    }

    return vec4(0, 0, 0, 1);
}
