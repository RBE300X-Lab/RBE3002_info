#!/usr/bin/env python

from path_planner import PathPlanner
from geometry_msgs.msg import Point, Pose, PoseStamped
from nav_msgs.msg import GridCells, OccupancyGrid, Path, MapMetaData

pp = PathPlanner()

mapdata = OccupancyGrid()
mapdata.info = MapMetaData()
mapdata.info.width = 2
mapdata.info.height = 2
mapdata.info.origin = Pose()
mapdata.data = [
    0, 100,
    0, 0
]

#this works so far
start = (0,0)
goal = (0,0)
print("BASE CASE 0")
print(pp.new_a_star(mapdata, start, goal))

start = (0,0)
goal = (0,1)
print("BASE CASE 1")
path1 = pp.new_a_star(mapdata, start, goal)
print(path1)
print(pp.optimize_path(path1))

mapdata.info.width = 5
mapdata.info.height = 5
mapdata.data = [
    0, 100, 0, 0, 100,
    0, 0, 0, 0, 100,
    0, 0, 0, 0, 100,
    0, 100, 0, 0, 100,
    0, 100, 0, 0, 100
]
start = (0,0)
goal = (2,1)
print("BASE CASE 2")
path2 = pp.new_a_star(mapdata, start, goal)
print(path2)
print(pp.optimize_path(path2))

start = (0,0)
goal = (3,4)
print("BASE CASE 3")
path3 = pp.new_a_star(mapdata, start, goal)
print(path3)
print(pp.optimize_path(path3))


mapdata.info.width = 10
mapdata.info.height = 10
mapdata.data = [
    0, 100, 0, 0, 100, 0, 0, 0, 0, 100,
    0, 0, 0, 0, 100, 0, 0, 0, 0, 100,
    0, 0, 0, 0, 100, 0, 0, 0, 0, 100,
    0, 100, 0, 0, 100, 0, 0, 0, 0, 100,
    0, 100, 0, 0, 100, 0, 0, 0, 0, 100,
    0, 100, 0, 0, 0, 0, 0, 0, 0, 100,
    0, 0, 0, 0, 100, 0, 0, 0, 0, 100,
    0, 0, 0, 0, 100, 0, 0, 0, 0, 100,
    0, 100, 0, 0, 100, 0, 0, 0, 0, 100,
    0, 100, 0, 0, 100, 0, 0, 0, 0, 100
]

start = (0,0)
goal = (8,9)
print("BASE CASE 4")
path4 = pp.new_a_star(mapdata, start, goal)
print(path4)
print(pp.optimize_path(path4))
