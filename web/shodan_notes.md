# 🌊 Shodan

## What is it
Search engine for internet-connected devices.
Indexes banners from servers, routers, webcams,
industrial systems and more. Powerful passive
recon tool — no direct contact with target.

---

## Access
- Web: https://www.shodan.io
- CLI: `shodan` command (requires API key)

---

## Core Search Filters

| Filter | Description |
|--------|-------------|
| `hostname:` | Search by hostname |
| `ip:` | Search by IP address |
| `port:` | Search by open port |
| `os:` | Search by operating system |
| `org:` | Search by organization |
| `country:` | Search by country code |
| `product:` | Search by software/product |
| `vuln:` | Search by CVE |

---

## Common Searches

```
# Find Apache servers in Italy
apache country:IT

# Find devices with specific port open
port:22 country:IT

# Find vulnerable systems
vuln:CVE-2021-44228

# Find specific product
product:vsftpd

# Find by organization
org:"target organization"
```

---

## CLI Usage

```bash
# Initialize with API key
shodan init <api-key>

# Search from CLI
shodan search apache country:IT

# Host info
shodan host <ip>

# Save results
shodan search --fields ip_str,port,org \
apache country:IT > output.txt
```

---

## Output Example

```
[+] IP: <ip>
    Port: 80
    Org: <organization>
    OS: Linux
    Product: Apache httpd 2.4.41
```

---

## Notes
- 100% passive — no packets sent to target
- Free account has limited results — use filters wisely
- `vuln:` filter requires paid account
- Always start recon here before active scanning
