# 🌀 Dnstwist

## What is it
Tool for detecting typosquatting, phishing and
corporate espionage by generating domain permutations
and checking which ones are registered.

---

## Core Flags

| Flag | Description |
|------|-------------|
| `<domain>` | Target domain |
| `-r` | Enable DNS resolution |
| `-w` | Enable WHOIS lookup |
| `-b` | Enable Levenshtein distance |
| `--format` | Output format (csv, json) |
| `-o` | Save output to file |

---

## Common Usage

```bash
# Basic permutation scan
dnstwist <domain>

# With DNS resolution
dnstwist -r <domain>

# Full scan with WHOIS
dnstwist -r -w <domain>

# Save as CSV
dnstwist -r <domain> --format csv -o output.csv
```

---

## Output Example

```
[*] Generating permutations
[+] addition    <domain>x  <ip>
[+] bitsquating <d0main>   <ip>
[+] homoglyph   <dοmain>   <ip>
```

---

## Notes
- Useful for phishing detection and brand monitoring
- Combine with urlcrazy for full typosquatting recon
- Use `-r` always to filter only registered domains
