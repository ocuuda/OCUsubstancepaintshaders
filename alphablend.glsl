import lib-sampler.glsl

//: param auto channel_basecolor
uniform SamplerSparse basecolor_tex;
//: param auto channel_opacity
uniform SamplerSparse opacity_tex;

//: state blend over {"enable":"true"}

void shade(V2F inputs) {
    vec3 color = getBaseColor(basecolor_tex, inputs.sparse_coord);
    float alpha = getOpacity(opacity_tex, inputs.sparse_coord);

    // Output color and alpha with blending
    diffuseShadingOutput(color * alpha);
    alphaOutput(alpha);
}