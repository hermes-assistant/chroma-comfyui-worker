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
# Google Drive large file download with confirmation bypass
RUN mkdir -p /comfyui/models/loras && \
  pip install --quiet gdown && \
  python3 -c "import gdown; gdown.download(id='1PdmUD6_ng7DKuhFG--ZSIBtOq4i6OVbL', output='/comfyui/models/loras/realistic-nudes-flux.safetensors', fuzzy=True)" && \
  python3 -c "import gdown; gdown.download(id='1guho2n-0joKjQd0Tips34ztdSkVhemJT', output='/comfyui/models/loras/flux-unchained.safetensors', fuzzy=True)" && \
  ls -lh /comfyui/models/loras/
