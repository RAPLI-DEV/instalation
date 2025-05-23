#!/bin/bash
# File: install_RPLII_TOOLS.sh
# Make sure to run this script as root.
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root" 
    exit 1
fi

if ! command -v dialog &> /dev/null; then
    echo "please install dialog to run this program"
    read -p "Do you want to install this program ? [y/n] " install_choice
        install_choice=${install_choice:-n}
    if [[ "$install_choice" =~ ^[Yy]$ ]]; then
        sudo apt-get update && sudo apt-get install dialog -y
    else
        echo "installation aborted dialog program terminated"
        exit 1
    fi
fi

dialog --title "instalation package" \
--backtitle "repository from RAPLI-DEV" \
--yesno "\nAfter installation, to ensure the package has no errors and runs properly, you must reboot\n\nAre you sure you want to install the package?" 10 60
response=$?

if [ $response -eq 0 ]; then

    clear
    
    echo -e "\e[31m██╗███╗   ██╗███████╗████████╗ █████╗ ██╗      █████╗ ████████╗██╗ ██████╗ ███╗   ██╗    ██████╗  █████╗  ██████╗ ███████╗    ██╗\e[0m"
    echo -e "\e[31m██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║    ██╔══██╗██╔══██╗██╔════╝ ██╔════╝    ██║\e[0m"
    echo -e "\e[31m██║██╔██╗ ██║███████╗   ██║   ███████║██║     ███████║   ██║   ██║██║   ██║██╔██╗ ██║    ██████╔╝███████║██║  ███╗█████╗      ██║\e[0m"
    echo -e "\e[31m██║██║╚██╗██║╚════██║   ██║   ██╔══██║██║     ██╔══██║   ██║   ██║██║   ██║██║╚██╗██║    ██╔═══╝ ██╔══██║██║   ██║██╔══╝      ╚═╝\e[0m"
    echo -e "\e[31m██║██║ ╚████║███████║   ██║   ██║  ██║███████╗██║  ██║   ██║   ██║╚██████╔╝██║ ╚████║    ██║     ██║  ██║╚██████╔╝███████╗    ██╗\e[0m"
    echo -e "\e[31m╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝    ╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚══════╝    ╚═╝\e[0m"
    echo -e "\e[31m                                                                                                                             \e[0m"
    echo -e "\e[31mrun the installation                                                                                                         \e[0m"
    echo -e "\e[31m                                                                                                                             \e[0m"

    sleep 2
    clear

    apt update && apt upgrade -y
    apt install -y openssl gnupg bash curl wget jq nano tree zip unzip p7zip-full
    apt install -y \
    ruby-full php-cli python3 python3-pip python3-venv openjdk-17-jdk \
    gcc g++ make cmake automake autoconf clang clang+ rustc build-essential golang-go
    apt install -y nodejs npm
    apt install -y git perl mercurial subversion bzr
    apt install -y vim zsh tmux screen emacs
    apt install -y htop xxd steghide ncdu iotop dstat
    apt install -y docker.io docker-compose ssh
    apt install -y net-tools nmap tcpdump ufw traceroute mtr iperf3 arping
    apt install -y tar rsync
    apt install -y fail2ban mc exuberant-ctags silversearcher-ag ripgrep neofetch aptitude
    apt install -y aircrack-ng john hashcat sqlmap hydra metasploit-framework wireshark ettercap-common ettercap-graphical
    apt install -y nginx mariadb-server mariadb-client postgresql php-fpm certbot
    apt install -y openvpn wireguard
    apt install -y gparted synaptic
    sudo apt install -y libglib2.0-dev libgcrypt20-dev libc-ares-dev libpcap-dev libcap-dev libssh-dev libnghttp2-dev zlib1g-dev bison flex qt6-base-dev qt6-tools-dev qt6-tools-dev-tools
    sudo apt install -y libsmi2-dev libmaxminddb-dev libnl-3-dev libnl-genl-3-dev libkrb5-dev libbrotli-dev liblz4-dev libzstd-de

    clear
    
    echo -e "\033[37m██████╗  █████╗ ██████╗ ██╗     ██╗\033[0m"
    echo -e "\033[37m██╔══██╗██╔══██╗██╔══██╗██║     ██║\033[0m"
    echo -e "\033[37m██████╔╝███████║██████╔╝██║     ██║\033[0m"
    echo -e "\033[37m██╔══██╗██╔══██║██╔═══╝ ██║     ██║\033[0m"
    echo -e "\033[37m██║  ██║██║  ██║██║     ███████╗██║\033[0m"
    echo -e "\033[37m╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚══════╝╚═╝\033[0m\n"
    echo -e "\033[32mINSTALATION SUCCESS from RAPLI-DEV\033[0m"
    echo -e "\033[31m███████ INDONESIA\033[0m"
    echo -e "███████ DJAWA TIMOER\n"

    echo "Instalation success !"
        read -p "Do you want to restart the PC ? [y/n] " install_choice
        install_choice=${install_choice:-n}
    if [[ "$install_choice" =~ ^[Yy]$ ]]; then
        echo "Your device will reboot in 5 seconds"
        echo -e "\e[31mWARNING ! if you use wsl please ctrl+D and run wsl --shutdown in powershell\e[0m"
        sleep 5
        reboot
    else
        exit 1
    fi
else
    clear
fi

