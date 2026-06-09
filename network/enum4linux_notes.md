# 🔎 Enum4linux

## What is it
Tool for enumerating information from Windows and Samba
systems via SMB protocol.

---

## Core Flags

| Flag | Description |
|------|-------------|
| `-a` | All enumeration |
| `-U` | User list |
| `-S` | Share list |
| `-G` | Group list |
| `-P` | Password policy |
| `-o` | OS information |
| `-n` | Nmblookup info |

---

## Common Usage

```bash
# Full enumeration
enum4linux -a <target>

# Users only
enum4linux -U <target>

# Save output
enum4linux -a <target> | tee output.txt
```

---

## Output Example

```
[+] Got domain/workgroup name: WORKGROUP
[+] Users found: administrator, guest
[+] Share: IPC$, ADMIN$, C$
```

---

## Notes
- Requires SMB ports 139/445 open
- Always pipe output to tee during labs
- Combine with nmap for full network recon
