#version 460 core

#include <flutter/runtime_effect.glsl>

// Color space conversion functions from https://chilliant.com/rgb2hsv.html
// Credit to Ian Taylor

/// The image size
uniform vec2 uSize;
/// The widget captured as a texture.
uniform sampler2D uTexture;

/// Output color at a given pixel.
/// Represented as a vec4 of RGBA values between 0 and 1.
out vec4 fragColor;

vec3 HUEtoRGB(float H) {
    float R = abs(H * 6 - 3) - 1;
    float G = 2 - abs(H * 6 - 2);
    float B = 2 - abs(H * 6 - 4);
    return clamp(vec3(R, G, B), 0.0, 1.0);
}

float Epsilon = 1e-10;

vec3 RGBtoHCV(vec3 RGB) {
    // Based on work by Sam Hocevar and Emil Persson
    vec4 P = (RGB.g < RGB.b) ? vec4(RGB.bg, -1.0, 2.0/3.0) : vec4(RGB.gb, 0.0, -1.0/3.0);
    vec4 Q = (RGB.r < P.x) ? vec4(P.xyw, RGB.r) : vec4(RGB.r, P.yzx);
    float C = Q.x - min(Q.w, Q.y);
    float H = abs((Q.w - Q.y) / (6 * C + Epsilon) + Q.z);
    return vec3(H, C, Q.x);
}

vec3 HSLtoRGB(vec3 HSL) {
    vec3 RGB = HUEtoRGB(HSL.x);
    float C = (1 - abs(2 * HSL.z - 1)) * HSL.y;
    return (RGB - 0.5) * C + HSL.z;
}

vec3 RGBtoHSL(vec3 RGB) {
    vec3 HCV = RGBtoHCV(RGB);
    float L = HCV.z - HCV.y * 0.5;
    float S = HCV.y / (1 - abs(L * 2 - 1) + Epsilon);
    return vec3(HCV.x, S, L);
}

void main() {
    // Get the (uninverted) color of the current pixel.
    vec2 uv = FlutterFragCoord().xy / uSize;
    vec4 color = texture(uTexture, uv);

    // Convert the color to HSL
    vec3 hsl = RGBtoHSL(color.xyz);

    // Invert lightness
    hsl.z = 1.0 - hsl.z;

    // Convert back to RGB
    vec3 invertedRgb = HSLtoRGB(hsl);

    // Set the output color to the inverted color
    // (with the same alpha value as the original color).
    fragColor = vec4(invertedRgb * color.w, color.w);
}
