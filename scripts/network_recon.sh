#!/bin/bash

# ============================================
# network_recon.sh
# Automated network reconnaissance
# Runs: nmap multi-mode + enum4linux
# Author: Fabrizio Fiorilli
# ============================================

print_header() {
    clear
    echo "===================================="
    echo "       NETWORK RECON"
    echo "===================================="
}

show_menu() {
    echo ""
    echo "[1] Quick scan      (top 1000 ports)"
    echo "[2] Full scan       (all 65535 ports)"
    echo "[3] Aggressive scan (OS + version + scripts)"
    echo "[4] SMB enum        (enum4linux)"
    echo "[5] Full recon      (all modules)"
    echo "[6] Exit"
    echo "===================================="
    read -rp "Choose an option: " choice
}

get_target() {
    read -rp "Enter target IP/domain: " target
    if [[ -z "$target" ]]; then
        echo "[ERROR] No target specified."
        exit 1
    fi
}

run_quick() {
    echo ""
    echo "[+] Quick scan on $target..."
    echo "------------------------------------"
    nmap -T4 --open "$target" \
    -oN "nmap_quick_${target}.txt"
}

run_full() {
    echo ""
    echo "[+] Full port scan on $target..."
    echo "------------------------------------"
    nmap -p- -T4 --open "$target" \
    -oN "nmap_full_${target}.txt"
}

run_aggressive() {
    echo ""
    echo "[+] Aggressive scan on $target..."
    echo "------------------------------------"
    nmap -A -T4 "$target" \
    -oN "nmap_aggressive_${target}.txt"
}

run_enum4linux() {
    echo ""
    echo "[+] Running enum4linux on $target..."
    echo "------------------------------------"
    enum4linux -a "$target" | \
    tee "enum4linux_${target}.txt"
}

run_all() {
    run_quick
    run_full
    run_aggressive
    run_enum4linux
}

print_summary() {
    echo ""
    echo "===================================="
    echo " Network Recon completed."
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
            1) get_target; run_quick ;;
            2) get_target; run_full ;;
            3) get_target; run_aggressive ;;
            4) get_target; run_enum4linux ;;
            5) get_target; run_all ;;
            6) echo "Goodbye."; exit 0 ;;
            *) echo "[ERROR] Invalid option." ;;
        esac

        print_summary
        echo ""
        read -rp "Press ENTER to continue..." _
    done
}

run_monitor
