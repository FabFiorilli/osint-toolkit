#!/bin/bash

# ============================================
# web_recon.sh
# Automated web reconnaissance
# Runs: dirb + urlcrazy
# Author: Fabrizio Fiorilli
# ============================================

print_header() {
    clear
    echo "===================================="
    echo "          WEB RECON"
    echo "===================================="
}

show_menu() {
    echo ""
    echo "[1] Directory scan     (dirb)"
    echo "[2] Typosquatting scan (urlcrazy)"
    echo "[3] Full web recon     (both modules)"
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

run_dirb() {
    echo ""
    echo "[+] Running dirb on $target..."
    echo "------------------------------------"
    dirb "http://${target}" \
    -z 100 \
    -o "dirb_${target}.txt"

    echo ""
    echo "[+] Scanning for sensitive extensions..."
    echo "------------------------------------"
    dirb "http://${target}" \
    -X .php,.txt,.html,.log,.env,.conf \
    -z 100 \
    -o "dirb_ext_${target}.txt"
}

run_urlcrazy() {
    echo ""
    echo "[+] Running urlcrazy on $target..."
    echo "------------------------------------"
    urlcrazy -f csv \
    -o "urlcrazy_${target}.csv" \
    "$target"
}

run_all() {
    run_dirb
    run_urlcrazy
}

print_summary() {
    echo ""
    echo "===================================="
    echo " Web Recon completed."
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
            1) get_target; run_dirb ;;
            2) get_target; run_urlcrazy ;;
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
