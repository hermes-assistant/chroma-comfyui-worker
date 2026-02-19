FROM runpod/worker-comfyui:5.7.1-base

# Download GonzaLomo Chroma v3.0 (Chroma finetune with built-in realism + NSFW)
RUN python3 -c "import urllib.request; urllib.request.urlretrieve('https://civitai.com/api/download/models/2627397?token=59b276f4628a091235f594aee42bda27', '/comfyui/models/diffusion_models/gonzalomoChroma_v30.safetensors'); print('Done')"

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
RUN python3 -c "import urllib.request; urllib.request.urlretrieve('https://civitai.com/api/download/models/2368123?token=59b276f4628a091235f594aee42bda27', '/comfyui/models/checkpoints/gonzalomoXLFluxPony_v60PhotoXLDMD.safetensors'); print('Done')"

# Download Sabrina face LoRA (use comfy model download since curl may not be available)
RUN comfy model download \
  --url "https://github.com/hermes-assistant/chroma-comfyui-worker/releases/download/v1.0.0/sabrina-chroma-lora-000005.safetensors" \
  --relative-path models/loras \
  --filename sabrina-face-v1.safetensors
