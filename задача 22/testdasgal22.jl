using HorizonSideRobots
include("dasgal22.jl")
robot = Robot("testdasgal22.sit", animate = true)
side = readline()
side = parse(Int64, side)
move_symmetrical!(robot, HorizonSide(side))