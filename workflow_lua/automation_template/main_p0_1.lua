!/usr/bin/env lua

-- Required files 
local F = require('functions') -- movement functions file
local P = require('points')    -- fixed points & repeated
local par = require('params')  -- parameters

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

F.shutdown(P.home_initial)
