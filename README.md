# 3DMobileRobotNavigation
 by Wojciech Cieślak and Sebastian Rodykow

Gmapping simulation

roslaunch turtlebot_gazebo turtlebot_world.launch
roslaunch turtlebot_gazebo gmapping_demo.launch
roslaunch turtlebot_rviz_launchers view_navigation.launch

roslaunch turtlebot_teleop keyboard_teleop.launch

source /opt/ros/kinetic/setup.bash
roslaunch octomap_turtlebot.launch

rosrun map_saver map_saver -f map.yaml map:=projected_map

roslaunch turtlebot_rviz_launchers view_robot.launch

roslaunch openni_launch openni.launch

 source /opt/ros/kinetic/setup.bash
roslaunch turtlebot_gazebo amcl_demo.launch map_file:=/home/wojciech/turtlebot/test_map.yaml
roslaunch turtlebot_rviz_launchers view_navigation.launch



Clone package into workspace/src directory
roslaunch turtlebot_gazebo turtlebot_world.launch
roslaunch octomap_turtlebot.launch
roslaunch turtlebot_teleop keyboard_teleop.launch
roslaunch turtlebot_rviz_launchers view_robot.launch
rosrun map_saver map_saver -f map.yaml map:=projected_map

if last command does not works try to move map_saver file to devel/lib in catkin_workspace file

To load saved map into rviz run 
roslaunch turtlebot_gazebo amcl_demo.launch map_file:=path-to-file/map.yaml
