#!/bin/bash

# ============================================
# dns_enum.sh
# Automated DNS enumeration
# Runs: nslookup + dnsmap + dnsrecon
# Author: Fabrizio Fiorilli
# ============================================

print_header() {
    clear
    echo "===================================="
    echo "         DNS ENUMERATOR"
    echo "===================================="
}

get_target() {
    read -rp "Enter target domain: " target
    if [[ -z "$target" ]]; then
        echo "[ERROR] No target specified."
        exit 1
    fi
}

run_nslookup() {
    echo ""
    echo "[+] Running nslookup on $target..."
    echo "------------------------------------"
    nslookup "$target" | tee "nslookup_${target}.txt"
}

run_dnsmap() {
    echo ""
    echo "[+] Running dnsmap on $target..."
    echo "------------------------------------"
    dnsmap "$target" -r "dnsmap_${target}.txt"
}

run_dnsrecon() {
    echo ""
    echo "[+] Running dnsrecon on $target..."
    echo "------------------------------------"
    dnsrecon -d "$target" -t std \
    -o "dnsrecon_${target}.json"

    echo ""
    echo "[+] Attempting zone transfer..."
    echo "------------------------------------"
    dnsrecon -d "$target" -t axfr
}

print_summary() {
    echo ""
    echo "===================================="
    echo " DNS Enumeration completed."
    echo " Output files:"
    echo "------------------------------------"
    ls -lh *"${target}"* 2>/dev/null
    echo "===================================="
}

print_header
get_target
run_nslookup
run_dnsmap
run_dnsrecon
print_summary
