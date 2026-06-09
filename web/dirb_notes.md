# 📂 Dirb

## What is it
Web content scanner that brute-forces directories
and files on web servers using wordlists.

---

## Core Flags

| Flag | Description |
|------|-------------|
| `<url>` | Target URL |
| `-w` | Custom wordlist |
| `-o` | Save output to file |
| `-a` | Custom user agent |
| `-z` | Delay between requests (ms) |
| `-r` | Non-recursive scan |
| `-S` | Silent mode |
| `-X` | File extensions to append |

---

## Common Usage

```bash
# Basic scan
dirb http://<target>

# With custom wordlist
dirb http://<target> <wordlist>

# Save output
dirb http://<target> -o output.txt

# With delay on lossy targets
dirb http://<target> -z 100

# Scan for specific extensions
dirb http://<target> -X .php,.txt,.html
```

---

## Output Example

```
---- Scanning URL: http://<target>/ ----
+ http://<target>/admin (CODE:200|SIZE:1024)
+ http://<target>/login (CODE:200|SIZE:512)
+ http://<target>/backup (CODE:301|SIZE:0)
```

---

## Notes
- Use `-z 100` on unstable or rate-limited targets
- Common wordlists in `/usr/share/dirb/wordlists/`
- HTTP codes: 200 found, 301 redirect, 403 forbidden
