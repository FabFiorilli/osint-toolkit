# 🗺️ Nmap

## What is it
Network scanner for host discovery, port scanning,
service detection and OS fingerprinting.

---

## Installation
```bash
# Pre-installed on Kali Linux
nmap --version
```

---

## Core Flags

| Flag | Description |
|------|-------------|
| `-sS` | SYN scan (stealth) |
| `-sV` | Service version detection |
| `-sC` | Default scripts |
| `-O` | OS detection |
| `-p-` | All 65535 ports |
| `-p 1-1000` | Port range |
| `-T4` | Aggressive timing |
| `-oN` | Save output to file |
| `-A` | Aggressive scan (OS+version+scripts) |
| `--open` | Show only open ports |

---

## Common Usage

```bash
# Host discovery
nmap -sn <network/24>

# Full port scan
nmap -p- -T4 

# Service + version detection
nmap -sV -sC -p- 

# Aggressive scan with output
nmap -A -T4  -oN output.txt

---

## Notes
- Always use `-oN` to save output during labs
- Combine `-sV -sC` for maximum recon in one pass
- Use `--open` to reduce noise on large networks
