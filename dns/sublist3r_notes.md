# 🔎 Sublist3r

## What is it
Tool for enumerating subdomains using OSINT sources
such as Google, Bing, Yahoo, Netcraft, VirusTotal
and DNSdumpster.

---

## Core Flags

| Flag | Description |
|------|-------------|
| `-d` | Target domain |
| `-b` | Enable brute-force |
| `-w` | Wordlist for brute-force |
| `-p` | Scan specific ports |
| `-o` | Save output to file |
| `-v` | Verbose mode |
| `-t` | Number of threads |

---

## Common Usage

```bash
# Basic enumeration
sublist3r -d <domain>

# With brute-force enabled
sublist3r -d <domain> -b

# With custom wordlist
sublist3r -d <domain> -b -w <wordlist>

# Save output
sublist3r -d <domain> -o output.txt

# Verbose with threads
sublist3r -d <domain> -v -t 50
```

---

## Output Example

```
[+] Enumerating subdomains for <domain>
[+] mail.<domain>
[+] vpn.<domain>
[+] dev.<domain>
[+] staging.<domain>
```

---

## Notes
- Passive by default — no direct contact with target
- Combine with dnsrecon for active verification
- Use `-b` only on authorized targets
