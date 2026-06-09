# 🌐 Nslookup

## What is it
Tool for querying DNS servers to obtain domain name
or IP address mapping and other DNS records.

---

## Core Commands

| Command | Description |
|---------|-------------|
| `nslookup <domain>` | Basic DNS lookup |
| `nslookup <ip>` | Reverse DNS lookup |
| `set type=MX` | Query mail records |
| `set type=NS` | Query nameservers |
| `set type=TXT` | Query TXT records |
| `set type=ANY` | Query all records |

---

## Common Usage

```bash
# Basic lookup
nslookup <domain>

# Reverse lookup
nslookup <ip>

# Specify DNS server
nslookup <domain> <dns-server>

# Interactive mode — query MX records
nslookup
> set type=MX
> <domain>
```

---

## Output Example

```
Server:   8.8.8.8
Address:  8.8.8.8#53

Name:   target.domain
Address: <ip>
```

---

## Notes
- Always specify lab DNS server during VPN sessions
- Use interactive mode for multiple record types
- Combine with dnsrecon for deeper enumeration
