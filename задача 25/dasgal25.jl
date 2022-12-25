using HorizonSideRobots

function distance!(robot, side)
    if !isborder(robot, side)
        move!(robot, side)
        halfdist!(robot, side)
        move!(robot, inverse(side))
    end
end

function halfdist!(robot, side)
    if !isborder(robot, side)
        move!(robot, side)
        distance!(robot, side)
    end
end

inverse(side::HorizonSide) = HorizonSide((Int(side) +2)% 4)