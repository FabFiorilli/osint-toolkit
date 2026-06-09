# 🌀 Urlcrazy

## What is it
Tool for generating and testing domain typos and
variations. Used to detect typosquatting, phishing
campaigns and brand impersonation.

---

## Core Flags

| Flag | Description |
|------|-------------|
| `<domain>` | Target domain |
| `-p` | Check if domain is popular |
| `-r` | Disable DNS resolution |
| `-f` | Output format (csv, json) |
| `-o` | Save output to file |

---

## Typo Types Generated

| Type | Example |
|------|---------|
| Character omission | targe.com |
| Character repeat | targget.com |
| Adjacent key swap | tarvet.com |
| Character replace | t4rget.com |
| Homoglyph | tàrget.com |

---

## Common Usage

```bash
# Basic typo generation
urlcrazy <domain>

# With DNS resolution
urlcrazy -p <domain>

# Save as CSV
urlcrazy -f csv -o output.csv <domain>
```

---

## Output Example

```
[+] Typo          Domain              DNS
omission          targe.com           <ip>
repetition        targget.com         -
swap              taregt.com          <ip>
```

---

## Notes
- Combine with dnstwist for full typosquatting coverage
- Useful for social engineering recon phase
- Registered domains with IPs are highest priority targets
