using HorizonSideRobots

function mark_all!(robot)
    n1=tocorner!(robot,West)
    n2=tocorner!(robot,Sud)
    side=Ost
    putmarker!(robot)
    while !isborder(robot,side)
        move!(robot,side)
        putmarker!(robot)
        if isborder(robot,side) && !isborder(robot,Nord)
            move!(robot,Nord)
            putmarker!(robot)
            side=inverse(side)
        end
    end 
    for side in (West,Sud)
        tocorner!(robot,side)
    end
    bairluugaa!(robot,Nord,n2)
    bairluugaa!(robot,Ost,n1)
end 

function tocorner!(robot,side)
    num_steps=0
    while !isborder(robot,side)
        move!(robot,side)
        num_steps+=1
    end    
    return num_steps
end
function bairluugaa!(robot,side,num_steps)
    for _i in 1:num_steps
        move!(robot,side)
    end
end    

inverse(side::HorizonSide)::HorizonSide=HorizonSide((Int(side)+2)%4)