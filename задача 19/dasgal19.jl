using HorizonSideRobots

function exercise19!(robot)
    recursivemarker!(robot,Nord)
end

function recursivemarker!(robot,side)
    n=0
    move!(robot,side)
    if !isborder(robot,side)
        recursivemarker!(robot,side)
        n+=1
    else
        putmarker!(robot)
    end
    for _ in 1:n
        move!(robot,inverse(side))
    end
end

inverse(side::HorizonSide)=HorizonSide((Int(side)+2)%4)