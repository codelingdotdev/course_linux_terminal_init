#!/bin/bash
# Decrypt a file that was encrypted with ROT13 cipher
# Creates a new decrypted file with .decrypted extension

if [ $# -ne 1 ]; then
    echo "Usage: $0 <encrypted_filename>"
    echo "Example: $0 secret-message.txt.encrypted"
    echo ""
    echo "This will create: secret-message.txt.encrypted.decrypted"
    exit 1
fi

input_file="$1"
output_file="${input_file}.decrypted"

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
        echo "❌ Decryption cancelled"
        exit 1
    fi
fi

# Decrypt the file (ROT13 is its own inverse)
echo "🔓 Decrypting file: $input_file"
cat "$input_file" | tr 'A-Za-z' 'N-ZA-Mn-za-m' > "$output_file"

if [ $? -eq 0 ]; then
    echo "✅ File decrypted successfully!"
    echo "📄 Decrypted file: $output_file"
    echo ""
    echo "Encrypted file preserved: $input_file"
else
    echo "❌ Decryption failed"
    exit 1
fi
