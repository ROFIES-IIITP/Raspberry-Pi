# Setting Up Main & Backup Servers with Raspberry Pi 🍓

## Prerequisites
- Two Raspberry-Pi
- Raspbian OS (Only CLI will also work, i.e `Raspbian Lite`) installed on both Pis
- Basic knowledge of terminal commands

## Step 1: Install `nala`
`nala` is just a cover-up for apt. We will be using `nala` instead of `apt` for better readability.
```bash
sudo apt install nala -y
```

## Step 2: Update both Raspberry Pi 🔄
Open the terminal on both Raspberry Pis and update the package list:

```bash
sudo nala update && sudo nala upgrade -y
```

## Step 3: Install Apache2 🖥️
### 3.1 Install Apache on both Pi
```bash
sudo nala install apache2 -y
```
### 3.2 Start Apache2 Service on both Pi
```bash
sudo systemctl enable apache2
sudo systemctl start apache2
``` 
### 3.3 Verify Apache Installation 🌐
Open your web browser and visit http://<Raspberry-Pi-IP>. You should see the Apache2 default page.

## Step 4: Install keepalived 🔧
### 4.1 Install keepalived 
Install `keepalived` on both Raspberry Pis:
```bash
sudo nala install keepalived -y
```
### 4.2 Configure keepalived
Edit the `keepalived` configuration file on both Pi:
```bash
sudo nano /etc/keepalived/keepalived.conf
```
### 4.3 `keepalived.conf` Example
- For the **Main Server** (any one of the two Pi)
```bash
vrrp_instance VI_1 {
    state MASTER
    interface wlan0  # Change to your network interface (e.g., eth0 or wlan0)
    virtual_router_id 51
    priority 100
    advert_int 1
    authentication {
        auth_type PASS
        auth_pass secret  # Change this to a secure password
    }
    virtual_ipaddress {
        192.168.43.100  # Replace with your desired virtual IP
    }
}
```
> [!NOTE]
> If you are using mobile hotspot as your local network, make sure that your `virtual_ipaddress` is withing the hotspot's IP Address's range.

- For the **Backup Server** (the other Pi)
```bash
vrrp_instance VI_1 {
    state BACKUP
    interface wlan0  # Change to your network interface (e.g., eth0 or wlan0)
    virtual_router_id 51
    priority 90
    advert_int 1
    authentication {
        auth_type PASS
        auth_pass secret  # Use the same password as the MASTER
    }
    virtual_ipaddress {
        192.168.43.100  # Use the same virtual IP as the MASTER
    }
}
```
## Step 5: Start keepalived 🚀
Enable and start the `keepalived` service on both Pi:
```bash
sudo systemctl enable keepalived
sudo systemctl start keepalived
```
### Verify Status
This will show if the service is `activated` or `deactivated`
```bash
sudo systemctl status keepalived
```

## Step 6: Test Failover 🔄
1. **Access the Virtual IP:** Open a browser and go to http://192.168.43.100 (according to this eg.).
2. **Stop keepalived on the Master:**
    ```bash
   sudo systemctl stop keepalived
    ```
3. **Check Failover:** Refresh the browser; the backup server should take over.

## Conclusion 🎉
You now have a main and backup server setup with two Raspberry Pis using Apache2 and keepalived! Enjoy your high availability web server! 🌟