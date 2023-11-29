## Enum Definition:

```powershell
enum OperatingSystem {
    Windows = 1
    Unix = 2
}
```
This defines an enumeration named OperatingSystem with two members: Windows and Unix. Enumerations provide a way to group named constants.

## Function Definition: Invoke-NmapScan:

```powershell
function Invoke-NmapScan {
```
This line starts the definition of a function named Invoke-NmapScan.

## Function Parameters:

```
    param (
        [int]$CommandNumber,
        [string]$ScanType,
        [string]$OutputFile,
        [string]$TargetIP
    )

```
This part declares the parameters that the function accepts - CommandNumber, ScanType, OutputFile, and TargetIP.

## Command String Construction:

```powershell
$command = "nmap $ScanType $TargetIP -oN $OutputFile"
Constructs a string for the nmap command using the provided parameters.
```
Executing the Command:

```powershell
Start-Process -FilePath "nmap" -ArgumentList "$ScanType", "$TargetIP", "-oN", "$OutputFile" -NoNewWindow -Wait
```
Executes the nmap command safely using Start-Process with the specified arguments.

## Error Handling:

```powershell
try {
Begins a try block for error handling.
```
## Success Message:

```powershell

Write-Host "Command $CommandNumber successful."
```

Prints a success message if the command executes without errors.

## Catch Block:

```powershell

} catch {
    Write-Host "Command $CommandNumber failed. Error: $_"
    return $false
}
```

Catches any errors that occur during command execution, prints an error message, and returns $false.

### Function Return on Success:

```powershell
return $true
```

Returns $true if the command executes successfully.

## Function Definition: IsValidIPAddress:

```powershell
function IsValidIPAddress {
```
Starts the definition of a function named IsValidIPAddress.

## IP Address Validation:

``` powershell
return ($ip -match '^\d{1,3}(\.\d{1,3}){3}$')
```
Uses a regular expression to check if the provided IP address is valid and returns the result.

### Read User Input for OS: 

```powershell
$selectedOS = [OperatingSystem](Read-Host "Please enter the operating system to target (1 for Windows, 2 for Unix)")
```
Prompts the user to enter the operating system to target and casts the input to the OperatingSystem enum.

## Read User Input for IP Address:

``` powershell
$targetIP = Read-Host "Please enter the target IP address"
```
Prompts the user to enter the target IP address.

## Validate IP Address:

``` powershell
if (-not (IsValidIPAddress $targetIP)) {
```

Checks if the entered IP address is valid. The -not operator is used for negation.

## Conditional Execution and Return:

```powershell
Write-Host "Invalid IP address format. Exiting..."
return
}
```
If the IP address is invalid, prints a message and exits the script.

## Command Configurations:

```powershell
$commandConfigurations = @{
```

Defines a hashtable (@{}) for storing command configurations for Windows and Unix systems.

## Creating Directory if Not Exists:

``` powershell
if (-not (Test-Path -Path $folderPath)) {
    Write-Host "Creating folder $folderPath..."
    New-Item -Path $folderPath -ItemType Directory | Out-Null
}
```
Checks if the specified folder path exists, and if not, creates it.

## Looping Through Commands:

```powershell
foreach ($command in $commandConfigurations[$selectedOS]) {
```
Iterates over the command configurations for the selected operating system.

## Invoke Command and Handle Result:
```powershell
    $result = Invoke-NmapScan -CommandNumber $command.Number -ScanType $command.ScanType -OutputFile $command.OutputFile -TargetIP $targetIP
    if (-not $result) {
        Write-Host "Failed to execute some commands. Exiting..."
        break

```