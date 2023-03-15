# RBE3002: TurtleBot Network Configuration Guide

1. Switch ON TurtleBot and wait for about 1-2 minutes for the boot process to complete
2. On your computer, use `ifconfig` to find **YOUR-IP-ADDRESS**. (Highlighted below)
   - On the WPI netowrk, your IP Address will start with 130.215
   - If you get the `ifconfig: command not found` error, run `sudo apt install net-tools` to install it

   ![ifconfig output](https://github.com/RBE300X-Lab/RBE3002_info/blob/main/images/ifconfig.jpg)   
 
   Then use `nslookup` with **YOUR-IP ADDRESS** to find **YOUR-HOSTNAME** (Highlighted below)
   
   ![nslookup output](https://github.com/RBE300X-Lab/RBE3002_info/blob/main/images/nslookup.jpg)   
   
3. Open your bashrc file by typing `nano ~/.bashrc` in your terminal (or the text editor of your choice). A sample `.bashrc` file is provided in this repo for you to use and modify ([**HERE**](https://github.com/RBE300X-Lab/RBE3002_info/blob/main/.bashrc)). You will then need to edit the lines below (should be at the bottom of the file) to make them work for your computer.

   ```
   export ROS_MASTER_URI=http://YOUR-HOSTNAME:11311
   export ROS_HOSTNAME=YOUR-HOSTNAME
   export TURTLEBOT3_MODEL=burger
   ```
   
   ![local .bashrc](https://github.com/RBE300X-Lab/RBE3002_info/blob/main/images/localbash.jpg)   
   
   After saving the file run `source ~/.bashrc` in your terminal to let your computer know you updated it.
   
   Alternatively, you can use the alias `sb` (defined as `alias sb="source ~/.bashrc"`) to run the command easier (this is recommended to add, you will be resourcing frequently).

4.  SSH into the robot using `ssh ubuntu@TURTLEBOT-NAME.dyn.wpi.edu` where **TURTLEBOT-NAME** is the name on the turtlebot (ignore the number). The password is “turtlebot”

   If your robot says **ROB-23** on the robot itself, you will use `ssh ubuntu@rob.dyn.wpi.edu`, the number is your team number.

5. Make sure these following lines are in the TurtleBot’s `.bashrc`. Check this file by running `nano ~/.bashrc` while you are in an ssh terminal connected to the TurtleBot,

   ```
   export ROS_MASTER_URI=http://YOUR-HOSTNAME:11311
   export ROS_HOSTNAME=TURTLEBOT-NAME.dyn.wpi.edu
   export TURTLEBOT3_MODEL=burger
   ```
   
   ![remote .bashrc](https://github.com/RBE300X-Lab/RBE3002_info/blob/main/images/remotebash.jpg)  

   Comment or delete any other lines that set the same variables.
   
   Make sure you save and source the file for the TurtleBot with `source ~/.bashrc` (`sb` should also work on the TurtleBots, let an SA know if not).
   
   To use `nano` press `CTRL + X` to exit (you will be asked if you want to exit with or without saving, press `y` to save). Further instructions on `nano` can be found at the bottom of the terminal window.
   
6. On your host machine, run: `roslaunch turtlebot3_bringup turtlebot3_model.launch`
   
   On the TurtleBot, run: `roslaunch turtlebot3_bringup turtlebot3_robot.launch`
   
   The result will be similar to the below image (you will be able to see the red `LaserScan` data):
   
   ![model in rviz](https://github.com/RBE300X-Lab/RBE3002_info/blob/main/images/model.jpg)  
   
   To drive around the TurtleBot (please be careful and do not run on the table), run: `roslaunch turtlebot3_teleop turtlebot3_teleop_key.launch` and drive around using WASDX
   
7. Once you are done with the TurtleBot, make sure you turn it off using `sudo shutdown now`, this can help prevent corrupting crucial files and software. The root password is `turtlebot`. It takes about 2-3 minutes for the TurtleBot to shutdown completely. Please  be patient and do not unplug the power adapter until the green light on the Raspberry Pi (the green board on the second layer) is off and the LIDAR stops spinning.
