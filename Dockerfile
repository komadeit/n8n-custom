FROM n8nio/n8n:latest

USER root

# Install system dependencies
RUN apk add --no-cache \
    ffmpeg \
    python3 \
    py3-pip \
    curl \
    wget

# Install yt-dlp globally (simpler approach)
RUN pip3 install --break-system-packages yt-dlp

USER node

EXPOSE 5678
CMD ["n8n", "start"]
