
#Global vars for operation systems
$winOS = 1
$unixOS = 2
$funcExitStatus

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
$userInputOS = Read-host -Prompt "Please enter the what operation system you would like to target?`n For Windows OS type - 1 ... `n For Linux OS type - 2 ... `n"

# Print the OS input
Write-Host "You entred: $userInputOS"

# Prompt the user for Target IP
$userInputIP = Read-host -Prompt "Please enter the what operation system you would like to target? ..."

# Print the target IP
Write-Host "You entred: $userInputIP"

# IP Address Range
$ip = $userInputIP



# Command configurations
$commandsWindows = @(
    @{ Number=1; ScanType="-sn -PA"; OutputFile=".\Windows-Results\arp-scan-results.txt" },
    @{ Number=2; ScanType="-sn -PA"; OutputFile=".\Windows-Results\arp-scan-results.txt" }

)
$commandsLinux = @(
    @{ Number=1; ScanType="-sn -PA"; OutputFile="Linux\arp-scan-results.txt" },
    @{ Number=2; ScanType="-sn -PU"; OutputFile="Linux\UDP-scan-results.txt" }

)
# Run the commands

$folderPathWin = ".\Windows-Results"

if (Test-Path -Path $folderPathWin) {
    Write-Host "Folder exist"
    $userChoise = Read-Host -Prompt "Overwrite it Yes or No ... ?".ToLower()

    if ($userChoise -eq "yes"){
        if($userInputOS -eq $winOS ) {
            foreach ($command in $commandsWindows) {
                Run-Nmap -CommandNumber $command.Number -ScanType $command.ScanType -OutputFile $command.OutputFile
                Write-Host "Successfully scanned the host"
            } 
        }
    } else { 

        return "Stopping process return " + $false
        exit $false
    }

} else {

    Write-Host "Createing a folder .\Windows-Results ...."
    mkdir .\Windows-Results
    foreach ($command in $commandsWindows) {
        Run-Nmap -CommandNumber $command.Number -ScanType $command.ScanType -OutputFile $command.OutputFile
        Write-Host "Successfully scanned the host"
    }

}


if($userInputOS -eq $unixOS )
{
    foreach ($command in $commandsWindows) {
        Run-Nmap -CommandNumber $command.Number -ScanType $command.ScanType -OutputFile $command.OutputFile
    }
}



