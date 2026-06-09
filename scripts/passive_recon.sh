#!/bin/bash

# ============================================
# passive_recon.sh
# Automated passive reconnaissance
# Runs: whois + theHarvester
# Author: Fabrizio Fiorilli
# ============================================

print_header() {
    clear
    echo "===================================="
    echo "        PASSIVE RECON"
    echo "===================================="
}

show_menu() {
    echo ""
    echo "[1] Whois lookup       (domain + IP)"
    echo "[2] Email harvesting   (theHarvester)"
    echo "[3] Full passive recon (both modules)"
    echo "[4] Exit"
    echo "===================================="
    read -rp "Choose an option: " choice
}

get_target() {
    read -rp "Enter target domain: " target
    if [[ -z "$target" ]]; then
        echo "[ERROR] No target specified."
        exit 1
    fi
}

run_whois() {
    echo ""
    echo "[+] Running whois on $target..."
    echo "------------------------------------"
    whois "$target" | tee "whois_${target}.txt"

    echo ""
    echo "[+] Key fields extracted:"
    echo "------------------------------------"
    grep -iE \
    "registrar|creation|expir|name server|email|org" \
    "whois_${target}.txt" 2>/dev/null
}

run_harvester() {
    echo ""
    echo "[+] Running theHarvester on $target..."
    echo "------------------------------------"

    echo "[*] Source: Google + Bing"
    theHarvester -d "$target" \
    -b google,bing \
    -l 100 \
    -f "harvester_google_${target}.html"

    echo ""
    echo "[*] Source: LinkedIn"
    theHarvester -d "$target" \
    -b linkedin \
    -l 50 \
    -f "harvester_linkedin_${target}.html"

    echo ""
    echo "[*] Source: DNSdumpster"
    theHarvester -d "$target" \
    -b dnsdumpster \
    -f "harvester_dns_${target}.html"
}

run_all() {
    run_whois
    run_harvester
}

print_summary() {
    echo ""
    echo "===================================="
    echo " Passive Recon completed."
    echo " Output files:"
    echo "------------------------------------"
    ls -lh *"${target}"* 2>/dev/null
    echo "===================================="
}

run_monitor() {
    while true; do
        print_header
        show_menu

        case "$choice" in
            1) get_target; run_whois ;;
            2) get_target; run_harvester ;;
            3) get_target; run_all ;;
            4) echo "Goodbye."; exit 0 ;;
            *) echo "[ERROR] Invalid option." ;;
        esac

        print_summary
        echo ""
        read -rp "Press ENTER to continue..." _
    done
}

run_monitor
