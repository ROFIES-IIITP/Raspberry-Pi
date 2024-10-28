# Raspberry Pi Post Setup Guide


## 1. Initial Setup

### 1.1 Booting Up
1. Connect the HDMI cable to your monitor.
2. Plug in the keyboard and mouse.
3. Power on the Raspberry Pi by connecting the power supply.
4. Follow the on-screen instructions to complete the initial setup.

## 2. Network Configuration

### 2.1 Wired Connection
- Connect the Ethernet cable from your router to the Raspberry Pi.
- Verify the connection by checking the network settings.

### 2.2 Wi-Fi Connection
1. Open the terminal and run:
   ```bash
   sudo nmtui
   ```
   Go to `Activate a Connection` option, select your Wi-Fi and enter the passowrd.

## 3. Software Installation
### 3.1 Install `nala`
Install `nala` to get better readability from the terminal
```bash
sudo apt install nala -y
```
### 3.2 Updating the System
Run the following commands to ensure your system is up-to-date:
```bash
sudo nala update && sudo nala upgrade -y
```
### 3.3 Installing Essential Software
- btop
    ```bash
    sudo nala install btop
    ```
- SSH Server
  ```bash
  sudo nala install openssh-server -y
    ```
- Additional Tools
    ```bash
    sudo apt install vim git curl -y
    ```
## 4. Security Measures
###  4.1 Change Default Password
  Use the `passwd` command to change the default password.
### 4.2 Configure Firewall
  Install and configure ufw (Uncomplicated Firewall):
  ```bash
sudo apt install ufw -y
sudo ufw enable
```
### 4.3 Disable Unused Services
Check for and disable any unnecessary services using:
```bash
sudo systemctl disable <service-name>
```