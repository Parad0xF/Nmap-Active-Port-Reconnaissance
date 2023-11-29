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
        @{ Number=1; ScanType="-sn -PA"; OutputFile=".\Windows-Results\arp-scan-results.txt" },
        @{ Number=2; ScanType="-sn -PA"; OutputFile=".\Windows-Results\arp-scan-results.txt" }
    )
    [OperatingSystem]::Unix = @(
        @{ Number=1; ScanType="-sn -PA"; OutputFile=".\Linux\arp-scan-results.txt" },
        @{ Number=2; ScanType="-sn -PU"; OutputFile=".\Linux\UDP-scan-results.txt" }
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
