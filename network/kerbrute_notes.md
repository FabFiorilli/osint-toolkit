# 🎟️ Kerbrute

## What is it
Tool for brute-forcing and enumerating valid Active Directory
accounts via Kerberos pre-authentication.

---

## Core Flags

| Flag | Description |
|------|-------------|
| `userenum` | Enumerate valid usernames |
| `passwordspray` | Spray one password against users |
| `bruteuser` | Brute force a single user |
| `--dc` | Domain controller address |
| `--domain` | Target domain |
| `-o` | Save output to file |

---

## Common Usage

```bash
# User enumeration
kerbrute userenum -d <domain> \
--dc <target> <wordlist>

# Password spray
kerbrute passwordspray -d <domain> \
--dc <target> <userlist> <password>

# Save output
kerbrute userenum -d <domain> \
--dc <target> <wordlist> -o output.txt
```

---

## Output Example

```
[+] VALID USERNAME: administrator@domain.local
[+] VALID USERNAME: john@domain.local
[-] INVALID: guest@domain.local
```

---

## Notes
- Requires port 88 (Kerberos) open on DC
- Must compile from source on ARM64 Kali
- Use with rockyou.txt or custom wordlists
