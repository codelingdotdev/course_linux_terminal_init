#!/bin/bash
# Decode a ROT13 encoded message

if [ $# -ne 1 ]; then
    echo "Usage: $0 <encoded_message>"
    echo "Example: $0 'ZRRG NG QNJA'"
    exit 1
fi

encoded="$1"

echo "ENCODED MESSAGE:"
echo "$encoded"
echo ""
echo "DECODED MESSAGE:"
echo "$encoded" | tr 'A-Za-z' 'N-ZA-Mn-za-m'  # ROT13
echo ""
