#!/bin/bash
# Encode a text message using ROT13 cipher

if [ $# -ne 1 ]; then
    echo "Usage: $0 <message>"
    echo "Example: $0 'MEET AT DAWN'"
    exit 1
fi

message="$1"

echo "ORIGINAL MESSAGE:"
echo "$message"
echo ""
echo "ENCODED MESSAGE:"
echo "$message" | tr 'A-Za-z' 'N-ZA-Mn-za-m'  # ROT13
echo ""
echo "Send this encoded message through secure channels only."
