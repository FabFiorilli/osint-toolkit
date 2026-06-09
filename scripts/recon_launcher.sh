#!/bin/bash

# ============================================
# recon_launcher.sh
# Interactive OSINT recon launcher
# Author: Fabrizio Fiorilli
# ============================================

print_header() {
    clear
    echo "===================================="
    echo "       OSINT RECON LAUNCHER"
    echo "===================================="
}

show_menu() {
    echo ""
    echo "[1] Passive Recon    (whois + theHarvester)"
    echo "[2] DNS Recon        (nslookup + dnsrecon + dnsmap)"
    echo "[3] Subdomain Hunt   (sublist3r + dnstwist)"
    echo "[4] Network Recon    (nmap + enum4linux)"
    echo "[5] Web Recon        (dirb + urlcrazy)"
    echo "[6] Full Recon       (all modules)"
    echo "[7] Exit"
    echo "===================================="
    read -rp "Choose an option: " choice
}

get_target() {
    read -rp "Enter target domain/IP: " target
    if [[ -z "$target" ]]; then
        echo "[ERROR] No target specified."
        exit 1
    fi
}

run_passive() {
    echo ""
    echo "[+] Running Passive Recon on $target..."
    echo "------------------------------------"
    whois "$target" | tee "whois_$target.txt"
    theHarvester -d "$target" -b all -l 100 \
    -f "harvester_$target.html"
}

run_dns() {
    echo ""
    echo "[+] Running DNS Recon on $target..."
    echo "------------------------------------"
    nslookup "$target"
    dnsrecon -d "$target" -t std \
    -o "dnsrecon_$target.json"
    dnsmap "$target" -r "dnsmap_$target.txt"
}

run_subdomain() {
    echo ""
    echo "[+] Running Subdomain Hunt on $target..."
    echo "------------------------------------"
    sublist3r -d "$target" -o "sublist3r_$target.txt"
    dnstwist -r "$target" --format csv \
    -o "dnstwist_$target.csv"
}

run_network() {
    echo ""
    echo "[+] Running Network Recon on $target..."
    echo "------------------------------------"
    nmap -sV -sC -p- "$target" \
    -oN "nmap_$target.txt"
    enum4linux -a "$target" | \
    tee "enum4linux_$target.txt"
}

run_web() {
    echo ""
    echo "[+] Running Web Recon on $target..."
    echo "------------------------------------"
    dirb "http://$target" -z 100 \
    -o "dirb_$target.txt"
    urlcrazy -f csv \
    -o "urlcrazy_$target.csv" "$target"
}

run_full() {
    run_passive
    run_dns
    run_subdomain
    run_network
    run_web
}

print_summary() {
    echo ""
    echo "===================================="
    echo " Recon completed. Output files:"
    echo "------------------------------------"
    ls -lh *"$target"* 2>/dev/null
    echo "===================================="
}

run_monitor() {
    while true; do
        print_header
        show_menu

        case "$choice" in
            1) get_target; run_passive ;;
            2) get_target; run_dns ;;
            3) get_target; run_subdomain ;;
            4) get_target; run_network ;;
            5) get_target; run_web ;;
            6) get_target; run_full ;;
            7) echo "Goodbye."; exit 0 ;;
            *) echo "[ERROR] Invalid option." ;;
        esac

        print_summary
        echo ""
        read -rp "Press ENTER to continue..." _
    done
}

run_monitor
