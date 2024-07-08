import lib-sampler.glsl

//: param auto channel_basecolor
uniform SamplerSparse basecolor_tex;

// Enable alpha blending
//: state blend over {"enable":"true"}
// Disable backface culling
//: state cull_face off

void shade(V2F inputs) {
    // Fetch the base color and alpha from the texture
    vec4 baseColor = textureSparse(basecolor_tex, inputs.sparse_coord);

    // Ensure correct blending for both front and back faces
    vec3 color = baseColor.rgb * baseColor.a;
    float alpha = baseColor.a;

    // Output color and alpha with blending
    diffuseShadingOutput(color);
    alphaOutput(alpha);
}
