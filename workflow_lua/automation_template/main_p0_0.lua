!/usr/bin/env lua

-- Required files 
local F = require('functions') -- movement functions file
local P = require('points')    -- fixed points & repeated
local par = require('params')  -- parameters

-- Check that the functions are being read in correctly
print(P.home_initial)
print(par.bottleStartxyz)
print(F.convertPoint(par.bottleStartxyz,par.joint_seed))