--------------------------------------------------
--------------------- Points --------------------- 
--------------------------------------------------
local P = {
  -- NOTE: speed/acc here are ignored by Lin(); Lin speed comes from par.lin_speed
  -- Home & startup 
  home_initial = {
    x=198.500, y=-315.5, z=300.00,
    rx=141.295, ry=88.99, rz=16.381,
    j1=120.565, j2=-78.789, j3=129.202, j4=-48.514, j5=155.463, j6=-87.641,
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
        speed = 50, -- 15-25(Slow), 30-50 (MED), 75.0 (fast might be too fast??)   -- percent
        acc   = 50, -- 15-25(Slow), 30-50 (MED), 75.0 (fast might be too fast??)
        ovl   = 40, -- 30(Slow), 50.0 (MED), 80.0 (fast might be too fast??)
        ep1 = 0, ep2 = 0, ep3 = 0, ep4 = 0,
        blendR = -1,    -- no blending
        search = 0,
        offset = 0,
        offset_x = 0, offset_y = 0, offset_z = 0,
        offset_rx = 0, offset_ry = 0, offset_rz = 0,
      },

  lin_speed = 35, -- slow=10-15, med=20-30, fast=40-60  Note that chosen speed on the interface is 35% but match that here

  -- Gripper orientation 
  gripperOri = {rx=141.295, ry=88.99, rz=16.381}, --{rx=136.173,ry=89.012,rz=11.265},
  -- Wait time (ms) at filler
  filler_wait_ms = 3000,

  -- Inverse-kinematics seed / config
  joint_seed = -1,

}

--------------------------------------------------
------------------ Functions --------------------- 
--------------------------------------------------
-- functions.lua (inline or required)
local F = {}

-- Require that a table has certain non-nil keys; raises a clear error if not.
local function require_keys(t, keys, where)
  for i = 1, #keys do
    local k = keys[i]
    -- comment this out if there are errors but it's a safeguard to get the robot to stop if anything is missing
    -- if t[k] == nil then
    --   error((where or "table") .. " missing key: '" .. k .. "'")
    -- end
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

-- Start at home
function F.startup(home_initial)
  Lin(home_initial, par.lin_speed, -1, 0, 0)
end

-- Approach bottle, grab, lift
function F.bottle_approach_grab(bottle_approach, bottle_btw, bottle_grab)
    moveL_point(bottle_approach)
    -- moveL_point(bottle_btw)
    moveL_point(bottle_grab)
    WaitMs(par.filler_wait_ms)          
    -- moveL_point(bottle_btw)
    moveL_point(bottle_approach)
end

-- End process and shutdown 
function F.shutdown(home_initial)
  Lin(home_initial, par.lin_speed, -1, 0, 0)
end

--------------------------------------------------------------
------------------ Combined Workflow -------------------------
--------------------------------------------------------------

-- Choose what to run (ONLY ONE will execute):
--   "ROWS_ALL"  -> run all rows 
--   "ONE_ROW"    -> to test a single row but needs: ROW_TO_RUN,START_COL,END_COL
--   "ONE_BOTTLE" -> to test 1 bottle only 
--   "ROWS_RANGE" -> to test row ranges (Example: 1 - 3) 
local RUN_MODE = "ROWS_ALL"

-- For ONE_BOTTLE:
local ONE_BOTTLE_ROW = 1
local ONE_BOTTLE_COL = 1

-- For ONE_ROW: runs row 3
local ROW_TO_RUN = 3          -- <- set row number here (1..16)
local START_COL  = 1          -- <- optional
local END_COL    = nil        -- <- nil means “to end of row”

-- For multiple rows rows 1-5
local ROW_START = 1
local ROW_END   = 1

-- Z levels (approach bottle, right above bottle, insert) 
local Z_positions = {approach = 160.0, btw = 145.0, grab = 117.0} -- 160,155,119might change the btw to 145 to be closer to the neck of the bottle

-- ########## Double check that these points are all correct!!!!!!###########################
-- Row definitions from your data_points.txt
local ROWS = {
  [1]  = {start_x = 198.2 , start_y = -315.5, dx_steps = {57.2, 57.0, 57.0, 56.0, 57.5}, dy_steps = {3.0, 1.0, 0.5, 3.0, 1.3}, bottles = 6 },
  [2]  = {start_x = -60.5 , start_y = -325.0, dx_steps = {57.5, 58.5, 59.0, 55.0},       dy_steps = {1.5, 2.0, 2.5, 1.5},      bottles = 5 },
  [3]  = {start_x = 199.5 , start_y = -349.0, dx_steps = {58.0, 57.8, 57.7, 57.0, 57.5}, dy_steps = {2.0, 1.0, 2.5, 2.5, 0.5}, bottles = 6 },  
  [4]  = {start_x = -61.0 , start_y = -357.5, dx_steps = {58.5, 56.5, 56.0, 59.5},       dy_steps = {3.5, 2.0, 1.2, 2.2},      bottles = 5 },
  [5]  = {start_x = 198.3 , start_y = -381.8, dx_steps = {57.5, 58.5, 56.0, 59.0, 57.5}, dy_steps = {0.0, 1.6, 3.5, 1.8, 2.0}, bottles = 6 },  
  [6]  = {start_x = -61.6 , start_y = -391.7, dx_steps = {58.2, 55.1, 57.5, 57.5},       dy_steps = {2.2, 1.2, 2.4, 2.7},      bottles = 5 },
  [7]  = {start_x = 195.5 , start_y = -416.0, dx_steps = {56.0, 58.5, 58.0, 56.8, 57.7}, dy_steps = {0.0, 2.6, 3.4, 1.8, 2.0}, bottles = 6 },
  [8]  = {start_x = -61.5 , start_y = -424.8, dx_steps = {55.2, 57.7, 57.5, 57.5},       dy_steps = {1.7, 1.2, 3.1, 2.7},      bottles = 5 },
  [9]  = {start_x = 195.7 , start_y = -450.8, dx_steps = {59.0, 56.7, 57.3, 57.8, 57.2}, dy_steps = {1.3, 5.6, 1.8, 0.1, 2.0}, bottles = 6 },
  [10] = {start_x = -63.6 , start_y = -457.75, dx_steps = {57.5, 57.3, 56.4, 57.5},       dy_steps = {2.5, 1.95, 2.3, 3.7},      bottles = 5 },
  [11] = {start_x = 192.7 , start_y = -484.0, dx_steps = {58.2, 55.2, 57.3, 57.9, 57.8}, dy_steps = {2.1, 3.7, 0.4, 1.8, 2.8}, bottles = 6 }, 
  [12] = {start_x = -64.6 , start_y = -491.8, dx_steps = {57.4, 57.3, 56.4, 57.5},       dy_steps = {3.8, 1.0, 2.3, 1.7},      bottles = 5 },  
  [13] = {start_x = 192.7 , start_y = -516.5, dx_steps = {58.2, 57.2, 56.7, 57.9, 55.4}, dy_steps = {2.0, 1.7, 1.7, 1.8, 1.2}, bottles = 6 },  
  [14] = {start_x = -65.6 , start_y = -525.65, dx_steps = {56.4, 57.4, 56.6, 57.6},       dy_steps = {1.8, 1.0, 2.4, 1.5},      bottles = 5 },
  [15] = {start_x = 192.0 , start_y = -550.0, dx_steps = {59.2, 57.1, 56.7, 56.9, 57.5}, dy_steps = {2.3, 1.7, 1.8, 1.8, 1.7}, bottles = 6 },
  [16] = {start_x = -66.8 , start_y = -558.6, dx_steps = {57.4, 56.7, 55.7, 58.7},       dy_steps = {1.8, 1.2, 2.5, 0.8},      bottles = 5 },
}

-- Compute bottle id ranges per row
local ROW_START_ID = {}
do
  local id = 1
  for r=1,16 do
    ROW_START_ID[r] = id
    local n
    n = ROWS[r].bottles
    id = id + n
  end
end

local function bottle_id_for(r, c)
  return ROW_START_ID[r] + (c - 1)
end

-- Build the nominal XY for a given row and column using dx and dy
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
  local ori = par.gripperOri
  local rx, ry, rz = ori.rx, ori.ry, ori.rz
  return {x=x, y=y, z=z, rx=rx, ry=ry, rz=rz}, id
end

local function do_one_bottle(r, c)
  local Z = Z_positions
  
  local xyz_a, id = pose_xyz_for_bottle(r, c, Z.approach)
  local xyz_b, _  = pose_xyz_for_bottle(r, c, Z.btw)
  local xyz_g, _  = pose_xyz_for_bottle(r, c, Z.grab)

  local joints_a = F.convertPoint(xyz_a, par.joint_seed)
  local joints_b = F.convertPoint(xyz_b, par.joint_seed)
  local joints_g = F.convertPoint(xyz_g, par.joint_seed)

  local bottle_approach = F.createPoint(xyz_a, joints_a, par.bottle_params)
  local bottle_btw      = F.createPoint(xyz_b, joints_b, par.bottle_params)
  local bottle_grab     = F.createPoint(xyz_g, joints_g, par.bottle_params)

  -- F.bottle_approach_grab(bottle_approach, bottle_btw, bottle_grab)
  F.bottle_approach_grab(bottle_approach, bottle_btw, bottle_grab)

end

local function run_row(r, start_col, end_col)
  local ncols = ROWS[r].bottles
  start_col = start_col or 1
  end_col   = end_col or ncols
  for c=start_col, end_col do
    do_one_bottle(r, c)
  end
end

local function run_rows_all()
  for r=1,16 do
    run_row(r, 1, nil)
  end
end

local function run_rows_range(r_start, r_end)
  for r = r_start, r_end do
    run_row(r, 1, nil)
  end
end

--------------------------------------------------------------
------------------------- Execute -----------------------------
--------------------------------------------------------------

F.startup(P.home_initial)

if RUN_MODE == "ROWS_ALL" then
  run_rows_all()
  F.shutdown(P.home_initial)

elseif RUN_MODE == "ONE_ROW" then
  local r = ROW_TO_RUN
  local ncols = ROWS[r].bottles
  local endc = END_COL or ncols
  run_row(r, START_COL, endc)
  F.shutdown(P.home_initial)

elseif RUN_MODE == "ONE_BOTTLE" then
  do_one_bottle(ONE_BOTTLE_ROW, ONE_BOTTLE_COL)
  F.shutdown(P.home_initial)

elseif RUN_MODE == "ROWS_RANGE" then
  run_rows_range(ROW_START, ROW_END)
  F.shutdown(P.home_initial)

else
  -- Default safe behavior
  F.shutdown(P.home_initial)
end
