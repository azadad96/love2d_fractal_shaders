uniform int MAX_ITER = 200;
uniform float scale = 2.5;
uniform vec2 translate = vec2(0, 0);

vec2 square(vec2 z) {
    return vec2(pow(z.x, 2) - pow(z.y, 2), 2 * z.x * z.y);
}

vec4 effect(vec4 col, Image tex, vec2 tx, vec2 sc) {
    vec2 z = translate + scale * ((vec2(2 * sc.x, love_ScreenSize.y) - sc) - 0.5 * love_ScreenSize.xy) / love_ScreenSize.y;
    vec2 c = vec2(-0.7269, 0.1889);

    for (int i = 0; i < MAX_ITER; i++) {
        z = square(z) + c;
        if (length(z) > 2) {
            float val = float(i) / float(MAX_ITER);
            return vec4(0, 0, val, 1);
        }
    }

    return vec4(0, 0, 0, 1);
}
