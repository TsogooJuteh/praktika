using HorizonSideRobots
include("dasgal23.jl")
robot = Robot("23.sit", animate = true)
side = readline()
side = parse(Int64, side)
move_symmetrical!(robot, HorizonSide(side))