# 📋 Whois

## What is it
Tool for querying domain registration information.
Returns registrar details, owner contacts, name
servers, registration and expiration dates.

---

## Core Flags

| Flag | Description |
|------|-------------|
| `<domain>` | Query domain info |
| `<ip>` | Query IP owner info |
| `-h` | Specify whois server |

---

## Common Usage

```bash
# Basic domain lookup
whois <domain>

# IP lookup
whois <ip>

# Save output
whois <domain> | tee output.txt

# Specify whois server
whois -h whois.arin.net <ip>
```

---

## Output Example

```
Domain Name: <domain>
Registrar: <registrar>
Creation Date: <date>
Expiration Date: <date>
Name Server: <nameserver>
Registrant Email: <email>
```

---

## Key Information to Extract

| Field | Why it matters |
|-------|----------------|
| Registrar | Hosting provider info |
| Creation Date | Domain age — older = more trusted |
| Name Servers | DNS infrastructure |
| Registrant Email | Contact for social engineering |
| Organization | Company structure intel |

---

## Notes
- Always first step in passive recon
- Combine with theHarvester for email harvesting
- Privacy-protected domains return redacted info
- Use IP lookup to find hosting provider and ASN
