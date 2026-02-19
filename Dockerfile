FROM runpod/worker-comfyui:5.7.1-base

# Set CivitAI token for authenticated downloads
ENV CIVITAI_API_TOKEN=59b276f4628a091235f594aee42bda27

# Download GonzaLomo Chroma v3.0 (Chroma finetune with built-in realism + NSFW)
RUN comfy model download \
  --url "https://civitai.com/api/download/models/2627397" \
  --relative-path models/diffusion_models \
  --filename gonzalomoChroma_v30.safetensors

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

# Download GonzaLomo v6.0 Photo XL DMD (SDXL refiner checkpoint, ~6.6GB)
RUN comfy model download \
  --url "https://civitai.com/api/download/models/2368123" \
  --relative-path models/checkpoints \
  --filename gonzalomoXLFluxPony_v60PhotoXLDMD.safetensors

# Download face LoRAs
RUN comfy model download \
  --url "https://github.com/hermes-assistant/chroma-comfyui-worker/releases/download/v1.0.0/sabrina-chroma-lora-000005.safetensors" \
  --relative-path models/loras \
  --filename sabrina-face-v1.safetensors

RUN comfy model download \
  --url "https://github.com/hermes-assistant/chroma-comfyui-worker/releases/download/v1.0.0/bella-chroma-lora.safetensors" \
  --relative-path models/loras \
  --filename bella-face-v1.safetensors
