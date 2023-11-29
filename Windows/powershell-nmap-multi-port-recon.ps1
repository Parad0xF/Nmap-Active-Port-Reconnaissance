function Run-Nmap {
    param (
        [int]$CommandNumber,
        [string]$ScanType,
        [string]$OutputFile
    )

    $command = "nmap $ScanType $ip -oN $OutputFile"
    Write-Host "Running command $CommandNumber $command"

    try {
        Invoke-Expression $command
        Write-Host "Command $CommandNumber successful."
    } catch {
        Write-Host "Command $CommandNumber failed. Exiting."
        exit 1
    }
}

# Prompt the user for OS input
$userInputOS = Read-host -Prompt "Please enter the what operation system you would like to target? ..."

# Print the OS input
Write-Host "You entred: $userInputOS"

# Prompt the user for Target IP
$userInputIP = Read-host -Prompt "Please enter the what operation system you would like to target? ..."

# Print the target IP
Write-Host "You entred: $userInputIP"

# IP Address Range
$ip = $userInputIP



# Command configurations
$commands = @(
    @{ Number=1; ScanType="-sn -PA"; OutputFile="arp-scan-results.txt" },
    @{ Number=2; ScanType="-sn -PU"; OutputFile="UDP-scan-results.txt" },
    @{ Number=3; ScanType="-sn -PE"; OutputFile="ECHO-scan-results.txt" },
    @{ Number=4; ScanType="-sn -PP"; OutputFile="ICMP-Timestamp-scan-results.txt" },
    @{ Number=5; ScanType="-sn -PM"; OutputFile="ICMP-Mask-scan-results.txt" },
    @{ Number=6; ScanType="-sn -PS"; OutputFile="TCP-SYN-scan-results.txt" },
    @{ Number=7; ScanType="-sn -PA"; OutputFile="TCP-ACK-scan-results.txt" },
    @{ Number=8; ScanType="-sn -PO"; OutputFile="TCP-ACK-scan-results.txt" }
)

# Run the commands
foreach ($command in $commands) {
    Run-Nmap -CommandNumber $command.Number -ScanType $command.ScanType -OutputFile $command.OutputFile
}

Write-Host "Successfully scanned the environment"
