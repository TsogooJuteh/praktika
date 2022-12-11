using HorizonSideRobots
include("dasgal24.jl")
robot = Robot("testdasgal24.sit", animate = true)
side = readline()
side = parse(Int64, side)
distance!(robot, HorizonSide(side))