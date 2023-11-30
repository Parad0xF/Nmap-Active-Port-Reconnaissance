import subprocess
import re
import os

# ASCII art
art = """
██╗  ██╗ █████╗  ██████╗██╗  ██╗  ████████╗██╗  ██╗███████╗    ███████╗██╗   ██╗███████╗
██║  ██║██╔══██╗██╔════╝██║ ██╔╝  ╚══██╔══╝██║  ██║██╔════╝    ██╔════╝╚██╗ ██╔╝██╔════╝
███████║███████║██║     █████╔╝█████╗██║   ███████║█████╗█████╗███████╗ ╚████╔╝ ███████╗
██╔══██║██╔══██║██║     ██╔═██╗╚════╝██║   ██╔══██║██╔══╝╚════╝╚════██║  ╚██╔╝  ╚════██║
██║  ██║██║  ██║╚██████╗██║  ██╗     ██║   ██║  ██║███████╗    ███████║   ██║   ███████║
╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝     ╚═╝   ╚═╝  ╚═╝╚══════╝    ╚══════╝   ╚═╝   ╚══════╝
"""
print(art)

# Enum equivalent
class OperatingSystem:
    Windows = 1
    Unix = 2

# Function to invoke Nmap scan
def invoke_nmap_scan(command_number, scan_type, output_file, target_ip):
    command = f"nmap {scan_type} {target_ip} -oN {output_file}"
    print(f"Running command {command_number} {command}")

    try:
        subprocess.run(["nmap"] + scan_type.split() + [target_ip, "-oN", output_file], check=True)
        print(f"Command {command_number} successful.")
        return True
    except subprocess.CalledProcessError as e:
        print(f"Command {command_number} failed. Error: {e}")
        return False

# Function to validate IP address
def is_valid_ip_address(ip):
    return re.match(r'^\d{1,3}(\.\d{1,3}){3}$', ip) is not None

# Main script execution
selected_os = int(input("Please enter the operating system to target (1 for Windows, 2 for Unix): "))
target_ip = input("Please enter the target IP address: ")

if not is_valid_ip_address(target_ip):
    print("Invalid IP address format. Exiting...")
    exit()

print("Hold on to your butts, this is going to be fun!")

command_configurations = {
    OperatingSystem.Windows: [
        {"Number": 1, "ScanType": "-sT -Pn", "OutputFile": "./Windows-Results/FULL-TCP-scan-results.txt"},
        # Add other configurations for Windows...
    ],
    OperatingSystem.Unix: [
        {"Number": 1, "ScanType": "-sT -Pn", "OutputFile": "./Linux/FULL-TCP-scan-results.txt"},
        # Add other configurations for Unix...
    ]
}

folder_path = "./Windows-Results" if selected_os == OperatingSystem.Windows else "./Linux"

if not os.path.exists(folder_path):
    print(f"Creating folder {folder_path}...")
    os.makedirs(folder_path)

for command in command_configurations[selected_os]:
    result = invoke_nmap_scan(command["Number"], command["ScanType"], command["OutputFile"], target_ip)
    if not result:
        print("Failed to execute some commands. Exiting...")
        break

    print("Successfully scanned the host")
