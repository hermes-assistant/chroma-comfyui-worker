FROM runpod/worker-comfyui:5.7.1-base

# Download Chroma1-HD FP8 model
RUN comfy model download \
  --url "https://huggingface.co/Clybius/Chroma-fp8-scaled/resolve/main/Chroma1-HD/Chroma1-HD_float8_e4m3fn_scaled_learned_topk8_svd.safetensors" \
  --relative-path models/diffusion_models \
  --filename chroma1-hd-fp8.safetensors

# Download T5 XXL FP8 text encoder
RUN comfy model download \
  --url "https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/t5xxl_fp8_e4m3fn.safetensors" \
  --relative-path models/clip \
  --filename t5xxl_fp8_e4m3fn.safetensors

# Download FLUX VAE
RUN comfy model download \
  --url "https://huggingface.co/lodestones/Chroma/resolve/main/ae.safetensors" \
  --relative-path models/vae \
  --filename ae.safetensors
