using HorizonSideRobots
include("dasgal21.jl")
r=Robot("21.sit"; animate=true)
side=readline()
side=parse(Int64,side)
move_next!(r, HorizonSide(side))
