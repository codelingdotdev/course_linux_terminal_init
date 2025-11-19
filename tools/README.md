# Resistance Tools

## Available Scripts

### Message Encryption/Decryption

#### encode-message.sh
Encode a text message for secure transmission.
```bash
./scripts/encode-message.sh "MEET AT DAWN"
```

#### decode-message.sh  
Decode received encrypted messages.
```bash
./scripts/decode-message.sh "ZRRG NG QNJA"
```

### File Encryption/Decryption

#### encrypt-file.sh
Encrypt an entire file (creates .encrypted version).
```bash
./scripts/encrypt-file.sh secret-intel.txt
# Creates: secret-intel.txt.encrypted
```

#### decrypt-file.sh
Decrypt an encrypted file (creates .decrypted version).
```bash
./scripts/decrypt-file.sh secret-intel.txt.encrypted
# Creates: secret-intel.txt.encrypted.decrypted
```

### File Security

#### secure-delete.sh
Permanently destroy sensitive files (overwrites before deletion).
```bash
./scripts/secure-delete.sh sensitive-file.txt
```

## Adding New Tools

If you develop new operational tools, submit to Command for review
before distribution to other cells.
