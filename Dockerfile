FROM n8nio/n8n:latest

# Switch to root user to install packages
USER root

# Install system dependencies
RUN apk add --no-cache \
    ffmpeg \
    python3 \
    py3-pip \
    py3-setuptools \
    py3-wheel \
    curl \
    wget \
    git

# Create a virtual environment and install yt-dlp
RUN python3 -m venv /opt/venv && \
    /opt/venv/bin/pip install --upgrade pip && \
    /opt/venv/bin/pip install yt-dlp

# Add the virtual environment to PATH
ENV PATH="/opt/venv/bin:$PATH"

# Create symlinks for easier access
RUN ln -sf /opt/venv/bin/yt-dlp /usr/local/bin/yt-dlp

# Switch back to node user for security
USER node

# Expose n8n port
EXPOSE 5678

# Start n8n
CMD ["n8n", "start"]
