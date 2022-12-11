using HorizonSideRobots
include("dasgal21.jl")
robot = Robot("testdasgal21.sit", animate = true)
side = readline()
side = parse(Int64, side)
double_dist!(robot, HorizonSide(side), 1)