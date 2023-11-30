<p align=”center”>
    <a href="https://raensec.com/">
        <img width=”200" height=”200"  src="https://github.com/Parad0xF/Nmap-Active-Port-Reconnaissance/assets/34218173/299d4867-b0c7-4962-b38b-0e65116a7416" alt=”Scanning Types”>
    <a/>
</p>

---

<p align="center"><b>Let's explore the limitless possibilities of technology together!</b></p>

---

### 🌟 What's Inside?

<p align=”center”>
    <a href="https://www.youtube.com/channel/UC9jbwalXYXFl2kdZsUNY0Sw/about">
        <img width=”200" height=”200"  src="https://github.com/Parad0xF/Nmap-Active-Port-Reconnaissance/assets/34218173/86f689aa-ba07-4fcd-aabd-54b34a029dfb" alt=”Scanning Types”>
    <a/>
</p>


## 🚀 Quick Start
Clone the repository and navigate to the project of your interest:
```bash
git clone https://github.com/Parad0xF/Nmap-Active-Port-Reconnaissance.git
cd Nmap-Active-Port-Reconnaissance/
```

## 📫 Connect with Me
- LinkedIn: [Radu Enachi](https://linkedin.com/in/radu-enachi)
- YouTube: [Parad0x's Channel](https://www.youtube.com/channel/UC9jbwalXYXFl2kdZsUNY0Sw)
- Personal Web [Radu's Site](https://raensec.com)

---



# Nmap Installation Guide for Linux

This repository provides a guide to install `nmap`, a network scanning tool, on Windows using PowerShell.

## Prerequisites

- Debian/Ubuntu operating system
- Bash/Terminal with administrative rights
- Internet connection

## Installation Steps for Linux

### Step 1: Install Nmap

- Nmap can usually be installed directly from your distribution's package manager. For most Linux distributions, you can use one of the following commands:

#### On Debian/Ubuntu:
- Execute the command
    ```bash
    sudo apt-get update && apt-get install nmap && nmap --version
    ```
<br></br>

# Nmap Installation Guide for Windows

This repository provides a guide to install `nmap`, a network scanning tool, on Windows using PowerShell.

## Prerequisites

- Windows operating system
- PowerShell with administrative rights
- Internet connection

## Installation Steps

### Step 1: Download the Nmap Installer

1. **Open PowerShell as Administrator**:
   - Right-click on the PowerShell icon.
   - Select "Run as administrator".

2. **Download the Installer**:
   - Execute the command below in PowerShell to download the Nmap installer. 
   - Replace `URL_TO_NMAP_INSTALLER` with the download URL from the [official Nmap website](https://nmap.org/download.html).

    ```powershell
    Invoke-WebRequest -Uri URL_TO_NMAP_INSTALLER -OutFile "nmap-setup.exe"
    ```

    For example:

    ```powershell
    Invoke-WebRequest -Uri "https://nmap.org/dist/nmap-7.91-setup.exe" -OutFile "nmap-setup.exe"
    ```

### Step 2: Run the Installer

- Run the downloaded installer using the command:

  ```powershell
  Start-Process -FilePath ".\nmap-setup.exe"
### Step 3: Follow the Installation Prompts

#### Install Nmap:
- Follow the on-screen instructions in the setup wizard.
- Choose the components to install and the installation directory.

#### Complete the Setup:
- Finish the installation process by following the prompts.

### Step 4: Verify Installation

- Confirm Nmap installation by opening a new PowerShell or Command Prompt window and running:
  ```powershell
  nmap -v
This should display the Nmap version, indicating successful installation.

<br></br>




## Running the Linux/Bash Script
To run the Bash script, follow these steps:

### Run the script:
- Navigate to the directory containing the script in PowerShell.
- Execute the script:

    ```sh
    cd Nmap-Active-Port-Reconnaissance/Linux
    sh bash-nmap-multi-port-recon.sh
    ```
<br></br>


## Running the PowerShell Script
To run the PowerShell script, follow these steps:
### Open PowerShell:
- Open PowerShell on your Windows system.

### Run the Script:
- Navigate to the directory containing the script in PowerShell.
- Execute the script:

    ```powershell
    cd Nmap-Active-Port-Reconnaissance\Windows
    .\powershell-nmap-multi-port-recon.ps1
### Notes
- Always download Nmap from its official website to ensure security and get the latest version.
- The download URL may vary with different Nmap versions; refer to the official website for the most recent link.
- Running PowerShell as an administrator is necessary for installing software.
- Nmap's installation includes WinPcap/Npcap, essential for network packet capture. Ensure these components are installed with Nmap.

## License

This guide is released under the [MIT License](LICENSE).

---

Feel free to contribute to this guide by submitting issues or pull requests.

