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

# Set working directory
WORKDIR /workspace

# Copy start script from .devcontainer folder
COPY start /usr/local/bin/start
RUN chmod +x /usr/local/bin/start

# Display message on Codespace creation
CMD [ "bash", "-c", "echo '✅ Environment ready. Run ./start to launch Windows VM.'" ]
