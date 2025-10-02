# Base image: Ubuntu with build tools
FROM mcr.microsoft.com/devcontainers/base:ubuntu

# Install QEMU, KVM, and dependencies
RUN apt-get update && \
    apt-get install -y \
    qemu-system-x86 \
    qemu-utils \
    ovmf \
    wget \
    unzip \
    curl \
    git \
    sudo \
    net-tools \
    iproute2 \
    iputils-ping \
    && apt-get clean

# Create a non-root user for Codespaces
ARG USERNAME=vscode
RUN usermod -aG kvm $USERNAME

# Optional: Add your Windows disk image or download script
# RUN wget -O /workspace/windows/disk.vhdx <your-image-url>

# Set working directory
WORKDIR /workspace

# Copy launch script and make it executable
COPY ../start /usr/local/bin/start
RUN chmod +x /usr/local/bin/start

# Display message on Codespace creation
CMD [ "bash", "-c", "echo '✅ Environment ready. Run ./start to launch Windows VM.'" ]
