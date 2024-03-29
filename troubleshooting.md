# Troubleshooting

These instructions are for the various problems people have run into. To report unresolved hardware/TurtleBot issues, please add repair notes to the [**TurtleBot Checklist document**](https://docs.google.com/spreadsheets/d/19vTIf3R6pr0AnlmXH2UkKc_VxAR0BwPOOzGj72RvUhc/edit?usp=sharing). 

## Connecting to the TurtleBot 
### I can't SSH into the robot 

 - Make sure you are using `ubuntu@[turtlebotname].dyn.wpi.edu` with the password `turtlebot`
 - Check the [**TurtleBot Checklist document**](https://docs.google.com/spreadsheets/d/19vTIf3R6pr0AnlmXH2UkKc_VxAR0BwPOOzGj72RvUhc/edit?usp=sharing) for any notes relating to your specific bot (some might ask you to use an IP address instead of the hostname to connect)

### I am getting an error when running `roslaunch turtlebot3_bringup turtlebot3_robot.launch` on the robot

 - Make sure your `.bashrc` file is correct, and make sure you have correctly added your hostname to the turtlebot `.bashrc`
 - Note that if you are using a different lab computer, this will be different. If you are at all unsure, rerun `ifconfig` and `nslookup` as shown in the [**TurtleBot Netowrk Configuration Guide**](https://github.com/RBE300X-Lab/RBE3002_info/blob/main/turtlebot_network_config.md). 

## General ROS
### My new package cannot be found by ROS

- Your first step should always be resourcing your `.bashrc` and your `~/catkin_ws/devel/setup.bash` (if that is not inside your `.bashrc` already)

### I can't run my new node

- Have you made the node executable yet? To do so, run `chmod +x <file name>.py`.
  - Without this, a node will not be able to run 
- You're getting a `Package not found` or `Node not found` error
  - Have you sourced your `.bashrc` and `~/catkin_ws/devel/setup.bash` (should be inside your `.bashrc`)?
  - Does the top level directory of your package contain `package.xml`, this is require for ROS to learn about your package

### When I start my node, it doesn't seem to publish on `\cmd_vel`

- When initiallizing a node, ROS will take a short amount of time to configure the node properly
- To fix this, try adding a small delay at the end of the `__init__` method
  - Something like `rospy.sleep(1)` will work well for this

## A* / Visualization  
### When I try to visualize my algorithm, RViz displays old information

 - Since RViz listens to topics, and those topics can be publishing information very quickly, it sometimes lags behind the most recent data. Add a small delay (0.01 second) to allow RVzi to listen to all topics.

### I get a `For Frame[]: Frame[] does not exist` error in RViz
 - The `GridCells` message requires some metadata inside the `header` field
   - Specifically, the reference frame for the CSpace (`"map"` in our case).
 - Add `msg.header.frame_id = "map"` to the `GridCells` before publishing


## Launch file in Lab4 not working
### maze_sim.launch file is not launching
 - There has been some changes in Noetic that were missed in the lab update. Please make the following changes to fix it. 
 - Open the launch file in your favourite text editor, and edit the Line #20
 - In the field `command`, replace `xacro.py` with `xacro` (delete the `.py` part of it)


## No such package/stack `Lab4`
 - The package `Lab4` was previously named as `rbe3002_final`. When we restructured the code for this lab, the package name changing was overlooked. You have two possible ways to fix this:
> Please use ONE of the two methods, NOT BOTH
 1. Change the directory name to `rbe3002_final` and launch/run the files in it by the same name. This means that you will act like Lab4 is not a thing
 2. Replace `rbe3002_final` with `Lab4` in these two files: (Doing this, you can continue refering to the package as `Lab4`)
		a. CMakeLists.txt
    b. package.xml

## Email Do Not Match `catkin_create_pkg`
 - If you are getting an error when running the `catkin_create_pkg` command add a special flag specifying your username
 - Run: `catkin_create_pkg -m [username] [package]`


## Robot Position Estimate Errors
- Sometimes GMapping's and the robot's position estimates do not correlate correctly with each other
- To fix this:
  - Add `import tf` to the top of the file 
  - Add `self.listener = tf.TransformListener()` to the init fucntion
  - Replace your `update_odometry` method with the following code:

```py
def update_odometry(self, msg):
	"""
	Updates the current pose of the robot.
	This method is a callback bound to a Subscriber.
	:param msg [Odometry] The current odometry information.
	"""

	trans = [0,0]
	rot = [0,0,0,0]
	try:
	    (trans,rot) = self.listener.lookupTransform('/map','/base_footprint',rospy.Time(0)) 
	except (tf.LookupException, tf.ConnectivityException, tf.ExtrapolationException):
	    print("HEY I DIDN'T WORK")
	self.px = trans[0]
	self.py = trans[1]

	quat_list = [rot[0], rot[1], rot[2], rot[3]]
	(roll, pitch, yaw) = euler_from_quaternion(quat_list)
	self.pth = yaw
```
