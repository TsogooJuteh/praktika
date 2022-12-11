using HorizonSideRobots
include("dasgal6b.jl")
r=Robot("6.sit"; animate=true)
do_ur_job!(r)