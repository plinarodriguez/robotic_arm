--------------------------------------------------
--------------------- Points --------------------- 
--------------------------------------------------
local P = {
  -- Home & staging
  home_initial = {
    x=99.999, y=-195.001, z=370.661,
    rx=169.561, ry=89.557, rz=76.324,
    j1=92.223, j2=-134.075, j3=131.596, j4=2.917, j5=95.460, j6=-89.878,
    e1=0.000, e2=0.000, e3=0.000, e4=0.000,
    speed=100, acc=100, elbow_speed=100, elbow_acc=100,
    toolnum=0, workpiecenum=0,
  },

  -- Rotate arm 45 degrees to match the finger angle
  home_rotate45 = {
    x=96.327, y=-100.229, z=330.786,
    rx=-174.688, ry=47.490, rz=92.030,
    j1=92.215, j2=-134.072, j3=131.594, j4=45.000, j5=95.448, j6=-89.875,
    e1=0.000, e2=0.000, e3=0.000, e4=0.000,
    speed=100, acc=100, elbow_speed=100, elbow_acc=100,
    toolnum=0, workpiecenum=0,
  },

  -- Filler locations: Under the filler at a safe distance
  filler_under_approach = {
    x=14.997, y=-497.007, z=289.996,
    rx=173.348, ry=43.631, rz=84.588,
    j1=77.532, j2=-74.047, j3=92.970, j4=28.268, j5=78.513, j6=-95.205,
    e1=0.000, e2=0.000, e3=0.000, e4=0.000,
    speed=100, acc=100, elbow_speed=100, elbow_acc=100,
    toolnum=0, workpiecenum=0,
  },

  -- Filler locations: The edge of the filler nozzle
  filler_edge = {
    x=14.997, y=-497.000, z=313.998,
    rx=173.347, ry=43.634, rz=84.586,
    j1=77.532, j2=-75.010, j3=90.577, j4=31.621, j5=78.513, j6=-95.204,
    e1=0.000, e2=0.000, e3=0.000, e4=0.000,
    speed=100, acc=100, elbow_speed=100, elbow_acc=100,
    toolnum=0, workpiecenum=0,
  },

  -- Filler locations: The top of the filler nozzle
  filler_insert = {
    x=14.997, y=-497.007, z=339.004,
    rx=173.345, ry=43.638, rz=84.586,
    j1=77.532, j2=-75.817, j3=87.873, j4=35.128, j5=78.510, j6=-95.204,
    e1=0.000, e2=0.000, e3=0.000, e4=0.000,
    speed=100, acc=100, elbow_speed=100, elbow_acc=100,
    toolnum=0, workpiecenum=0,
  },
}

--------------------------------------------------
------------------- Parameters  ------------------ 
--------------------------------------------------
-- Inline params (was params.lua)
local par = {

  -- Set the starting position (mm / deg)
  bottleStartxyz = {
    x = 101.498,
    y = -288.711,
    z = 135.0,
    rx = -179.124,
    ry = 78.208,
    rz = 90.446,
  },

  -- Default motion parameters for bottle moves
  bottle_params = {
    tool = 0,
    user = 0,
    vel = 20.0,   -- SDKs usually call this "vel"; change to speed if your wrapper needs it
    acc = 20.0,
    ovl = 1.0,
    ep1 = 0, ep2 = 0, ep3 = 0, ep4 = 0,
    blendR = -1.0,   -- -1: no blending (safer)
    search = 0,
    offset = 0,
    offset_x = 0, offset_y = 0, offset_z = 0,
    offset_rx = 0, offset_ry = 0, offset_rz = 0,
  },

  -- Z levels for the same XY
  bottle_approach_z = 135.0,
  bottle_grab_z = 67.883,

  -- Spacing between bottles (mm)
  spacing = {
    d_x = 0.5,       -- between bottles
    d_x_last = 0.5,  -- end of row correction
    d_y_last = 0.5,  -- end of row correction (y)
  },

  -- Wait time (ms) at filler
  filler_wait_ms = 3000,

  -- Tray layout
  cols = 6,
  rows = 1,

  -- Inverse-kinematics seed / config
  joint_seed = -1,
}

--------------------------------------------------
------------------ Functions --------------------- 
--------------------------------------------------
-- functions.lua (inline or required)
local F = {}

-- shallow copy
local function copy_table(t)
  local out = {}
  if t then
    for key, value in pairs(t) do out[key] = value end
  end
  return out
end

-- shallow merge: source -> destination
local function merge(destination, source)
  if source then
    for key, value in pairs(source) do destination[key] = value end
  end
  return destination
end

-- Converts cartesian coordinates to joints (uses controller IK)
function F.convertPoint(xyz,joint_seed)
    local j1_value,j2_value,j3_value,j4_value,j5_value,j6_value = GetInverseKin(0,xyz.x,xyz.y,xyz.z,xyz.rx,xyz.ry,xyz.rz,joint_seed)
    return {j1=j1_value,j2=j2_value,j3=j3_value,j4=j4_value,j5=j5_value,j6=j6_value}
end 

-- Create a unified point table (joints + cartesian + motion params)
function F.createPoint(xyz, joints, params)
  local p = {}
  merge(p, joints)         -- j1..j6
  merge(p, xyz)            -- x,y,z,rx,ry,rz
  merge(p, params)         -- tool/user/speed/acc/...
  return p
end

-- Build MoveL varargs from a unified point table
-- Note: supports either p.speed or p.vel (falls back to vel if speed missing)
function F.moveL_point(p)
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

-- Convenience: MoveL with a unified point
function F.MoveL_from_point(p)
  return MoveL(F.moveL_point(p))
end

-- ── High-level routines ─────────────────────────────────────────────

-- Start at home, rotate, power gripper, open to start gap
function F.startup(home_initial, home_rotate45)
  -- If your WebApp’s Lin expects a pose table, these are OK:
  Lin(home_initial, 75, -1, 0, 0)
  Lin(home_rotate45, 25, -1, 0, 0)
  ActGripper(1, 1)
  MoveGripper(1, 27, 50, 17, 5000, 0, 0, 0, 0, 0)
end

-- Approach bottle, grab, lift
function F.bottle_approach_grab(bottle_approach, bottle_grab)
    F.MoveL_from_point(bottle_approach)
    F.MoveL_from_point(bottle_grab)
    MoveGripper(1, 4, 25, 17, 5000, 0, 0, 0, 0, 0)
    F.MoveL_from_point(bottle_approach)
end

function F.filler(filler_under_approach, filler_edge, filler_insert, filler_wait_ms)
  Lin(filler_under_approach, 75, -1, 0, 0)
  Lin(filler_edge, 25, -1, 0, 0)
  Lin(filler_insert, 25, -1, 0, 0)
  WaitMs(filler_wait_ms)           -- ms
  Lin(filler_edge, 50, -1, 0, 0)
  Lin(filler_under_approach, 50, -1, 0, 0)
end

function F.bottle_return_release(bottle_approach, bottle_grab)
  F.MoveL_from_point(bottle_approach)
  F.MoveL_from_point(bottle_grab)
  MoveGripper(1, 27, 25, 17, 5000, 0, 0, 0, 0, 0) -- open
  F.MoveL_from_point(bottle_approach)
end

function F.shutdown(home_initial)
  Lin(home_initial, 75, -1, 0, 0)
  MoveGripper(1, 100, 75, 17, 5000, 0, 0, 0, 0, 0)
  ActGripper(1, 0)
end

return F

---

-- Required files doesn't work because directory where main is doesn't have other files so instead we are adding all of this info to this very long file!!!
-- local F = require('functions') -- movement functions file
-- local P = require('points')    -- fixed points & repeated
-- local par = require('params')  -- parameters

----------------------------------------------------------------
-- Check that the functions are being read in correctly. 
-- Instead testing functionality since other functions will not be used
print(P.home_initial)
print(P.home_initial.x)
print(par.bottleStartxyz)
print(par.bottleStartxyz.z)
print(F.convertPoint(par.bottleStartxyz,par.joint_seed))