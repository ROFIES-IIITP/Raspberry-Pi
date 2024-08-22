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
    
   1. Go to **`SERVICES`** section and click **`Enable SSH`**. Now click on **`SAVE`**

        <img src="https://res.cloudinary.com/dqaojrihh/image/upload/v1724348494/Screenshot_2024-08-22_224058_wkuklm.png">

    2.  Now click on **`YES`**, and let the Raspberry Image be written on your Micro SD-Card

        <img src="https://res.cloudinary.com/dqaojrihh/image/upload/v1724347155/Screenshot_2024-08-22_224117-1_z94icl.png">
        <br><br>
    
2. **Raspberry-pi Setup**

## 🔄 Future Enhancements
- Expand storage capacity with additional drives.
- Integrate with cloud services for remote access.
- Implement security features like password protection and encrypted storage.

---

Enjoy your portable Raspberry-Pi NAS! 😄
