--------------------------------------------------
--------------------- Points --------------------- 
--------------------------------------------------
local P = {

  -- NOTE: speed/acc here are ignored by Lin(); Lin speed comes from par.lin_speed
  -- Home & startup 
  home_initial = {
    x=99.999, y=-195.001, z=370.661,
    rx=169.561, ry=89.557, rz=76.324,
    j1=92.223, j2=-134.075, j3=131.596, j4=2.917, j5=95.460, j6=-89.878,
    e1=0.000, e2=0.000, e3=0.000, e4=0.000,
    speed=100, acc=100, elbow_speed=100, elbow_acc=100,
    toolnum=0, workpiecenum=0,
  },
  -- NOTE: speed/acc here are ignored by Lin(); Lin speed comes from par.lin_speed
  -- Rotate arm 45 degrees to match the finger angle
  home_rotate45 = {
    x=96.327, y=-100.229, z=330.786,
    rx=-174.688, ry=47.490, rz=92.030,
    j1=92.215, j2=-134.072, j3=131.594, j4=45.000, j5=95.448, j6=-89.875,
    e1=0.000, e2=0.000, e3=0.000, e4=0.000,
    speed=100, acc=100, elbow_speed=100, elbow_acc=100,
    toolnum=0, workpiecenum=0,
  },
  -- ################ These are for rows 1-15
  -- NOTE: speed/acc here are ignored by Lin(); Lin speed comes from par.lin_speed
  -- Filler locations: Under the filler at a safe distance
  filler_under_approach = {
    x=14.997, y=-497.007, z=289.996,
    rx=173.348, ry=43.631, rz=84.588,
    j1=77.532, j2=-74.047, j3=92.970, j4=28.268, j5=78.513, j6=-95.205,
    e1=0.000, e2=0.000, e3=0.000, e4=0.000,
    speed=100, acc=100, elbow_speed=100, elbow_acc=100,
    toolnum=0, workpiecenum=0,
  },
  -- NOTE: speed/acc here are ignored by Lin(); Lin speed comes from par.lin_speed
  -- Filler locations: The edge of the filler nozzle
  filler_edge = {
    x=14.997, y=-497.000, z=313.998,
    rx=173.347, ry=43.634, rz=84.586,
    j1=77.532, j2=-75.010, j3=90.577, j4=31.621, j5=78.513, j6=-95.204,
    e1=0.000, e2=0.000, e3=0.000, e4=0.000,
    speed=100, acc=100, elbow_speed=100, elbow_acc=100,
    toolnum=0, workpiecenum=0,
  },
  -- NOTE: speed/acc here are ignored by Lin(); Lin speed comes from par.lin_speed
  -- Filler locations: The top of the filler nozzle
  filler_insert = {
    x=14.997, y=-497.007, z=339.004,
    rx=173.345, ry=43.638, rz=84.586,
    j1=77.532, j2=-75.817, j3=87.873, j4=35.128, j5=78.510, j6=-95.204,
    e1=0.000, e2=0.000, e3=0.000, e4=0.000,
    speed=100, acc=100, elbow_speed=100, elbow_acc=100,
    toolnum=0, workpiecenum=0,
  },
  -- ################ These are for rows 16 (and possibly row 15)
  -- NOTE: speed/acc here are ignored by Lin(); Lin speed comes from par.lin_speed
  -- Filler locations: Under the filler at a safe distance
  filler_under_approach_row16 = {
    x=39.0, y=-513.0, z=205.0,
    rx=173.867, ry=44.703, rz=114.687,
    j1=67.435, j2=-62.492, j3=92.444, j4=30.766, j5=54.116, j6=-130.104,    					
    e1=0.000, e2=0.000, e3=0.000, e4=0.000,
    speed=100, acc=100, elbow_speed=100, elbow_acc=100,
    toolnum=0, workpiecenum=0,
  },
  -- NOTE: speed/acc here are ignored by Lin(); Lin speed comes from par.lin_speed
  -- Filler locations: The edge of the filler nozzle
  filler_edge_row16 = {
    x=39.0, y=-513.0, z=310.0,
    rx=173.867, ry=44.703, rz=114.687,
    j1=67.376	,j2=-67.830	,j3=84.587	,j4=43.995	,j5=54.086	,j6=-130.165,
    e1=0.000, e2=0.000, e3=0.000, e4=0.000,
    speed=100, acc=100, elbow_speed=100, elbow_acc=100,
    toolnum=0, workpiecenum=0,
  },
  -- NOTE: speed/acc here are ignored by Lin(); Lin speed comes from par.lin_speed
  -- Filler locations: The top of the filler nozzle
  filler_insert_row16 = {
    x=39.0, y=-513.0, z=330.5,
    rx=173.867, ry=44.703, rz=114.687,
    j1=67.376	,j2=-68.568	,j3=82.547	,j4=46.774	,j5=54.087	,j6=-130.166,
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

  -- Default motion parameters for bottle moves
  bottle_params = {
        toolnum = 0,
        workpiecenum = 0,
        speed = 15, -- 15-25(Slow), 30-50 (MED), 75.0 (fast might be too fast??)   -- percent
        acc   = 15, -- 15-25(Slow), 30-50 (MED), 75.0 (fast might be too fast??)
        ovl   = 30, -- 30(Slow), 50.0 (MED), 80.0 (fast might be too fast??)
        ep1 = 0, ep2 = 0, ep3 = 0, ep4 = 0,
        blendR = -1,    -- no blending
        search = 0,
        offset = 0,
        offset_x = 0, offset_y = 0, offset_z = 0,
        offset_rx = 0, offset_ry = 0, offset_rz = 0,
      },

  lin_speed = 10, -- slow=10-15, med=20-30, fast=40-60 

  -- -- Z levels for the same XY for rows 1-15 , maybe start with 220 approach for now --- not being used but double check before delete 
  -- bottle_approach_z = 205.0,
  -- bottle_btw_z = 160.0,
  -- bottle_grab_z = 133.5, 

  -- Gripper Open & Close 
  grip_Open = 26, 
  grip_Close = 15,

--################### This might be off for the first 2 rows##################
  -- -- Set the starting position (mm / deg) 
  -- bottleStartxyz = {
  --   x = 141,
  --   y = -304.5,
  --   z = 220, -- this has to stay about here for clearance when picking up bottles
  --   rx = -174.18,
  --   ry = 45.0,
  --   rz = 93.394,
  -- },
-- -- ##### Correct for rows 2-15 need to check for rows 1-2
--   bottleStartxyz = {
--     x = 100.000,
--     y = -544.003,
--     z = 205, 
--     rx = 174.723,
--     ry = 48.665,
--     rz = 82.174,
--   },
  -- Base bottle orientation (separate these so row16 can differ)
  bottleOri_1_15 = { rx = 174.723, ry = 48.665, rz = 82.174 },
  bottleOri_16   = { rx = 173.868, ry = 44.705, rz = 114.688 },


  -- -- Spacing between bottles (mm) this will no longer be necessary!!!!
  -- spacing = {
  --   d_x = 58,       -- between bottles
  --   d_y = 1.5,
  --   d_x_last = 29,  -- end of row correction
  --   d_y_last = 16,  -- end of row correction (y)
  -- },

  -- Wait time (ms) at filler
  filler_wait_ms = 3000,

  -- -- Tray layout
  -- cols = 6,
  -- rows = 1,

  -- Inverse-kinematics seed / config
  joint_seed = -1,
  
  -- wait time after gripper movement 
  gripper_wait_ms = 600   -- how long to wait after gripper moves (ms)

}

--------------------------------------------------
------------------ Functions --------------------- 
--------------------------------------------------
-- functions.lua (inline or required)
local F = {}

-- no longer being used but it might be necessary since the points need to be saved with x=point.x, y=point.y,....
-- local unpack = table.unpack or unpack

-- Require that a table has certain non-nil keys; raises a clear error if not.
local function require_keys(t, keys, where)
  for i = 1, #keys do
    local k = keys[i]
    -- comment this out if there are errors but it's a safeguard to get the robot to stop if anything is missing
    if t[k] == nil then
      error((where or "table") .. " missing key: '" .. k .. "'")
    end
  end
end

-- EXACT MoveL signature from the manual. No unpack, no aliasing.
-- IMPORTANT: Define this BEFORE any function that calls moveL_point.
function moveL_point(p)
  -- Ensure all fields exist before calling MoveL (this makes the error message readable in the GUI)
  require_keys(p, {'j1','j2','j3','j4','j5','j6','x','y','z','rx','ry','rz',
                   'toolnum','workpiecenum','speed','acc','ovl','ep1','ep2','ep3','ep4',
                   'blendR','search','offset','offset_x','offset_y','offset_z','offset_rx','offset_ry','offset_rz'},
                   "moveL_point() arg")

  return MoveL(
    p.j1, p.j2, p.j3, p.j4, p.j5, p.j6,
    p.x,  p.y,  p.z,  p.rx, p.ry, p.rz,
    p.toolnum, p.workpiecenum,
    p.speed, p.acc, p.ovl,
    p.ep1, p.ep2, p.ep3, p.ep4,
    p.blendR,
    p.search,
    p.offset,
    p.offset_x, p.offset_y, p.offset_z,
    p.offset_rx, p.offset_ry, p.offset_rz
  )
end

-- no longer being used but it might be necessary since the points need to be saved with x=point.x, y=point.y,....
-- -- shallow copy
-- local function copy_table(t)
--   local out = {}
--   if t then
--     for key, value in pairs(t) do out[key] = value end
--   end
--   return out
-- end

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

-- Start at home, rotate, power gripper, open to start gap
function F.startup(home_initial, home_rotate45)
  Lin(home_initial, par.lin_speed, -1, 0, 0)
  Lin(home_rotate45, par.lin_speed, -1, 0, 0)
  ActGripper(1, 1)
  MoveGripper(1, par.grip_Open, par.lin_speed, 17, 5000, 0, 0, 0, 0, 0)
end

-- Approach bottle, grab, lift
function F.bottle_approach_grab(bottle_approach, bottle_btw, bottle_grab)
    moveL_point(bottle_approach)
    moveL_point(bottle_btw)
    moveL_point(bottle_grab)
    -- MoveGripper(1, par.grip_Close, par.lin_speed, 17, 5000, 0, 0, 0, 0, 0)
    WaitMs(par.gripper_wait_ms)          
    moveL_point(bottle_btw)
    moveL_point(bottle_approach)
end

function F.filler(filler_under_approach, filler_edge, filler_insert, filler_wait_ms)
  Lin(filler_under_approach, par.lin_speed, -1, 0, 0)
  Lin(filler_edge, par.lin_speed, -1, 0, 0)
  Lin(filler_insert, par.lin_speed, -1, 0, 0)
  WaitMs(filler_wait_ms)           -- ms
  Lin(filler_edge, par.lin_speed, -1, 0, 0) 
  Lin(filler_under_approach, par.lin_speed, -1, 0, 0)
end

function F.bottle_return_release(bottle_approach, bottle_btw, bottle_grab)
    moveL_point(bottle_approach)
    moveL_point(bottle_btw)
    moveL_point(bottle_grab)
    MoveGripper(1, par.grip_Open, par.lin_speed, 17, 5000, 0, 0, 0, 0, 0)
    WaitMs(par.gripper_wait_ms)          
    moveL_point(bottle_btw)
    moveL_point(bottle_approach)
end

function F.shutdown(home_initial)
  Lin(home_initial, par.lin_speed, -1, 0, 0)
  MoveGripper(1, 100, par.lin_speed, 17, 5000, 0, 0, 0, 0, 0)
  ActGripper(1, 0)
end

--------------------------------------------------------------
-------------------- Combined Runner -------------------------
--------------------------------------------------------------

-- Choose what to run (ONLY ONE will execute):
--   "ROWS_1_15"  -> run rows 1..15 then home
--   "ROW_16"     -> run row 16 (with special handling for bottles 86/87)
--   "ONE_ROW"    -> to test a single row but needs: ROW_TO_RUN,START_COL,END_COL
local RUN_MODE = "ONE_ROW"

-- For ONE_ROW:
local ROW_TO_RUN = 3          -- <- set row number here (1..16)
local START_COL  = 1          -- <- optional
local END_COL    = nil        -- <- nil means “to end of row”

-- Optional controls
local DO_FILLER = true
local DO_RETURN_RELEASE = true

-- For ROW_16 runs: set a start bottle id if you want (84-88)
local ROW16_START_BOTTLE_ID = 84

-- Z levels (keep these distinct; your old params table overwrote these)
local Z_1_15 = { approach = 205.0, btw = 160.0, grab = 133.5 }
local Z_16   = { approach = 205.0, btw = 160.0, grab = 140.5 }

-- ########## Double check that these points are all correct!!!!!!###########################
-- Row definitions from your data_points.txt
local ROWS = {
  [1] = { start_x = 137.5, start_y = -296.5, dx_steps = {58.0, 58.0, 58.0, 58.0, 58.0}, dy_steps = {1.5, 1.5, 1.5, 1.5, 1.5}, new_row_dx = 29.0, new_row_dy = 16.0, bottles = 6 },
  [2] = { start_x = -121.0, start_y = -296.5, dx_steps = {58.0, 58.0, 58.0, 58.0}, dy_steps = {1.5, 1.5, 1.5, 1.5}, new_row_dx = 29.0, new_row_dy = 16.0, bottles = 5 },
  [3] = { start_x = 136.5, start_y = -330.5, dx_steps = {57.0, 57.5, 57.0, 58.0, 57.5}, dy_steps = {0.0, 2.0, 1.0, 1.5, 2.0}, new_row_dx = 28.5, new_row_dy = 17.0, bottles = 6 },
  [4] = { start_x = -122.0, start_y = -341.0, dx_steps = {58.0, 57.5, 57.0, 57.5}, dy_steps = {1.5, 2.5, 0.5, 1.5}, new_row_dx = 28.0, new_row_dy = 16.0, bottles = 5 },
  [5] = { start_x = 136.0, start_y = -363.0, dx_steps = {56.5, 58.0, 57.5, 58.0, 57.5}, dy_steps = {0.0, 1.5, 1.0, 1.5, 2.0}, new_row_dx = 24.5, new_row_dy = 17.0, bottles = 6 },
  [6] = { start_x = -123.5, start_y = -374.5, dx_steps = {57.5, 57.5, 57.5, 58.0}, dy_steps = {2.0, 1.5, 0.5, 1.5}, new_row_dx = 27.5, new_row_dy = 17.0, bottles = 5 },
  [7] = { start_x = 134.5, start_y = -397.0, dx_steps = {56.5, 58.0, 57.5, 58.0, 57.0}, dy_steps = {0.5, 1.0, 0.5, 1.0, 2.0}, new_row_dx = 28.5, new_row_dy = 17.0, bottles = 6 },
  [8] = { start_x = -124.0, start_y = -407.0, dx_steps = {57.0, 57.5, 58.5, 57.5}, dy_steps = {2.0, 1.5, 1.5, 1.5}, new_row_dx = 27.5, new_row_dy = 16.5, bottles = 5 },
  [9] = { start_x = 134.0, start_y = -430.0, dx_steps = {56.5, 58.0, 58.0, 58.0, 57.0}, dy_steps = {0.5, 1.0, 2.5, 1.0, 2.0}, new_row_dx = 28.5, new_row_dy = 17.0, bottles = 6 },
  [10] = { start_x = -125.0, start_y = -440.0, dx_steps = {57.0, 57.5, 58.5, 57.5}, dy_steps = {2.0, 1.5, 1.5, 0.5}, new_row_dx = 27.5, new_row_dy = 17.5, bottles = 5 },
  [11] = { start_x = 133.0, start_y = -463.0, dx_steps = {56.5, 58.0, 58.0, 57.5, 57.0}, dy_steps = {1.5, 2.0, 0.5, 1.0, 2.0}, new_row_dx = 28.5, new_row_dy = 18.0, bottles = 6 },
  [12] = { start_x = -125.5, start_y = -474.0, dx_steps = {57.0, 57.5, 58.5, 57.5}, dy_steps = {2.0, 0.0, 1.5, 1.5}, new_row_dx = 27.5, new_row_dy = 17.5, bottles = 5 },
  [13] = { start_x = 132.5, start_y = -496.5, dx_steps = {56.5, 58.0, 58.0, 57.5, 57.0}, dy_steps = {1.5, 2.0, 0.5, 1.0, 2.0}, new_row_dx = 28.5, new_row_dy = 18.0, bottles = 6 },
  [14] = { start_x = -126.0, start_y = -507.5, dx_steps = {57.5, 57.5, 57.5, 57.5}, dy_steps = {0.5, 1.5, 1.0, 1.5}, new_row_dx = 27.5, new_row_dy = 16.5, bottles = 5 },
  [15] = { start_x = 131.5, start_y = -528.5, dx_steps = {56.5, 58.0, 57.5, 57.5, 57.0}, dy_steps = {1.5, 1.0, 0.5, 1.0, 2.0}, new_row_dx = 28.5, new_row_dy = 18.0, bottles = 6 },
  [16] = { start_x = -126.5, start_y = -540.5, dx_steps = {55.0, 4.0, 56.47, 80.97}, dy_steps = {1.5, 24.5, 1.75, 24.25},bottles = 5 },
}

-- Bottle-specific overrides (fill rx/ry/rz for 86 and 87 once you teach them)
local OVERRIDE = {
  -- [80] = { x = -47.0,  y = -549.5,  rx = 173.868, ry = 44.705, rz = 114.688 }, -- optional
  [86] = { x = -75.5,  y = -566.5,  rx = 173.868, ry = 44.705, rz = 114.688 },
  [87] = { x = -19.03, y = -568.25, rx = 173.868, ry = 44.705, rz = 114.688 },
}

-- Compute bottle id ranges per row
local ROW_START_ID = {}
do
  local id = 1
  for r=1,16 do
    ROW_START_ID[r] = id
    local n
    if r == 16 then
      n = 5  -- B84..B88
    else
      n = ROWS[r].bottles
    end
    id = id + n
  end
end

local function bottle_id_for(r, c)
  return ROW_START_ID[r] + (c - 1)
end

-- Build the nominal XY for a given row/col using per-step dx/dy.
-- Direction convention:
--   odd rows: x -= dx, y += dy
--   even rows: x += dx, y -= dy
local function xy_for(r, c)
  local row = ROWS[r]
  local x = row.start_x
  local y = row.start_y
  if c <= 1 then return x, y end
  local odd = (r % 2 == 1)
  for i=1,(c-1) do
    local dx = row.dx_steps[i]
    local dy = row.dy_steps[i]
    if odd then
      x = x - dx
      y = y + dy
    else
      x = x + dx
      y = y - dy
    end
  end
  return x, y
end

local function pose_xyz_for_bottle(r, c, z)
  local id = bottle_id_for(r, c)
  local x, y = xy_for(r, c)

  local ori = (r == 16) and par.bottleOri_16 or par.bottleOri_1_15
  local rx, ry, rz = ori.rx, ori.ry, ori.rz

  local o = OVERRIDE[id]
  if o then
    if o.x ~= nil then x = o.x end
    if o.y ~= nil then y = o.y end
    if o.rx ~= nil then rx = o.rx end
    if o.ry ~= nil then ry = o.ry end
    if o.rz ~= nil then rz = o.rz end
  end

  return { x=x, y=y, z=z, rx=rx, ry=ry, rz=rz }, id
end

local function do_one_bottle(r, c)
  local Z = (r == 16) and Z_16 or Z_1_15
  
  local xyz_a, id = pose_xyz_for_bottle(r, c, Z.approach)
  local xyz_b, _  = pose_xyz_for_bottle(r, c, Z.btw)
  local xyz_g, _  = pose_xyz_for_bottle(r, c, Z.grab)

  local joints_a = F.convertPoint(xyz_a, par.joint_seed)
  local joints_b = F.convertPoint(xyz_b, par.joint_seed)
  local joints_g = F.convertPoint(xyz_g, par.joint_seed)

  local bottle_approach = F.createPoint(xyz_a, joints_a, par.bottle_params)
  local bottle_btw      = F.createPoint(xyz_b, joints_b, par.bottle_params)
  local bottle_grab     = F.createPoint(xyz_g, joints_g, par.bottle_params)

  F.bottle_approach_grab(bottle_approach, bottle_btw, bottle_grab)

  if DO_FILLER then
    if r == 16 then
      F.filler(P.filler_under_approach_row16, P.filler_edge_row16, P.filler_insert_row16, par.filler_wait_ms)
    else
      F.filler(P.filler_under_approach, P.filler_edge, P.filler_insert, par.filler_wait_ms)
    end
  end

  if DO_RETURN_RELEASE then
    F.bottle_return_release(bottle_approach, bottle_btw, bottle_grab)
  end
end

local function run_row(r, start_col, end_col)
  local ncols = ROWS[r].bottles
  start_col = start_col or 1
  end_col   = end_col or ncols
  for c=start_col, end_col do
    do_one_bottle(r, c)
  end
end

local function run_rows_1_15()
  for r=1,15 do
    run_row(r, 1, nil)
  end
end

local function run_row_16_from_bottle(start_id)
  -- Row 16 is bottles 84..88, mapped to cols 1..5
  local col = (start_id - 84) + 1
  if col < 1 then col = 1 end
  if col > 5 then col = 5 end
  run_row(16, col, 5)
end

--------------------------------------------------------------
------------------------- Execute -----------------------------
--------------------------------------------------------------

F.startup(P.home_initial, P.home_rotate45)

if RUN_MODE == "ROWS_1_15" then
  run_rows_1_15()
  F.shutdown(P.home_initial)

elseif RUN_MODE == "ROW_16" then
  run_row_16_from_bottle(ROW16_START_BOTTLE_ID)
  F.shutdown(P.home_initial)

elseif RUN_MODE == "ONE_ROW" then
  local r = ROW_TO_RUN
  local ncols = ROWS[r].bottles
  local endc = END_COL or ncols
  run_row(r, START_COL, endc)
  F.shutdown(P.home_initial)

else
  -- Default safe behavior
  F.shutdown(P.home_initial)
end
