F = {}

-- https://fairino-doc-en.readthedocs.io/3.8.0/LuaProgram/lua_intro.html , pg 66 in pdf pg 60 document


-- copy tables by each key value pair 
local function copy_table(t)
    local out = {}
    for key,value in pair(t) do out[key]=v end
    return out
end

-- merge tables by each key value pair
local function merge(destination,source)
    if source then 
        for key,value in pairs(source) do destination[key]=value end
    end
    return destination
end

-- Converts cartesian coordinates to joints
function F.convertPoint(xyz,joint_seed)
    local j1_value,j2_value,j3_value,j4_value,j5_value,j6_value = GetInverseKin(0,xyz.x,xyz.y,xyz.z,xyz.rx,xyz.ry,xyz.rz,joint_seed)
    return {j1=j1_value,j2=j2_value,j3=j3_value,j4=j4_value,j5=j5_value,j6=j6_value}
end 

-- create a point for using with moveL
function F.createPoint(bottleStartxyz,bottleStartjoints,bottle_params)
    local p = {}
    merge(p,bottleStartjoints)
    merge(p,bottleStartxyz)
    merge(p,bottle_params)
    return p 
end

-- Configure the right format for moveL 
function moveL_point(p)
    return(p.j1, p.j2, p.j3, p.j4, p.j5, p.j6,
    p.x, p.y, p.z, p.rx, p.ry, p.rz,
    p.toolnum, p.workpiecenum,
    p.speed, p.acc, p.ovl,
    p.ep1, p.ep2, p.ep3, p.ep4,
    p.blendR,
    p.search,
    p.offset,
    p.offset_x, p.offset_y, p.offset_z,
    p.offset_rx, p.offset_ry, p.offset_rz)
end

-- This function starts at home position, activates gripper, and opens it to starting gripper position
function F.startup(home_initial,home_rotate45)
    Lin(home_initial,75,-1,0,0)
    Lin(home_rotate45,25,-1,0,0)
    ActGripper(1,1)
    MoveGripper(1,27,50,17,5000,0,0,0,0,0)
end

function F.bottle_approach_grab(bottle_approach,bottle_grab)
    moveL_point(bottle_approach) -- might have to unpack values: moveL(table.unpack(bottle_approach))
    moveL_point(bottle_grab)
    MoveGripper(1,4,25,17,5000,0,0,0,0,0) -- third element is speed, 2nd element is how closed
    moveL_point(bottle_approach)
end

function F.filler(filler_under_approach,filler_edge,filler_insert,filler_wait)
    Lin(filler_under_approach,75,-1,0,0)
    Lin(filler_edge,25,-1,0,0)
    Lin(filler_insert,25,-1,0,0)
    WaitMs(filler_wait)  -- wait for specified time in ms 
    Lin(filler_edge,50,-1,0,0)
    Lin(filler_under_approach,50,-1,0,0)
end

function F.bottle_return_release(bottle_approach,bottle_grab)
    moveL_point(bottle_approach)
    moveL_point(bottle_grab)
    MoveGripper(1,27,25,17,5000,0,0,0,0,0) --2nd element is how closed
    Lin(bottle_approach,50,-1,0,0)
end    

function F.shutdown(home_initial)
    Lin(home_initial,75,-1,0,0)
    MoveGripper(1,100,75,17,5000,0,0,0,0,0)
    ActGripper(1,0)
end

return F