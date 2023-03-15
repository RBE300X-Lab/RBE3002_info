# RBE 3002 Info Repository
Look below for guidance on the labs

The SAs have provided a sample .bashrc file, which can be found [**HERE**](https://github.com/RBE300X-Lab/RBE3002_info/blob/main/.bashrc)

# WE ARE USING ROS NOETIC AND UBUNTU 20.04
These are the only supported versions

## Having Trouble With ROS or Your TurtleBot

- See the [**Troubleshooting Guide**](https://github.com/RBE300X-Lab/RBE3002_info/blob/main/troubleshooting.md)
- To report unresolved hardware/TurtleBot issues, please add repair notes to the [**TurtleBot Checklist document**](https://docs.google.com/spreadsheets/d/19vTIf3R6pr0AnlmXH2UkKc_VxAR0BwPOOzGj72RvUhc/edit?usp=sharing). 

## TurtleBot Guidelines

[**TurtleBot Netowork Configuration Guide**](https://github.com/RBE300X-Lab/RBE3002_info/blob/main/turtlebot_network_config.md)

**DO NOT DO:**
- Keep the battery with the robot, instead return it to the charging station and plug it in
- Use the robot on a random table where it might fall

**PLEASE DO:**
- Use the cable instead of the battery as much as possible (the batteries have a limited number of recharges)
 - If you are using the robot with the cable, place the robot on the power supply so the wheels do not touch the ground (no robots falling on the floor)
- Always store the battery in the provided bag
- Use the robot only on the ground or in the arena we made available

## Installing ROS
- Please copy and paste terminal commands while running the ROS installation. You can do this `CTRL + SHIFT + C` to copy from the terminal and `CTRL + SHIFT + V` for pasting into the terminal

- If you have errors at `sudo apt install curl`, run `sudo apt-get install --fix-missing` and then try the first command again. Proceed from there. 

- You will need to add `source /opt/ros/noetic/setup.bash` to your .bashrc file. This file is run every time you open a new terminal, and will source ROS automatically for you. You can access this file by running `gedit ~/.bashrc` (or similar text editing options). Paste `source /opt/ros/noetic/setup.bash` into this file. 
 - Also add source `~/catkin_ws/devel/setup.bash` to your .bashrc as well, this can prevent issues when adding packages to your catkin workspace
 - There is a sample .bashrc in this repository, which can be found [**HERE**](https://github.com/RBE300X-Lab/RBE3002_info/blob/main/.bashrc)

- Note in the above command that you should be using ROS Noetic. Anytime you see kinetic or melodic in a command, you need to replace it with noetic.

## Faster Gazebo Quit
- Edit the roslaunch nodeprocess Python script using `sudo nano /opt/ros/noetic/lib/python3/dist-packages/roslaunch/nodeprocess.py`
  - Other editors are allowed, but this does require `sudo` access (editing files in protected directories), so it cannot be done on the lab computers
- Change the default timeout values:
  - `DEFAULT_TIMEOUT_SIGINT` on line 59 will make Gazebo quit faster, we suggest changing this value from the default 15 to 1
  - `DEFAULT_TIMEOUT_SIGTERM` on line 60 will make ROS quit faster if something hangs and will not close any other way, keeping the default 2 is fine
    - If something has hung (like a Python infinite loop), you can also force quit them from the terminal using `CTRL + \`

## Fixing View Frames
- With the switch to Python3, the tf scirpt `view_frames` is broken, to fix it, follow these instructions
- Edit the source code by running: `sudo nano /opt/ros/noetic/lib/tf/view_frames`
  - Other editors are allowed, but this does require `sudo` access (editing files in protected directories), so it cannot be done on the lab computers
- Replace line 89 (`m = (r.search(vstr))`) with `m = r.search(vstr.decode('utf-8'))`


## Preconfigured Ubuntu 20.04 VMs for RBE 3002 for ARM Macs
Username: `rbe` | Password: `RBE3002`

### Parallels Steps
1. Download the RBE3002.pvm.zip from the [**HERE**](https://drive.google.com/file/d/1tyTBqvedI3-AxBXs0ogOPc2BovvY22FM/view?usp=sharing)
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
 - If you get either a `Multicast MAC Addresses` or `Locally Administered Addresses (LAA)` errors, change the second character of the MAC Address (the **X**: 0**X**-B0-D0-63-C2-26) to an `8` and retry
 - This is because the 2 least significant bits of the first octet (the first two characters) are used as flags for device administration (the Universal vs Local and Unicast vs Multicast bits respectively) for WPI Netreg they must be set to 0

### UTM Steps
1. Download the RBE3002.utm.zip from the [**HERE**](https://drive.google.com/file/d/1CPwP1I6Bm2KLlnL_hFs11FlJVqSdyK50/view?usp=sharing)
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
 - If you get either an `Locally Administered Addresses (LAA)` or `Multicast MAC Addresses` errors, change the second character of the MAC Address (the **X**: 0**X**-B0-D0-63-C2-26) to an `8` and retry
 - This is because the 2 least significant bits of the first octet (the first two characters) are used as flags for device administration (the Universal vs Local and Unicast vs Multicast bits respectively) for WPI Netreg they must be set to 0
