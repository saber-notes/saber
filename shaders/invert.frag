#version 460 core

#include <flutter/runtime_effect.glsl>

/// The widget captured as a texture.
layout(location = 0) uniform sampler2D uTexture;

/// Output color at a given pixel.
/// Represented as a vec4 of RGBA values between 0 and 1.
out vec4 fragColor;


/// Converts an RGB color to HSL
/// where h is between 0 and 360, s is between 0 and 1, and l is between 0 and 1.
/// Ported from https://css-tricks.com/converting-color-spaces-in-javascript/
vec3 rgbToHsl(float r, float g, float b) {
    // Find greatest and smallest channel values
    float cmin = min(min(r,g),b);
    float cmax = max(max(r,g),b);
    float delta = cmax - cmin;

    // Calculate hue
    float h;
    if (delta == 0.0) {
        h = 0.0;
    } else if (cmax == r) {
        h = mod((g - b) / delta, 6.0);
    } else if (cmax == g) {
        h = (b - r) / delta + 2.0;
    } else {
        h = (r - g) / delta + 4.0;
    }
    h = round(h * 60.0);

    // Make negative hues positive behind 360°
    if (h < 0) {
        h += 360.0;
    }

    // Calculate lightness
    float l = (cmax + cmin) / 2.0;

    // Calculate saturation
    float s = 0.0;
    if (delta != 0.0) {
        s = delta / (1 - abs(2 * l - 1));
    }

    return vec3(h, s, l);
}

/// Helper function for [hslToRgb].
/// Copied from https://github.com/Jam3/glsl-hsl2rgb/blob/master/index.glsl
float _hueToRgb(float f1, float f2, float hue) {
    if (hue < 0.0)
        hue += 1.0;
    else if (hue > 1.0)
        hue -= 1.0;
    float res;
    if ((6.0 * hue) < 1.0)
        res = f1 + (f2 - f1) * 6.0 * hue;
    else if ((2.0 * hue) < 1.0)
        res = f2;
    else if ((3.0 * hue) < 2.0)
        res = f1 + (f2 - f1) * ((2.0 / 3.0) - hue) * 6.0;
    else
        res = f1;
    return res;
}

/// Converts a HSL color to RGB.
/// Copied from https://github.com/Jam3/glsl-hsl2rgb/blob/master/index.glsl
vec3 hslToRgb(float h, float s, float l) {
    float r = l;
    float g = l;
    float b = l;

    if (s != 0.0) { // not achromatic
        float f2;

        if (l < 0.5)
            f2 = l * (1.0 + s);
        else
            f2 = l + s - l * s;

        float f1 = 2.0 * l - f2;

        r = _hueToRgb(f1, f2, h + (1.0/3.0));
        g = _hueToRgb(f1, f2, h);
        b = _hueToRgb(f1, f2, h - (1.0/3.0));
    }

    return vec3(r, g, b);
}

void main() {
    // Get the (uninverted) color of the current pixel.
    vec4 color = texture(uTexture, FlutterFragCoord().xy);

    // Convert the color to HSL
    vec3 hsl = rgbToHsl(color.x, color.y, color.z);

    // Invert lightness
    hsl.z = 1.0 - hsl.z;

    // Convert back to RGB
    vec3 invertedRgb = hslToRgb(hsl.x, hsl.y, hsl.z);

    // Set the output color to the inverted color
    // (with the same alpha value as the original color).
    fragColor = vec4(invertedRgb, color.w);
}
