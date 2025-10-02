#!/bin/bash
echo "🧹 Recovering from frozen VM..."
pkill -f qemu-system-x86_64 && echo "✅ VM process terminated."
