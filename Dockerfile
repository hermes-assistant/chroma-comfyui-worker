FROM runpod/worker-comfyui:5.7.1-base

# Download Chroma1-HD FP8 model
RUN comfy model download \
  --url "https://huggingface.co/Clybius/Chroma-fp8-scaled/resolve/main/Chroma1-HD/Chroma1-HD_float8_e4m3fn_scaled_learned_topk8_svd.safetensors" \
  --relative-path models/diffusion_models \
  --filename Chroma1-HD-fp8_scaled_rev2.safetensors

# Download T5 XXL FP8 text encoder (required for Chroma)
RUN comfy model download \
  --url "https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/t5xxl_fp8_e4m3fn.safetensors" \
  --relative-path models/clip \
  --filename t5xxl_fp8_e4m3fn.safetensors

# Download FLUX VAE (required for Chroma decoding)
RUN comfy model download \
  --url "https://huggingface.co/lodestones/Chroma/resolve/main/ae.safetensors" \
  --relative-path models/vae \
  --filename ae.safetensors

# Download Flux NSFW LoRAs (compatible with Chroma)
RUN comfy model download \
  --url "https://drive.google.com/uc?export=download&id=1PdmUD6_ng7DKuhFG--ZSIBtOq4i6OVbL&confirm=t" \
  --relative-path models/loras \
  --filename realistic-nudes-flux.safetensors

RUN comfy model download \
  --url "https://drive.google.com/uc?export=download&id=1guho2n-0joKjQd0Tips34ztdSkVhemJT&confirm=t" \
  --relative-path models/loras \
  --filename flux-unchained.safetensors
