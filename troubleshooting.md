# Troubleshooting

These instructions are for the various problems people have run into

## My new package cannot be found by ROS

- Your first step should always be resourcing your `.bashrc` and your `~/catkin_ws/devel/setup.bash` (if that is not inside your `.bashrc` already

## When I start my node, it doesn't seem to publish on `\cmd_vel`

- When initiallizing a node, ROS will take a short amount of time to configure the node properly
- To fix this, try adding a small delay at the end of the `__init__` method
  - Something like `rospy.sleep(1)` will work well for this
