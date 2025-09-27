#!/usr/bin/env lua

-- === knobs ===
local TEST = 0          -- 0=import, 1=startup, 2=single, 3=row, 4=two_rows, 5=full_tray
local PRINT_ONLY = true -- start true; set to false ONLY after prints look right

-- === deps ===
local F   = require('functions')
local P   = require('points')
local Par = require('params')

-- === helpers ===
local function log(...) print(table.concat({...}," ")) end

local function make_points_at(base)
  local xyz_a = {x=base.x, y=base.y, z=Par.bottle_approach_z, rx=base.rx, ry=base.ry, rz=base.rz}
  local xyz_g = {x=base.x, y=base.y, z=Par.bottle_grab_z,     rx=base.rx, ry=base.ry, rz=base.rz}
  local ja = F.convertPoint(xyz_a, Par.ik_config, nil)
  local jg = F.convertPoint(xyz_g, Par.ik_config, nil)
  local ap = F.createPoint(xyz_a, ja, Par.bottle_params)
  local gr = F.createPoint(xyz_g, jg, Par.bottle_params)
  return ap, gr
end

local function base_from_params()
  return {
    x  = Par.bottleStartxyz.x,
    y  = Par.bottleStartxyz.y,
    rx = Par.bottleStartxyz.rx,
    ry = Par.bottleStartxyz.ry,
    rz = Par.bottleStartxyz.rz,
  }
end

local function run_cell_cycle(base)
  local ap, gr = make_points_at(base)
  if PRINT_ONLY then
    log(string.format("PLAN cell: x=%.3f y=%.3f -> approach z=%.3f grab z=%.3f", base.x, base.y, Par.bottle_approach_z, Par.bottle_grab_z))
    return
  end
  F.bottle_approach_grab(ap, gr)
  F.filler(P.filler_under_approach, P.filler_edge, P.filler_insert, Par.filler_wait)
  F.bottle_return_release(ap, gr)
end

local function serpentine(rows, cols, step_cb)
  local b = base_from_params()
  local r, c = 1, 1
  while r <= rows do
    step_cb(b, r, c)
    if (r % 2) == 1 then
      if c < cols then b.x = b.x + Par.d_x; c = c + 1
      else b.x = b.x + Par.d_x_last; b.y = b.y + Par.d_y_last; r = r + 1; c = cols end
    else
      if c > 1 then b.x = b.x - Par.d_x; c = c - 1
      else b.x = b.x - Par.d_x_last; b.y = b.y + Par.d_y_last; r = r + 1; c = 1 end
    end
  end
end

-- === steps ===
local function step_import()
  log("OK: modules loaded")
  local xyz = {x=Par.bottleStartxyz.x, y=Par.bottleStartxyz.y, z=Par.bottle_approach_z,
               rx=Par.bottleStartxyz.rx, ry=Par.bottleStartxyz.ry, rz=Par.bottleStartxyz.rz}
  local j1,j2,j3,j4,j5,j6 = GetInverseKin(0, xyz.x, xyz.y, xyz.z, xyz.rx, xyz.ry, xyz.rz, Par.ik_config or -1)
  log("IK:", j1,j2,j3,j4,j5,j6)
end

local function step_startup()
  if PRINT_ONLY then log("PLAN startup: home_initial -> rotate45 (no motion)") return end
  F.startup(P.home_initial, P.home_rotate45)
end

local function step_single()
  local b = base_from_params()
  run_cell_cycle(b)
end

local function step_row()
  if not PRINT_ONLY then F.startup(P.home_initial, P.home_rotate45) end
  serpentine(1, Par.cols, run_cell_cycle)
  if not PRINT_ONLY then F.shutdown(P.home_initial) end
end

local function step_two_rows()
  if not PRINT_ONLY then F.startup(P.home_initial, P.home_rotate45) end
  serpentine(2, Par.cols, run_cell_cycle)
  if not PRINT_ONLY then F.shutdown(P.home_initial) end
end

local function step_full_tray()
  if not PRINT_ONLY then F.startup(P.home_initial, P.home_rotate45) end
  serpentine(Par.rows, Par.cols, run_cell_cycle)
  if not PRINT_ONLY then F.shutdown(P.home_initial) end
end

-- === run selected ===
if     TEST == 0 then step_import()
elseif TEST == 1 then step_startup()
elseif TEST == 2 then step_single()
elseif TEST == 3 then step_row()
elseif TEST == 4 then step_two_rows()
elseif TEST == 5 then step_full_tray()
else log("Unknown TEST value:", TEST) end
