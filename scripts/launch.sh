#!/bin/bash
set -e

echo "🪟 Booting Windows VM inside Codespaces..."
echo "🔧 Initializing QEMU with crash resilience..."

# Auto-create folders if missing
mkdir -p windows/boot

# Create stub disk if missing
if [ ! -f windows/disk.vhdx ]; then
  echo "🧱 Creating stub Windows disk image (20GB)..."
  qemu-img create -f vhdx windows/disk.vhdx 20G
fi

# Copy OVMF firmware if missing
if [ ! -f windows/boot/OVMF.fd ]; then
  echo "📦 Copying OVMF firmware..."
  cp /usr/share/OVMF/OVMF.fd windows/boot/OVMF.fd
fi

# Launch the VM
qemu-system-x86_64 \
  -m 4096 \
  -smp 4 \
  -enable-kvm \
  -cpu host \
  -drive file=windows/disk.vhdx,format=raw \
  -bios windows/boot/OVMF.fd \
  -boot order=c \
  -vga std \
  -net nic -net user \
  -no-reboot -no-shutdown \
  -rtc base=localtime \
  -name "Windows-for-Docker" \
  -display gtk,gl=on || echo "❌ VM crashed or exited unexpectedly."
