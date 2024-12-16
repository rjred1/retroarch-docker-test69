# Use Ubuntu as the base image
FROM ubuntu:20.04

# Install dependencies and RetroArch
RUN apt-get update && apt-get install -y \
    retroarch \
    retroarch-assets \
    curl \
    wget \
    libgl1-mesa-glx \
    libglib2.0-0 \
    x11vnc xvfb \
    && apt-get clean

# Set up a virtual display for RetroArch
RUN mkdir ~/.config/retroarch
RUN Xvfb :99 -screen 0 1280x720x16 &

# Expose a port if needed for streaming or VNC
EXPOSE 8080

# Run RetroArch as the default command
CMD ["retroarch"]
