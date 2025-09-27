
local Par = require('params')

--Using MoveL for Linear Motion
j1,j2,j3,j4,j5,j6=GetInverseKin(0,Par.x,Par.y,Par.z,Par.rx,Par.ry,Par.rz,-1) ---315.039,327.526,786.334,0.052,-32.916,-32.464,-1)

print(j1,j2,j3,j4,j5,j6)

-- Exampl of MoveL
-- MoveL(j1, j2, j3, j4, j5, j6, Par.x, Par.y, Par.z, Par.rx, Par.ry, Par.rz, Par.tool, Par.user, Par.speed, Par.acc, Par.ovl, Par.ep1,Par.ep2,Par.ep3, Par.ep4, Par.blendR, Par.search, Par.offset, Par.offset_x, Par.offset_y, Par.offset_z, Par.offset_rx,Par.offset_ry, Par.offset_rz) 

-- MoveL(j1, j2,j3,j4,j5,j6,-315.039,327.526,786.334,0.052,-32.916,-32.464, 1,0, 100,180, 100, -1, 0.000,0.000,0.000,0.000,0,0,0,0,0,0,0,0)
