using HorizonSideRobots

function cornermark!(robot)
    num_Ost1, num_Nord1=tocorner!(robot)
    num_West1, num_Sud1=tofirstplace!(robot)
    draw_around!(robot)
    for _i in 1:num_Sud1
        move!(robot, Sud)
    end
    for _j in 1:num_West1
        move!(robot, West)
    end
    along!(robot,Nord,num_Ost1)
    along!(robot,Ost,num_Nord1)
end

function tocorner!(robot)
    num_West = 0
    num_Sud = 0
    while !isborder(robot, West) || !isborder(robot, Sud)
        if isborder(robot, Sud)
            move!(robot, West)
            num_West += 1
        else
            move!(robot, Sud)
            num_Sud += 1
        end
    end
    return num_Sud, num_West
end

function tofirstplace!(robot)
    side=Ost
    num_Nord=0
    num_horimove=0
    while !isborder(robot, side)
        move!(robot, side)
        num_horimove += 1
        if isborder(robot, side) && !isborder(robot, Nord)
            move!(robot, Nord)
            num_Nord += 1
            side = inverse(side)
        end
        if isborder(robot, Nord)
            break
        end
    end
    return num_horimove - (num_Nord) * 12 + num_Nord, num_Nord
end

function draw_around!(robot)
    side = Ost
    while !isborder(robot, side) && isborder(robot, next(side))
        move!(robot, side)
        putmarker!(robot)
        if !isborder(robot, side) && !isborder(robot, next(side))
            side = next(side)
            move!(robot, side)
            if side == Ost
                break
            end
        end
    end
end

function along!(robot,side,num_steps)
    for _ in 1:num_steps
        move!(robot,side)
    end
end

inverse(side::HorizonSide)::HorizonSide=HorizonSide((Int(side)+2)%4)
next(side::HorizonSide)::HorizonSide=HorizonSide((Int(side)+1)%4)