using HorizonSideRobots
include("dasgal25.jl")
robot = Robot("25.sit", animate = true)
side = readline()
side = parse(Int64, side)
distance!(robot, HorizonSide(side))