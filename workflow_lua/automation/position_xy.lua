#!/usr/bin/env lua

-- Required files 
local F = require('movements') -- movement functions file
local P = require('points')   -- points
local Params = require('params')

-- order = 1 -- for test this will help print results
print(Params.OPEN) -- Test params.lua
-- Test points.lya file
P.home()
print(name)
-- indices for bottle position count
r,c = 1,1 -- start at row 1 
x,y = Params.x,Params.y
--  Repeat for rows 1 through 8
while r <= Params.rows do 
    --[[This is where the tasks will go to be performed with the current x,y position]]
    --print('point(',x,',',y,')')
    F.printPoint()


    -- io.write(string.format("(%d,%d) -> step %d\n", r, c, order))  -- for test this will help print results
    -- order = order + 1  -- for test this will help print results  
    if r%2 == 1 then -- if we are in an odd row then we move to the right and increment x 
        if c < Params.cols then 
            x = x + Params.d_x
            c = c + 1 -- increment to the next column in the same row
        else
            x = x + Params.d_x_last
            y = y + Params.d_y_last
            r = r + 1
            c = Params.cols
        end
    elseif r%2 == 0 then -- if we are in an even row then we move to the left and decrease x 
        if c > 1 then 
            x = x - Params.d_x
            c = c - 1 -- decrease to the next column in the same row
        else
            x = x - Params.d_x_last
            y = y + Params.d_y_last
            r = r + 1 
            c = 1
        end
    end 
end

