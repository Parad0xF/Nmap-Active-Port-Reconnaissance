<p align=”center”>
    <a>
        <img width=”200" height=”200" src=https://github.com/Parad0xF/Nmap-Active-Reconnaissance/assets/34218173/4d1a831c-7d46-4bc7-891b-e28aaaf72a4f" alt=”my banner”>
    <a/>
</p>



<h2 align="center">👋 Hi, I'm Parad0x</h1>
<h3 align="center">🔥 A Passionate Cyber-Security Professional and Penetration tools Developer 🔥</h3>

<p align="center">
    <a href="https://linkedin.com/in/radu-enachi" target="_blank">
        <img src="https://raw.githubusercontent.com/rahuldkjain/github-profile-readme-generator/master/src/images/icons/Social/linked-in-alt.svg" alt="radu-enachi" height="30" width="40"/>
    </a>
    <a href="https://www.youtube.com/channel/UC9jbwalXYXFl2kdZsUNY0Sw" target="_blank">
        <img src="https://raw.githubusercontent.com/rahuldkjain/github-profile-readme-generator/master/src/images/icons/Social/youtube.svg" alt="Parad0x's YouTube" height="30" width="40"/>
    </a>
    <a href="http://raensec.com" target="_blank">
        <img src="https://github.com/Parad0xF/Nmap-Active-Reconnaissance/assets/34218173/3b0f1874-20b3-48a9-be19-19ac5967ec59" alt="Parad0x's Website" height="30" width="40"/>
    </a>
</p>

<h1 align="center">🌐 Nmap Host Discovery Repository 🌐</h1>
<p align="center">
    <i>Dive into the world of network security with this repository, featuring comprehensive guides and practical applications of Nmap for reconnaissance and host discovery. Explore various scanning techniques including ARP, UDP, ECHO, Ping Sweep, ICMP Timestamp, ICMP Mask, and IP scans, perfecting your skills in cyber-security and network analysis.</i>
</p>



## 🌟 What's Inside?
- In-depth exploration of Nmap for network reconnaissance and host discovery.
- Practical guides on various scanning techniques: ARP, UDP, ECHO, Ping Sweep, ICMP Timestamp, ICMP Mask, and IP scans.
- Detailed walkthroughs and examples for each scanning method to enhance your network analysis skills.

## 🚀 Quick Start
Clone the repository and navigate to the project of your interest:
```bash
git clone https://github.com/Parad0xF/Nmap-Active-Reconnaissance.git
cd Nmap-Active-Reconnaissance/
```
## 🛠️ Technologies & Tools
- **Kali** for penetration testing projects.
- Various programming languages and frameworks for hacking challenges.

## 📚 Learning Resources
- Access in-depth tutorials and documentation within each project.
- Watch video explanations and coding sessions on my [YouTube channel](https://www.youtube.com/channel/UC9jbwalXYXFl2kdZsUNY0Sw).

## 🤝 How to Contribute
- Fork the repository and create your feature branch.
- Submit pull requests with your new features or fixes.
- Share your ideas and feedback in the [Issues](https://github.com/your-username/your-repo-name/issues) section.

## 📫 Connect with Me
- LinkedIn: [Radu Enachi](https://linkedin.com/in/radu-enachi)
- YouTube: [Parad0x's Channel](https://www.youtube.com/channel/UC9jbwalXYXFl2kdZsUNY0Sw)

---

<p align="center">
    <b>Let's explore the limitless possibilities of technology together!</b>
</p>

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
## Running the PowerShell Script

To run the PowerShell script, follow these steps:

### Open PowerShell:
- Open PowerShell on your Windows system.

### Copy the PowerShell Script:
- Copy the following PowerShell script into a file, for example, `Run-Nmap.ps1`.

### Run the Script:
- Navigate to the directory containing the script in PowerShell.
- Execute the script:

    ```powershell
    .\Run-Nmap.ps1
### Notes
- Always download Nmap from its official website to ensure security and get the latest version.
- The download URL may vary with different Nmap versions; refer to the official website for the most recent link.
- Running PowerShell as an administrator is necessary for installing software.
- Nmap's installation includes WinPcap/Npcap, essential for network packet capture. Ensure these components are installed with Nmap.

## License

This guide is released under the [MIT License](LICENSE).

---

Feel free to contribute to this guide by submitting issues or pull requests.

