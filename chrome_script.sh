#!/bin/bash

# Function to display banner
display_banner() {
    echo "**********************************************"
    echo "***          Welcome to Chrome Script       ***"
    echo "***               Created by Ianwolf99      ***"
    echo "**********************************************"
    echo
}

# Function to log messages with timestamps
log() {
    echo "$(date +"%Y-%m-%d %T"): $1" >> chrome_script.log
}

# Function to display menu and get user choice
show_menu() {
    echo "Please select a command:"
    echo "1. Open Google Chrome with a specific URL"
    echo "2. Open Google Chrome in incognito mode"
    echo "3. Open Google Chrome in a new window"
    echo "4. Set HTTP/SOCKS proxy server"
    echo "5. Disable proxy server"
    echo "6. Autodetect proxy configuration"
    echo "7. Set proxy autoconfiguration URL"
    echo "8. Set password store"
    echo "9. Show version information"
    echo "0. Exit"

    read -p "Enter your choice: " choice
    log "User selected option $choice"
}

# Function to open Google Chrome with a specific URL
open_with_url() {
    read -p "Enter the URL: " url
    log "Opening Google Chrome with URL: $url"
    google-chrome "$url" 2>> chrome_script.log
}

# Main script
display_banner
log "Script execution started"
while true; do
    show_menu
    case $choice in
        1) open_with_url ;;
        2) log "Opening Google Chrome in incognito mode"
           google-chrome --incognito 2>> chrome_script.log ;;
        3) log "Opening Google Chrome in a new window"
           google-chrome --new-window 2>> chrome_script.log ;;
        4) read -p "Enter proxy server (host:port): " proxy
           log "Setting HTTP/SOCKS proxy server: $proxy"
           google-chrome --proxy-server="$proxy" 2>> chrome_script.log ;;
        5) log "Disabling proxy server"
           google-chrome --no-proxy-server 2>> chrome_script.log ;;
        6) log "Autodetecting proxy configuration"
           google-chrome --proxy-auto-detect 2>> chrome_script.log ;;
        7) read -p "Enter proxy autoconfiguration URL: " pac_url
           log "Setting proxy autoconfiguration URL: $pac_url"
           google-chrome --proxy-pac-url="$pac_url" 2>> chrome_script.log ;;
        8) read -p "Enter password store (basic|gnome|kwallet): " password_store
           log "Setting password store: $password_store"
           google-chrome --password-store="$password_store" 2>> chrome_script.log ;;
        9) log "Showing version information"
           google-chrome --version 2>> chrome_script.log ;;
        0) echo "Exiting..."; log "Script execution ended"; exit ;;
        *) echo "Invalid choice. Please enter a valid option." ;;
    esac
done
