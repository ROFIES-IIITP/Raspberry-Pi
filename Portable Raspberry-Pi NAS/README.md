# 📦 Portable Raspberry-Pi NAS

## 🚀 Overview
A portable Network-Attached Storage (NAS) built using a Raspberry-Pi 3. This project allows you to carry your media library and files wherever you go, with the ability to create a wireless hotspot for easy access and streaming.

## ✨ Features
- **🎒 Portable Storage**: Access your files and media on the go.
- **📶 Wireless Hotspot**: The Raspberry-Pi automatically creates a Wi-Fi hotspot for seamless connectivity.
- **🎥 Media Streaming**: Stream movies, music, and more from your NAS to any connected device.
- **🔋 Low Power Consumption**: Efficient power usage, making it ideal for mobile use.

## 🛠️ Hardware Requirements
- Raspberry-Pi 3
- MicroSD card (**16GB or larger**)
- Micro-SD card Reader
- External storage (**USB drive or HDD/SSD**)
- Power supply for your Raspberry-Pi
- Portable power bank for true mobility (*OPTIONAL*)

## 💻 Software Requirements
- Raspberry Pi Imager


## 📖 Installation and Setup
1. **SD-Card Setup**:
    1. Format your Micro SD-Card with the [SD-Card Formatter](https://www.sdcard.org/downloads/formatter/)
    2. Install [Raspberry-Pi Imager](https://www.raspberrypi.com/software/) on your system.
    3. Boot the Raspberry-Pi Imager.
    4. Select your Raspberry Pi Device. For me it was `RaspberryPi-3 Model-B`
   
        <img src="https://res.cloudinary.com/dqaojrihh/image/upload/v1724347155/Screenshot_2024-08-22_223725_ldzv0a.png" >
        <img src="https://res.cloudinary.com/dqaojrihh/image/upload/v1724347155/Screenshot_2024-08-22_223744_val2fz.png" >

    5. Select your Operating System (OS) **(Most Prefered is `Raspberry Pi OS Lite 64-bits`)**
   
        <img src="https://res.cloudinary.com/dqaojrihh/image/upload/v1724347653/Screenshot_2024-08-22_225542-1_clfdua.png" >
        <img src="https://res.cloudinary.com/dqaojrihh/image/upload/v1724347155/Screenshot_2024-08-22_223803_aj0y3w.png" >
        <img src="https://res.cloudinary.com/dqaojrihh/image/upload/v1724347995/Screenshot_2024-08-22_223819_rpvxpm.png" >
    
    6. Select a storage device i.e your Micro SD-Card
        >Warning!!!<br>
        >Be sure not to format any other drive, that may contain your important data

        <img src="https://res.cloudinary.com/dqaojrihh/image/upload/v1724347653/Screenshot_2024-08-22_225542_j4zp4s.png" >
        <img src="https://res.cloudinary.com/dqaojrihh/image/upload/v1724347155/Screenshot_2024-08-22_223917_d2wusa.png">
    
    7. Click on **`NEXT`**, and open **`Edit settings`**
    
        <img src="https://res.cloudinary.com/dqaojrihh/image/upload/v1724347156/Screenshot_2024-08-22_224117_p0djvv.png">
    
    8. Enter your login `username` and `password`
        <img src="https://res.cloudinary.com/dqaojrihh/image/upload/v1724347155/Screenshot_2024-08-22_224049_phy6wl.png">
    
   9. Go to **`SERVICES`** section and click **`Enable SSH`**. Now click on **`SAVE`**

        <img src="https://res.cloudinary.com/dqaojrihh/image/upload/v1724348494/Screenshot_2024-08-22_224058_wkuklm.png">

    10. Now click on **`YES`**, and let the Raspberry Image be written on your Micro SD-Card

        <img src="https://res.cloudinary.com/dqaojrihh/image/upload/v1724347155/Screenshot_2024-08-22_224117-1_z94icl.png">
        <br><br>

        Now wait for the image to flashj into your SD-card.
    
2. **Raspberry-Pi Setup**
   1. Once the above setup is done, take you micro SD-card from the card-reader and insert it into the micro SD-card slot in your Raspberry-Pi.
   
   2. Connect the following peripherals to your Raspberry Pi:
      1. Keyboard `Only to check the IP address of the RaspberryPi `
      2. HDMI Cable `Only to check the IP address of the RaspberryPi`
      3. Ethernet Cable
      4. Power Cable
      5. External Storage

   <br>

   >**NOTE: IF YOU ALREADY KNOW THE IP-ADDRESS OF YOUR PI, THEN YOU CAN SKIP TO STEP-6**

   3. Now let you Pi boot up. The RaspberryPi may reboot several times on it's first boot. Make sure to give it some time, until you see the terminal.
   
   4. Enter the `username` and `password` that you had set here. 

    <img src="https://res.cloudinary.com/dqaojrihh/image/upload/v1724347155/Screenshot_2024-08-22_224049_phy6wl.png">

   5. Once logged in, enter the following command
   
   <br> 

    ```bash
   ifconfig
   ```
   You should be able to see the IP address in format `192.xxx.xx.xx`

   6. Now open the terminal (`cmd`,`pwsh`,`powershell`, or any other terminal) of your laptop/PC and run the following command after replace `<USERNAME>` & `<IP-ADDRESS>` with the username & password of your Raspberry Pi.
   
   <br> 

    ```bash
    ssh <USERNAME>@<IP-ADDRESS>
    ```

    Enter the password.

    >**NOTE:** This command will only work if your laptop/pc and your Raspberry Pi is connected to the same network.

    7. Once you are into the terminal of your Pi, enter the following commands   
    
   <br> 

    ```bash
    sudo apt install nala -y
    sudo nala update && sudo nala upgrade -y
    ```

    8. Now, we install `OpenMediaVault` into the RaspberryPi
   
   <br>

    ```bash
    sudo wget -O - https://raw.githubusercontent.com/OpenMediaVault-Plugin-Developers/installScript/master/install | sudo bash
    ```

    >**NOTE:** 
    >- You may get disconnected from the SSH session when you enter the above command and the IP address of your Pi may also change. So be sure to check the new IP-address before proceeding.
    >
    >- If you are trying to go `WIRELESS` or trying to use `Wi-Fi`, the `OpenMediaVault` deletes the `Network-Manager` of your Pi once it is installed. So make sure that you install it back with the command 
    >```bash
    >sudo nala install network-manager && sudo nala update
    >```

3. **OpenMediaVault SETUP :**

    1. Open your preferred Web-Browser on your laptop/PC and enter the IP-address of your Pi in the search bar. This should open up the `Open Media Vault` login page. It should look something like this, or it may change with time.

   <br><img src="https://res.cloudinary.com/dqaojrihh/image/upload/v1724173765/Screenshot_2024-08-20_211157_fjzkoa.png">

   2.  Enter your `username` and `password`.<br> The default username is `admin` and the password should be `openmediavault`

    3.  Now, under `Storage` click on `Disks`. This should show you the storage devices that are connected to your Pi. Click on you storage and format the disk by clicking `Wipe` option. Be sure to transfer the important data from your drive.
   
   <br><img src="https://res.cloudinary.com/dqaojrihh/image/upload/v1724173764/Screenshot_2024-08-20_211242_jtux3f.png">

   4.  Open `File Systems` under `Storage`,and create a new storage, and be sure to `Mount` it.
   
   <br><img src="https://res.cloudinary.com/dqaojrihh/image/upload/v1724173764/Screenshot_2024-08-20_211341_lkhzyh.png">

   5.  Now go to `Shared Folders`, and create a new shared folder and naming it is upto you. I'll be refering the shared folder as `Nasty`.
   
   6.  Once that's done, select Nasty, and then head to `Priviledges` in the navbar of the page (NOT THE SIDEBAR). Give `Read & Write` permission to the user. Now click on `Apply` at the top right corner.
   
   7.  Now go to `Users` and create a new user. Be sure to change its password.

   <br><img src="https://res.cloudinary.com/dqaojrihh/image/upload/v1724173765/Screenshot_2024-08-20_211637_bsuumg.png">

   8.  Under `Services`, go to SMB (for Windows) and `Enable` it
   
   <br><img src="https://res.cloudinary.com/dqaojrihh/image/upload/v1724173764/Screenshot_2024-08-20_211401_gx6mp0.png">

   9.  Under `SMB`, go to `Shares` and add Nasty there.     
    
    <br><img src="https://res.cloudinary.com/dqaojrihh/image/upload/v1724173764/Screenshot_2024-08-20_211431_weq6bm.png">

    10.  Now go to `NFS` (for Linux/MacOS) and `Enable` it and repeat the same steps for the `Shares` option under `NFS`. Be sure to apply the changes.
   
   <br><img src="https://res.cloudinary.com/dqaojrihh/image/upload/v1724173764/Screenshot_2024-08-20_211610_deye7c.png">

4. **Explorer SETUP**
   1. Open your `Windows Explorer` and go to `This PC`/`My PC`. Right click under the `Network Locations` and select `Add a Network Location`. Now select ` Choose Custom Location`. Click on `NEXT`
   
   <br><img src="https://res.cloudinary.com/dqaojrihh/image/upload/v1724173765/Screenshot_2024-08-20_211859_uvrovu.png">

   <br><img src="https://res.cloudinary.com/dqaojrihh/image/upload/v1724173765/Screenshot_2024-08-20_211839_ojvkag.png">

   2. Enter the following command replacing `<RASPBERRYPI_IP_ADDRESS>` and `<SHARED_FOLDER_NAME>` with your Pi's details. Example is given below:
   
   ```bash
   \\192.168.1.1\Nasty
   ```
    Click on next
   
   <br><img src="https://res.cloudinary.com/dqaojrihh/image/upload/v1724173765/Screenshot_2024-08-20_212105_m72zmd.png">

   3. This should take you to a login screen. Enter the username and passowrd as set in `Step-7` in the last section of `OpenMediaVault Setup` and you should be good to go.
   
5. **Plex Media Server SETUP:**
   1. Login into your Raspberry Pi via `SSH` as shown above, and execute the following commands
    
    <br>

   ```bash
    sudo nala install apt-transport-https -y
   ```

   2. Now we add the `Plex Repository`
   
   <br>
   
   ```bash
    curl https://downloads.plex.tv/plex-keys/PlexSign.key | sudo apt-key add -

    echo deb https://downloads.plex.tv/repo/deb public main | sudo tee /etc/apt/sources.list.d/plexmediaserver.list

    sudo nala update
    ```

    3. Install `Plex`. You might get some questions that you can answer accordingly, or else keep it `No`.
    
    <br>

    ```bash
    sudo nala install plexmediaserver
    ```

    4. Open your Web Browser and search for `<IP_ADDRESS_OF_PI>:32400/web`. This should open the Plex web. You can create a free account and you can add your `Movies` folder from `Nasty`.

6. **Hotspot SETUP:**
   1. To enable use `Hotspot` with your Raspberry Pi, run the `setup_hotspot.sh` script, after making the script executable. Run the following commands in the Raspberry Pi terminal (or with the SSH)
   
   <br>

   ```bash
    cd './Portable Raspberry-Pi NAS/setup_hotspot.sh'
    chmod +x setup_hotspot.sh
    sudo ./setup_hotspot.sh
   ```

7. **Congratulations🎉**<br> You have completed the Raspberry-Pi NAS Setup. Now you can access the hard drive contents from any device that is on the same network. You can also access the Plex Media Server on your phone with the Plex app (it's free).
---

## 🔄 Future Enhancements
- Expand storage capacity with additional drives.
- Integrate with cloud services for remote access.
- Implement security features like password protection and encrypted storage.
- Making it a private server.

---

Enjoy with your Portable Raspberry-Pi NAS! 😄
