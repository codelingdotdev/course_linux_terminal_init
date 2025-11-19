#!/bin/bash
# Encrypt a file using ROT13 cipher
# Creates a new encrypted file with .encrypted extension

if [ $# -ne 1 ]; then
    echo "Usage: $0 <filename>"
    echo "Example: $0 secret-message.txt"
    echo ""
    echo "This will create: secret-message.txt.encrypted"
    exit 1
fi

input_file="$1"
output_file="${input_file}.encrypted"

# Check if input file exists
if [ ! -f "$input_file" ]; then
    echo "❌ Error: File not found: $input_file"
    exit 1
fi

# Check if output file already exists
if [ -f "$output_file" ]; then
    echo "⚠️  Warning: $output_file already exists"
    read -p "Overwrite? (yes/no): " confirm
    if [ "$confirm" != "yes" ]; then
        echo "❌ Encryption cancelled"
        exit 1
    fi
fi

# Encrypt the file
echo "🔒 Encrypting file: $input_file"
cat "$input_file" | tr 'A-Za-z' 'N-ZA-Mn-za-m' > "$output_file"

if [ $? -eq 0 ]; then
    echo "✅ File encrypted successfully!"
    echo "📄 Encrypted file: $output_file"
    echo ""
    echo "Original file preserved: $input_file"
else
    echo "❌ Encryption failed"
    exit 1
fi
