# Use NVIDIA's official CUDA base image with GPU support
FROM nvidia/cuda:11.8.0-base-ubuntu20.04

# Install dependencies and RetroArch
RUN apt-get update && apt-get install -y \
    bash \
    retroarch \
    retroarch-assets \
    curl \
    wget \
    libgl1-mesa-glx \
    libglib2.0-0 \
    x11vnc xvfb \
    && apt-get clean

# Set up Xvfb for virtual display
RUN mkdir -p /root/.config/retroarch
ENV XDG_RUNTIME_DIR=/tmp/runtime
RUN mkdir -p /tmp/runtime && chmod 700 /tmp/runtime

# Expose ports for streaming or remote display
EXPOSE 8080

# Start Xvfb and RetroArch with GPU support
CMD Xvfb :99 -screen 0 1280x720x16 & retroarch
