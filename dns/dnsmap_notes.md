# 🗺️ Dnsmap

## What is it
Tool for subdomain brute-forcing using a wordlist.
Useful during reconnaissance to discover hidden subdomains
of a target domain.

---

## Core Flags

| Flag | Description |
|------|-------------|
| `<domain>` | Target domain |
| `-w` | Custom wordlist |
| `-r` | Save results to file |
| `-c` | Save results as CSV |
| `-d` | Delay between requests (ms) |

---

## Common Usage

```bash
# Basic subdomain brute-force
dnsmap <domain>

# With custom wordlist
dnsmap <domain> -w <wordlist>

# Save results to file
dnsmap <domain> -r output.txt

# With delay to avoid detection
dnsmap <domain> -d 100
```

---

## Output Example

```
[+] <subdomain>.<domain>
IP address #1: <ip>

[+] <subdomain>.<domain>
IP address #1: <ip>
```

---

## Notes
- Default wordlist built-in if no `-w` specified
- Use `-d` on lossy or rate-limited targets
- Combine with dnsrecon for full DNS enumeration
