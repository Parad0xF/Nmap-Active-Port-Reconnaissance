$art = @"
██╗  ██╗ █████╗  ██████╗██╗  ██╗  ████████╗██╗  ██╗███████╗    ███████╗██╗   ██╗███████╗
██║  ██║██╔══██╗██╔════╝██║ ██╔╝  ╚══██╔══╝██║  ██║██╔════╝    ██╔════╝╚██╗ ██╔╝██╔════╝
███████║███████║██║     █████╔╝█████╗██║   ███████║█████╗█████╗███████╗ ╚████╔╝ ███████╗
██╔══██║██╔══██║██║     ██╔═██╗╚════╝██║   ██╔══██║██╔══╝╚════╝╚════██║  ╚██╔╝  ╚════██║
██║  ██║██║  ██║╚██████╗██║  ██╗     ██║   ██║  ██║███████╗    ███████║   ██║   ███████║
╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝     ╚═╝   ╚═╝  ╚═╝╚══════╝    ╚══════╝   ╚═╝   ╚══════╝
"@

# Display the art in PowerShell
Write-Host $art

enum OperatingSystem {
    Windows = 1
    Unix = 2
}

function Invoke-NmapScan {
    param (
        [int]$CommandNumber,
        [string]$ScanType,
        [string]$OutputFile,
        [string]$TargetIP
    )

    $command = "nmap $ScanType $TargetIP -oN $OutputFile"
    Write-Host "Running command $CommandNumber $command"

    try {
        # Safer alternative to Invoke-Expression
        Start-Process -FilePath "nmap" -ArgumentList "$ScanType", "$TargetIP", "-oN", "$OutputFile" -NoNewWindow -Wait
        Write-Host "Command $CommandNumber successful."
    } catch {
        Write-Host "Command $CommandNumber failed. Error: $_"
        return $false
    }
    return $true
}

function IsValidIPAddress {
    param ([string]$ip)
    return ($ip -match '^\d{1,3}(\.\d{1,3}){3}$')
}

# Main script execution starts here
$selectedOS = [OperatingSystem](Read-Host "Please enter the operating system to target (1 for Windows, 2 for Unix)")

$targetIP = Read-Host "Please enter the target IP address"

if (-not (IsValidIPAddress $targetIP)) {
    Write-Host "Invalid IP address format. Exiting..."
    return
}

$commandConfigurations = @{
    [OperatingSystem]::Windows = @(
        @{ Number=1; ScanType="-sT -Pn"; OutputFile=".\Windows-Results\FULL-TCP-scan-results.txt" },
        @{ Number=2; ScanType="-sS -PA"; OutputFile=".\Windows-Results\Stealh-scan-results.txt" },
        @{ Number=4; ScanType="-sW -PA"; OutputFile=".\Windows-Results\Win-ACK-Probe-scan-results.txt" },
        @{ Number=5; ScanType="-sU -PA"; OutputFile=".\Windows-Results\UDP-scan-results.txt" },
        @{ Number=6; ScanType="-sY -PA"; OutputFile=".\Windows-Results\INIT-scan-results.txt" },
        @{ Number=7; ScanType="-sZ -PA"; OutputFile=".\Windows-Results\COOKIE-scan-results.txt" }
    )
    [OperatingSystem]::Unix = @(
        @{ Number=1; ScanType="-sT -Pn"; OutputFile=".\Linux\FULL-TCP-scan-results.txt" },
        @{ Number=2; ScanType="-sS -PA"; OutputFile=".\Linux\Stealh-scan-results.txt" },
        @{ Number=3; ScanType="-sX -Pn"; OutputFile=".\Linux\XMAS-scan-results.txt" },
        @{ Number=4; ScanType="-sF -PA"; OutputFile=".\Linux\FIN-scan-results.txt" },
        @{ Number=5; ScanType="-sM -Pn"; OutputFile=".\Linux\Maimon-scan-results.txt" },
        @{ Number=6; ScanType="-sA -PA"; OutputFile=".\Linux\ACK-Probe-scan-results.txt" },
        @{ Number=7; ScanType="-sA -ttl 100 -PA"; OutputFile=".\Linux\ACK-TTL-scan-results.txt" },
        @{ Number=8; ScanType="-sY -PA"; OutputFile=".\Linux\INIT-scan-results.txt" },
        @{ Number=9; ScanType="-sZ -PA"; OutputFile=".\Linux\COOKIE-scan-results.txt" }
    )
}

$folderPath = if ($selectedOS -eq [OperatingSystem]::Windows) { ".\Windows-Results" } else { ".\Linux" }

if (-not (Test-Path -Path $folderPath)) {
    Write-Host "Creating folder $folderPath..."
    New-Item -Path $folderPath -ItemType Directory | Out-Null
}

foreach ($command in $commandConfigurations[$selectedOS]) {
    $result = Invoke-NmapScan -CommandNumber $command.Number -ScanType $command.ScanType -OutputFile $command.OutputFile -TargetIP $targetIP
    if (-not $result) {
        Write-Host "Failed to execute some commands. Exiting..."
        break
    }
    Write-Host "Successfully scanned the host"
}
