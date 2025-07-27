FROM n8nio/n8n:latest

# Switch to root user to install packages
USER root

# Install ffmpeg, python3, pip, and other dependencies
RUN apk add --no-cache \
    ffmpeg \
    python3 \
    py3-pip \
    curl \
    wget \
    && pip3 install --no-cache-dir yt-dlp

# Switch back to node user for security
USER node

# Expose n8n port
EXPOSE 5678

# Start n8n
CMD ["n8n", "start"]
