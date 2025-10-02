#!/bin/bash
qemu-system-x86_64 \
  -m 4096 -smp 4 \
  -enable-kvm \
  -cpu host \
  -drive file=windows/disk.vhdx,format=raw \
  -bios windows/boot/OVMF.fd \
  -boot order=c \
  -no-reboot -no-shutdown
