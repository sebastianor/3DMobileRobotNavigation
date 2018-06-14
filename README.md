# 3DMobileRobotNavigation

# Turtlebot gazebo simulation
- Firstly you have clone this repository to your source directory in your workspace and you should download and install [turtlebot] packages

```sh
$ sudo apt-get install ros-kinetic-turtlebot-gazebo 
$ sudo apt-get install ros-kinetic-turtlebot-navigation 
$ sudo apt-get install ros-kinetic-octomap-server
$ sudo apt-get install ros-kinetic-map-server


```
- later in your workspace you have:
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
> If you want to see created map please add in Rviz MarkerArray in topic occupied_cells_vis_array

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
* Install required packages
 ```sh
$ sudo apt-get install ros-kinetic-octomap-server
$ sudo apt-get install ros-kinetic-map-server


```
* Clone our launch file to labbot source directory 
 ```sh
$ roslaunch path-to-file/map_service_bodzi_seba.launch
```
* If you want to have preview of map
 ```sh
$ rviz rviz
```
> If you want to see created map please add in Rviz MarkerArray in topic occupied_cells_vis_array
* Let's create map by control robot by kinect controller
* Save map by command 
 ```sh
$ rosrun map_saver map_saver -f map.yaml map:=projected_map
```
> Sometimes this command may not works so you have to copy map_saver file to devel/lib directory in your workspace folder

* Load map to planner 
```sh
$ roslaunch path-to-file/move_base_bodzi.launch map_file:= path-to-map/map.yaml
```
> If map is not loading correcty check the map.yaml file. 1) Correct the path to pgm file 2) set z origin from NaN to 0.0000

   [labbot]: <https://github.com/PUTvision/ROS-labbot>
   [turtlebot]: <http://wiki.ros.org/Robots/TurtleBot>
  
