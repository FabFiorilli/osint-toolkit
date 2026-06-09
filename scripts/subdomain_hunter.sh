#!/bin/bash

# ============================================
# subdomain_hunter.sh
# Automated subdomain enumeration
# Runs: sublist3r + dnstwist
# Author: Fabrizio Fiorilli
# ============================================

print_header() {
    clear
    echo "===================================="
    echo "       SUBDOMAIN HUNTER"
    echo "===================================="
}

get_target() {
    read -rp "Enter target domain: " target
    if [[ -z "$target" ]]; then
        echo "[ERROR] No target specified."
        exit 1
    fi
}

run_sublist3r() {
    echo ""
    echo "[+] Running Sublist3r on $target..."
    echo "------------------------------------"
    sublist3r -d "$target" -v \
    -o "sublist3r_${target}.txt"
}

run_dnstwist() {
    echo ""
    echo "[+] Running dnstwist on $target..."
    echo "------------------------------------"
    dnstwist -r "$target" \
    --format csv \
    -o "dnstwist_${target}.csv"
}

merge_results() {
    echo ""
    echo "[+] Merging results..."
    echo "------------------------------------"

    local merged="subdomains_${target}_merged.txt"

    cat "sublist3r_${target}.txt" \
    2>/dev/null > "$merged"

    awk -F',' 'NR>1 {print $2}' \
    "dnstwist_${target}.csv" \
    2>/dev/null >> "$merged"

    sort -u "$merged" -o "$merged"

    echo "[OK] Merged file: $merged"
    echo "[OK] Total unique entries: $(wc -l < "$merged")"
}

print_summary() {
    echo ""
    echo "===================================="
    echo " Subdomain Hunt completed."
    echo " Output files:"
    echo "------------------------------------"
    ls -lh *"${target}"* 2>/dev/null
    echo "===================================="
}

print_header
get_target
run_sublist3r
run_dnstwist
merge_results
print_summary
