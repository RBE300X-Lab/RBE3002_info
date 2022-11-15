# Troubleshooting

These instructions are for the various problems people have run into. To report unresolved hardware/Turtlebot issues, please add repair notes to the [**Turtlebot Checklist document**](https://docs.google.com/spreadsheets/d/1kZ19K1iCRrBCk3pxAp74G3OKL1qjZJY5CHfOHSK4x84/edit#gid=0). 

## Connecting to the TurtleBot 
### I can't SSH into the robot 

 - Make sure you are using `ubuntu@[turtlebotname].dyn.wpi.edu` with the password `turtlebot`
 - Check the [**Turtlebot Checklist document**](https://docs.google.com/spreadsheets/d/1kZ19K1iCRrBCk3pxAp74G3OKL1qjZJY5CHfOHSK4x84/edit#gid=0) for any notes relating to your specific bot (some will ask you to use an IP address instead of the hostname to connect)

### I am getting an error when running `roslaunch turtlebot3_bringup turtlebot3_robot.launch` on the robot

 - Make sure your `.bashrc` file is correct, and make sure you have correctly added your hostname to the turtlebot `.bashrc`
 - Note that if you are using a different lab computer, this will be different. If you are at all unsure, rerun `ifconfig` and `nslookup` as shown in the [**Turtlebot Netowrk Configuration Guide**](https://github.com/RBE300X-Lab/RBE3002_info/blob/main/turtlebot_network_config.md). 

## General ROS
### My new package cannot be found by ROS

- Your first step should always be resourcing your `.bashrc` and your `~/catkin_ws/devel/setup.bash` (if that is not inside your `.bashrc` already)

### I can't run my new node

- Have you made the node executable yet? To do so, run `chmod +x <file name>.py`.
  - Without this, a node will not be able to run 

### When I start my node, it doesn't seem to publish on `\cmd_vel`

- When initiallizing a node, ROS will take a short amount of time to configure the node properly
- To fix this, try adding a small delay at the end of the `__init__` method
  - Something like `rospy.sleep(1)` will work well for this

## A* / Visualization  
### When I try to visualize my algorithm, RViz displays old information

 - Since RViz listens to topics, and those topics can be publishing information very quickly, it sometimes lags behind the most recent data. Add a small delay (0.01 second) to allow RVzi to listen to all topics. 
