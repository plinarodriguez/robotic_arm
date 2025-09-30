#!/usr/bin/env lua

-- Required files 
local F = require('functions') -- movement functions file
local P = require('points')    -- fixed points & repeated
local par = require('params')  -- parameters

-- order = 1 -- for test this will help print results in while loops

-------- Testing 
par.bottleStartxyz()
print(z)
print(bottleStartxyz)

------- Startup Commands
F.startup(P.home_initial,P.home_rotate45)

--- Starting position for bottle position
local bottle = {
  x  = par.bottleStartxyz.x,
  y  = par.bottleStartxyz.y,
  rx = par.bottleStartxyz.rx,
  ry = par.bottleStartxyz.ry,
  rz = par.bottleStartxyz.rz,
}
-- indices for bottle position count
r,c = 1,1 -- start at row 1 
--  Repeat for rows 1 through 8
while r <= Params.rows do 
    -- Generate x,y,z,rx,ry,rz points
    local xyz_a = {
    x=bottle.x, y=bottle.y, z=par.bottle_approach_z,
    rx=bottle.rx, ry=bottle.ry, rz=bottle.rz
    } -- approach bottle
    local xyz_g = {
    x=bottle.x, y=bottle.y, z=par.bottle_grab_z,
    rx=bottle.rx, ry=bottle.ry, rz=bottle.rz
    } -- grab bottle
    
    -- Generate joints from x,y,z points
    local joints_a = F.convertPoint(xyz_a,par.joint_seed)
    local joints_g = F.convertPoint(xyz_g,par.joint_seed)

    -- Create points for MoveL function
    local bottle_approach = F.createPoint(xyz_a,joints_a,par.bottle_params)
    local bottle_grab     = F.createPoint(xyz_g,joints_g,par.bottle_params)

    ------------------ Execute: approach & grab → filler protocol → return & release
    -- Approach & Grab Bottle
    F.bottle_approach_grab(bottle_approach,bottle_grab)
    -- Filler Machine Protocol
    F.filler(P.filler_under_approach,P.filler_edge,P.filler_insert,par.filler_wait)
    -- Approach & Return Bottle
    F.bottle_return_release(bottle_approach,bottle_grab)

    -- io.write(string.format("(%d,%d) -> step %d\n", r, c, order))  -- for test this will help print results
    -- order = order + 1  -- for test this will help print results  
    if r%2 == 1 then -- if we are in an odd row then we move to the right and increment x 
        if c < par.cols then 
            bottle.x = bottle.x + par.d_x
            c = c + 1 -- increment to the next column in the same row
        else
            bottle.x = bottle.x + par.d_x_last
            bottle.y = bottle.y + par.d_y_last
            r = r + 1
            c = par.cols
        end
    elseif r%2 == 0 then -- if we are in an even row then we move to the left and decrease x 
        if c > 1 then 
            bottle.x = bottle.x - par.d_x
            c = c - 1 -- decrease to the next column in the same row
        else
            bottle.x = bottle.x - par.d_x_last
            bottle.y = bottle.y + par.d_y_last
            r = r + 1 
            c = 1
        end
    end 
end

F.shutdown(P.home_initial)
