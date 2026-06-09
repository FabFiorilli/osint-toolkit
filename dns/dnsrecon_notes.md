# 🔍 Dnsrecon

## What is it
Advanced DNS enumeration tool. Supports multiple
reconnaissance techniques including zone transfer,
brute-force and reverse lookup.

---

## Core Flags

| Flag | Description |
|------|-------------|
| `-d` | Target domain |
| `-t` | Scan type |
| `-D` | Wordlist for brute-force |
| `-n` | Specify DNS server |
| `-o` | Save output to file |

---

## Scan Types

| Type | Description |
|------|-------------|
| `std` | Standard enumeration |
| `axfr` | Zone transfer attempt |
| `brt` | Brute-force subdomains |
| `reverse` | Reverse lookup on range |
| `srv` | SRV record enumeration |

---

## Common Usage

```bash
# Standard enumeration
dnsrecon -d <domain> -t std

# Zone transfer attempt
dnsrecon -d <domain> -t axfr

# Brute-force with wordlist
dnsrecon -d <domain> -t brt -D <wordlist>

# Save output
dnsrecon -d <domain> -t std -o output.json
```

---

## Output Example

```
[*] Performing General Enumeration of Domain
[+] SOA <domain> <ip>
[+] NS  <nameserver> <ip>
[+] MX  mail.<domain> <ip>
[+] A   www.<domain> <ip>
```

---

## Notes
- Always try `axfr` first — zone transfer is a critical misconfiguration
- Combine with nslookup for manual verification
- Use `-n` to specify lab DNS server during VPN sessions
