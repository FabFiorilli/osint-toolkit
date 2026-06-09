# 🌾 theHarvester

## What is it
Tool for gathering emails, subdomains, hosts, employee
names and open ports from public sources such as
Google, Bing, LinkedIn, Shodan and more.

---

## Core Flags

| Flag | Description |
|------|-------------|
| `-d` | Target domain |
| `-b` | Data source |
| `-l` | Limit results |
| `-f` | Save output (html/xml) |
| `-v` | Verify host via DNS |
| `-n` | DNS reverse lookup |

---

## Available Sources

| Source | Data collected |
|--------|----------------|
| `google` | Emails, subdomains |
| `bing` | Emails, subdomains |
| `linkedin` | Employee names |
| `shodan` | Open ports, banners |
| `dnsdumpster` | Subdomains, DNS |
| `all` | All sources |

---

## Common Usage

```bash
# Basic harvest from Google
theHarvester -d <domain> -b google

# Multiple sources
theHarvester -d <domain> -b google,bing,linkedin

# All sources with limit
theHarvester -d <domain> -b all -l 200

# Save output to file
theHarvester -d <domain> -b all -f output.html
```

---

## Output Example

```
[*] Emails found:
info@<domain>
admin@<domain>
hr@<domain>

[*] Hosts found:
mail.<domain> - <ip>
vpn.<domain> - <ip>
dev.<domain> - <ip>
```

---

## Notes
- 100% passive — no direct contact with target
- LinkedIn source requires valid API key
- Combine with whois for full passive recon phase
- Use `-f` always to save findings for reporting
