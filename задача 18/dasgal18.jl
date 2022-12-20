using HorizonSideRobots

function exercise18!(robot)
    spiral!(r->ismarker(robot), robot)
end

function spiral!(stop_condition::Function, robot)
    side=Nord
    n=0
    while !stop_condition(robot)
        for _ in 1:2
            along!(robot,side,n)
            side=right(side)
        end
        n+=1
    end
end

function try_move!(robot,side,stop_condition::Function)
    if !stop_condition(robot)
        
        if (isborder(robot, side))
            move_next!(robot, side)
        end
        move!(robot,side)
        return true
    else
        return false
    end
end

function along!(robot,side,max_num_steps)
    num_steps=0
    while num_steps<max_num_steps && try_move!(robot,side,_->ismarker(robot))
        num_steps+=1
        
    end
    return num_steps
end

function aroundlinetoo!(robot)
    numlilhori=0
    numlilvert=0
    while isborder(robot,Nord)||isborder(robot,Sud)
        move!(robot,Ost)
        numlilhori+=1
    end
    while isborder(robot,Ost)||isborder(robot,Nord)
        move!(robot,Sud)
        numlilvert+=1
    end
    return numlilvert,numlilhori
end

function aroundline!(robot,side,n)
    for _ in 1:n
        move!(robot,side)
    end
end

function move_next!(robot,side)
    if !isborder(robot,side)
        move!(robot,side)
    else
        move!(robot, right(side))
        move_next!(robot,side)
        move!(robot, left(side))
    end
end

right(side::HorizonSide)=HorizonSide((Int(side)+1)%4)
left(side::HorizonSide)=HorizonSide((Int(side)+3)%4)




# while isborder(robot,side)
#     numlilvert,numlilhori=aroundlinetoo!(robot)
#     if side==Sud
#         move!(robot,Sud)
#         side1=previous(side)
#         for _ in 1:numlilhori
#             move!(robot,side1)
#         end
#     elseif side==Nord
#         move!(robot,Nord)
#         side1=next(side)
#         for _ in 1:numlilhori
#             move!(robot,side1)
#         end
#     elseif side==West
#         move!(robot,West)
#         side1=previous(side)
#         for _ in 1:numlilvert
#             move!(robot,side1)
#         end
#     elseif side==Ost
#         move!(robot,Ost)
#         side1=next(side)
#         for _ in 1:numlilvert
#             move!(robot,side1)
#         end
#     end
# end