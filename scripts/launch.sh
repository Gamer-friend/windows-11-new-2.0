#!/bin/bash
set -e

echo "🪟 Booting Windows VM inside Codespaces..."
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
