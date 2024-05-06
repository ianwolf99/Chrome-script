#!/bin/bash

# Function to display banner
display_banner() {
    echo "**********************************************"
    echo "***     Welcome to Google Chrome Installer  ***"
    echo "***          Created by Ianwolf99           ***"
    echo "**********************************************"
    echo
}

# Function to download and install Google Chrome
install_google_chrome() {
    echo "Downloading Google Chrome..."
    wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

    echo "Installing Google Chrome..."
    echo "Please enter your password if prompted to proceed with the installation."
    sudo apt install ./google-chrome-stable_current_amd64.deb

    echo "Google Chrome installed successfully!"
}

# Main script
display_banner
install_google_chrome
