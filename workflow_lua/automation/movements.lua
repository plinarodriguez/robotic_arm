F = {}

-- https://fairino-doc-en.readthedocs.io/3.8.0/LuaProgram/lua_intro.html , pg 66 in pdf pg 60 document

-- This is to test
-- function F.printPoint()
--     print('point(',x,',',y,')')
-- end


-- This function starts at home position, activates gripper, and opens it to starting gripper position
function F.startup(home_point,OPEN)
    Lin(home_initial,75,-1,0,0)
    Lin(single_bottle_rotate45,25,-1,0,0)
    ActGripper(1,1)
    MoveGripper(1,OPEN,75,17,5000,0,0,0,0,0)
end

function F.bottle_approach_grab(bottle_approach,bottle_grab,CLOSED)
    Lin(bottle_approach,50,-1,0,0)
    Lin(bottle_grab,50,-1,0,0)
    MoveGripper(1,CLOSED,75,17,5000,0,0,0,0,0)
    Lin(bottle_approach,50,-1,0,0)
end

function F.filler(filler_under_approach,filler_edge,filler_insert,filler_wait)
    Lin(filler_under_approach,75,-1,0,0)
    Lin(filler_edge,25,-1,0,0)
    Lin(filler_insert,25,-1,0,0)
    WaitMs(filler_wait)  -- wait for specified time in ms 
    Lin(filler_edge,50,-1,0,0)
    Lin(filler_under_approach,50,-1,0,0)
end

function F.bottle_return_release(bottle_approach,bottle_grab,OPEN)
    Lin(bottle_approach,50,-1,0,0)
    Lin(bottle_grab,50,-1,0,0)
    MoveGripper(1,OPEN,75,17,5000,0,0,0,0,0)
    Lin(bottle_approach,50,-1,0,0)
end    

function F.shutdown()
    Lin(home_initial,75,-1,0,0)
    MoveGripper(1,100,75,17,5000,0,0,0,0,0)
    ActGripper(1,0)
end

return F