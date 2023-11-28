#!/bin/bash

# Function to run nmap command
run_nmap() {
    local command_number=$1
    local scan_type=$2
    local output_file=$3

    echo "Running command $command_number: nmap $scan_type $ip -oN $output_file"
    if ! nmap $scan_type $ip -oN $output_file; then
        echo "Command $command_number failed. Exiting."
        exit 1
    else
        echo "Command $command_number successful."
    fi
}

# IP Address Range
ip="192.168.1.1/24"

# Run the commands
run_nmap 1 "-sn -PA" "arp-scan-results.txt"
run_nmap 2 "-sn -PU" "UDP-scan-results.txt"
run_nmap 3 "-sn -PE" "ECHO-scan-results.txt"
run_nmap 4 "-sn -PP" "ICMP-Timestamp-scan-results.txt"
run_nmap 5 "-sn -PM" "ICMP-Mask-scan-results.txt"
run_nmap 6 "-sn -PS" "TCP-SYN-scan-results.txt"
run_nmap 7 "-sn -PA" "TCP-ACK-scan-results.txt"
run_nmap 8 "-sn -PO" "TCP-ACK-scan-results.txt"

echo "Successfully scanned the environment"