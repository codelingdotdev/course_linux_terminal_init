#!/bin/bash
# Secure file deletion - overwrites before removing

if [ $# -ne 1 ]; then
    echo "Usage: $0 <filename>"
    echo "WARNING: This will permanently destroy the file!"
    exit 1
fi

file="$1"

if [ ! -f "$file" ]; then
    echo "Error: File not found: $file"
    exit 1
fi

echo "⚠️  WARNING: This will permanently destroy $file"
read -p "Continue? (yes/no): " confirm

if [ "$confirm" = "yes" ]; then
    # Overwrite with random data
    dd if=/dev/urandom of="$file" bs=1k count=$(du -k "$file" | cut -f1) 2>/dev/null
    # Remove file
    rm -f "$file"
    echo "✅ File securely deleted: $file"
else
    echo "❌ Deletion cancelled"
fi
