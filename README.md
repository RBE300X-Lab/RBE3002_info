## Preconfigured Ubuntu 20.04 VMs for RBE 3002 for Arm Macs
Username: `rbe` | Password: `RBE3002`

### Parallels
[Link to VM Image]()

**Steps**
1. Clone this repo
2. Move the RBE3002.pvm.zip file to your Parallels VM Directory `(ex: /Users/<Your Username>/Parallels/)`
3. Unzip the file (this will take a few minutes)
4. Open Parallels Desktop
5. Drag the new .pvm file into Parallels
6. Open the VM settings (click the gear)
7. Navigate to `Hardware` -> `Network`
8. Change `Source` to `Wi-Fi`
9. Click `Advanced..` and then `Generate` a new MAC Address
10. Log into [netreg.wpi.edu](netreg.wpi.edu) and click `Register New Device`
11. Use the newly generate MAC Address to register your VM on the network

### UTM
[Link to VM Image]()

**Steps**
1. Clone this repo
2. Move the RBE3002.utm.zip file to your UTM VM Directory 

  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`(ex: /Users/<Your Username>/Library/Containers/com.utmapp.UTM/Data/Documents/)`
  
3. Unzip the file (this will take a few minutes)
4. Open UTM (there should be a new VM called RBE 3002)
5. Open the VM settings (click the sliders in the top right of the window)
6. Navigate to `Network`
7. Change `Network Mode` to `Bridged (Advanced)`
8. Generate a new MAC Address using `random` 
9. Log into [netreg.wpi.edu](netreg.wpi.edu) and click `Register New Device`
10. Use the newly generate MAC Address to register your VM on the network
