#!/bin/bash

# ASCII Art
art='
██╗  ██╗ █████╗  ██████╗██╗  ██╗  ████████╗██╗  ██╗███████╗    ███████╗██╗   ██╗███████╗
██║  ██║██╔══██╗██╔════╝██║ ██╔╝  ╚══██╔══╝██║  ██║██╔════╝    ██╔════╝╚██╗ ██╔╝██╔════╝
███████║███████║██║     █████╔╝█████╗██║   ███████║█████╗█████╗███████╗ ╚████╔╝ ███████╗
██╔══██║██╔══██║██║     ██╔═██╗╚════╝██║   ██╔══██║██╔══╝╚════╝╚════██║  ╚██╔╝  ╚════██║
██║  ██║██║  ██║╚██████╗██║  ██╗     ██║   ██║  ██║███████╗    ███████║   ██║   ███████║
╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝     ╚═╝   ╚═╝  ╚═╝╚══════╝    ╚══════╝   ╚═╝   ╚══════╝
'
echo "$art"

# Function to perform Nmap scan
invoke_nmap_scan() {
    local command_number=$1
    local scan_type=$2
    local output_file=$3
    local target_ip=$4

    command="nmap $scan_type $target_ip -oN $output_file"
    echo "Running command $command_number: $command"

    if nmap $scan_type $target_ip -oN $output_file; then
        echo "Command $command_number successful."
    else
        echo "Command $command_number failed."
        return 1
    fi
    return 0
}

# Function to validate IP address
is_valid_ip_address() {
    if [[ $1 =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
        return 0
    else
        return 1
    fi
}

# Main script execution
echo "Please enter the operating system to target (1 for Windows, 2 for Unix)"
read selected_os

echo "Please enter the target IP address"
read target_ip

if ! is_valid_ip_address "$target_ip"; then
    echo "Invalid IP address format. Exiting..."
    exit 1
fi

echo "Hold on to your butts, this is going to be fun!"

if [ "$selected_os" -eq 1 ]; then
    folder_path="./Windows-Results"
    declare -a command_configurations=(
        '-sT -Pn ./Windows-Results/FULL-TCP-scan-results.txt'
        '-sS -PA ./Windows-Results/Stealth-scan-results.txt'
        # ... other configurations
    )
else
    folder_path="./Linux"
    declare -a command_configurations=(
        '-sT -Pn ./Linux/FULL-TCP-scan-results.txt'
        '-sS -PA ./Linux/Stealth-scan-results.txt'
        # ... other configurations
    )
fi

[ ! -d "$folder_path" ] && mkdir -p "$folder_path"

command_number=1
for config in "${command_configurations[@]}"; do
    invoke_nmap_scan "$command_number" $config "$target_ip"
    if [ $? -ne 0 ]; then
        echo "Failed to execute some commands. Exiting..."
        break
    fi
    echo "Successfully scanned the host"
    ((command_number++))
done
