# 🔍 Google Dorks

## What is it
Advanced Google search operators used to find
sensitive information indexed by search engines.
Powerful passive recon technique — no direct
contact with target.

---

## Core Operators

| Operator | Description |
|----------|-------------|
| `site:` | Limit search to domain |
| `intitle:` | Search in page title |
| `inurl:` | Search in URL |
| `intext:` | Search in page content |
| `filetype:` | Search by file type |
| `cache:` | Show cached version |
| `link:` | Pages linking to URL |
| `-` | Exclude keyword |

---

## Recon Dorks

```
# Find subdomains
site:<domain>

# Find login pages
site:<domain> inurl:login
site:<domain> intitle:"login"

# Find exposed files
site:<domain> filetype:pdf
site:<domain> filetype:xls
site:<domain> filetype:sql

# Find config files
site:<domain> filetype:env
site:<domain> filetype:conf
site:<domain> filetype:log

# Find exposed directories
site:<domain> intitle:"index of"

# Find admin panels
site:<domain> inurl:admin
site:<domain> inurl:dashboard
site:<domain> inurl:wp-admin
```

---

## Sensitive Info Dorks

```
# Find exposed credentials
intext:"password" filetype:log
intext:"username" filetype:env

# Find exposed cameras
inurl:"/view/index.shtml"
intitle:"webcamXP"

# Find vulnerable systems
intitle:"phpMyAdmin" inurl:phpmyadmin
inurl:"/php/phpinfo.php"
```

---

## Notes
- Combine with Shodan for maximum passive recon
- Use site: always to limit scope to target domain
- Document all findings before moving to active phase
- Google may block automated queries — use manually
