local Pts={
    -- Home & staging
    home_initial = {
        x=99.999, y=-195.001, z=370.661,
        rx=169.561, ry=89.557, rz=76.324,
        j1=92.223, j2=-134.075, j3,=131.596, j4 2.917, j5,=95.460, j6=-89.878,
        e1=0.000, e2=0.000, e3=0.000, e4=0.000,
        speed=100,
        acc=100,
        elbow_speed=100,
        elbow_acc=100,
        toolnum=0,
        workpiecenum=0,
    },
    -- Rotate arm 45 degrees to match the finger angle
    home_rotate45  = {
        x=96.327, y=-100.229, z=330.786,
        rx=-174.688, ry=47.490, rz=92.030,
        j1=92.215,j2=-134.072,j3=131.594,j4=45.000,j5=95.448,j6=-89.875,
        e1=0.000, e2=0.000, e3=0.000, e4=0.000,
        speed=100,
        acc=100,
        elbow_speed=100,
        elbow_acc=100,
        toolnum=0,
        workpiecenum=0,
    },
    -- Filler locations: Under the filler  at a safe distance
    filler_under_approach = {
        x=14.997, y=-497.007, z=289.996,
        rx=173.348, ry=43.631, rz=84.588,
        j1=77.532,j2=-74.047,j3=92.970,j4=28.268,j5=78.513,j6=-95.205,
        e1=0.000, e2=0.000, e3=0.000, e4=0.000,
        speed=100,
        acc=100,
        elbow_speed=100,
        elbow_acc=100,
        toolnum=0,
        workpiecenum=0,
    },
    -- Filler locations: The edge of the filler nozzle
    filler_edge = {
        x=14.997, y=-497.000, z=313.998,
        rx=173.347, ry=43.634, rz=84.586,
        j1=77.532,j2=-75.010,j3=90.577,j4=31.621,j5=78.513,j6=-95.204,
        e1=0.000, e2=0.000, e3=0.000, e4=0.000,
        speed=100,
        acc=100,
        elbow_speed=100,
        elbow_acc=100,
        toolnum=0,
        workpiecenum=0,
    },    
    -- Filler locations: The top of the filler nozzle
    filler_insert  = {
        x=14.997, y=-497.007, z=339.004,
        rx=173.345, ry=43.638, rz=84.586,
        j1=77.532,j2=-75.817,j3=87.873,j4=35.128,j5=78.510,j6=-95.204,
        e1=0.000, e2=0.000, e3=0.000, e4=0.000,
        speed=100,
        acc=100,
        elbow_speed=100,
        elbow_acc=100,
        toolnum=0,
        workpiecenum=0,
    }, 
}
return Pts