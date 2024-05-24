import lib-sampler.glsl

//: param auto channel_basecolor
uniform SamplerSparse basecolor_tex;
//: param auto channel_opacity
uniform SamplerSparse opacity_tex;

void shade(V2F inputs) {
    vec3 color = getBaseColor(basecolor_tex, inputs.sparse_coord);
    float alpha = getOpacity(opacity_tex, inputs.sparse_coord);

    // Output color and alpha
    diffuseShadingOutput(color);
    alphaOutput(alpha);

    // Manual alpha testing
    if (alpha < 0.5) {  // Example threshold
        discard;
    }
}
