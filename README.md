# 3DMobileRobotNavigation

# Turtlebot gazebo simulation
- Firstly you have clone this repository to your source directory in your workspace and build it or you can download and install [turtlebot] packages, later you have:
- To start Gazebo simulation
 ```sh
$ roslaunch turtlebot_gazebo turtlebot_world.launch
```
  - Start octomap server
  ```sh
$ roslaunch octomap_turtlebot.launch
```
> In this file you can set min and max value of z axis
  - Start control robot
  ```sh
$ roslaunch turtlebot_teleop keyboard_teleop.launch
```
  - To get preview in Rviz run 
  ```sh
$ roslaunch turtlebot_rviz_launchers view_robot.launch
```
> If you want to see created map please add in Rviz MarkerArray in topic occupied_cells

  - Save projected version of map
  ```sh
$ rosrun map_saver map_saver -f map.yaml map:=projected_map
```
> Sometimes this command may not works so you have to copy map_saver file to devel/lib directory in your workspace folder

- To run planner with projected map you have to run 
 ```sh
$ roslaunch turtlebot_gazebo amcl_demo.launch map_file:=path-to-file/map.yaml
```

> If map is not loading correcty check the map.yaml file. 1) Correct the path to pgm file 2) set z origin from NaN to 0.0000

# Run on real robot 

* [labbot] - Clone this repository!
* Install octomap_server by command 
 ```sh
$ sudo apt-get install ros-kinetic-octomap 
```
* Clone our launch file to labbot source directory 
 ```sh
$ roslaunch path-to-file/file.launch
```
* Let's create map by control robot by kinect controller
* Save map by command 
 ```sh
$ rosrun map_saver map_saver -f map.yaml map:=projected_map
```

* Load map to planner 
```sh
$ 
```

   [labbot]: <https://github.com/PUTvision/ROS-labbot>
   [turtlebot]: <http://wiki.ros.org/Robots/TurtleBot>
  
