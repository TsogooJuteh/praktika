using HorizonSideRobots

function cross!(robot)
    nu=Left!(robot,West)
    nu1=Down!(robot,Sud)
    for side in (Ost,Nord,West,Sud)
        n=mark_perimeter!(robot,side)
        along!(robot,side,n)
    end
    UP!(robot,Nord,nu1)
    East!(robot,Ost,nu)
end 

function Left!(robot,West)
    numtoo=0
    while !isborder(robot,West)
        move!(robot,West)
        numtoo+=1
    end 
    return numtoo
end
function Down!(robot,Sud)
    numtoo1=0
    while !isborder(robot,Sud)
        move!(robot,Sud)
        numtoo1+=1
    end 
    return numtoo1
end 
function UP!(robot,Nord,numtoo1)
    for _i in 1:numtoo1
        move!(robot,Nord)
    end        
end    
function East!(robot,Ost,numtoo)
    for _i in 1:numtoo
        move!(robot,Ost)
    end
end

function mark_perimeter!(robot,side)
    num_steps=0
    putmarker!(robot)
    while !isborder(robot,side)
        move!(robot,side)
        num_steps+=1
        putmarker!(robot)
    end
    return num_steps=0
end

function along!(robot,side,num_steps)
    for _i in 1:num_steps
        move!(robot,side)
    end
end    

inverse(side::HorizonSide)::HorizonSide=HorizonSide((Int(side)+1)%4)