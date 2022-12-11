using HorizonSideRobots

function markbttmtotop!(robot)
    nu1=tocorner!(robot,Ost)
    nu2=tocorner!(robot,Sud)
    side=Ost
    n=11
    for _i in 1:10
        n=n-1
        hodlohzvvn!(robot,West)
        hodloh!(robot,Ost,n)
        move!(robot,Nord)
    end
    hodlohzvvn!(robot,West)
    for side in (Sud,Ost)
        tocorner!(robot,side)
    end
    hodloh!(robot,Nord,nu2)
    hodloh!(robot,West,nu1)
end

function tocorner!(robot,side)
    num_steps=0
    while !isborder(robot,side)
        num_steps+=1
        move!(robot,side)
    end
    return num_steps
end

function hodlohzvvn!(robot,side)
    while !isborder(robot,side)
        putmarker!(robot)
        move!(robot,side)
    end
    putmarker!(robot)
end

function hodloh!(robot,side,num_steps)
    for _i in 1:num_steps
        move!(robot,side)
    end
end

inverse(side::HorizonSide)::HorizonSide=HorizonSide((Int(side)+2)%4)