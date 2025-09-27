local Par = {
    -- Number of columns and rows
    cols = 6,
    rows = 8,

    -- Set the starting position
    x = 101.498, -- position in mms
    y = -288.711, -- position in mms
    z = 135.0, 
    rx = -179.124,
    ry = 78.208,
    rz = 90.446,

    -- Move Conditions 
    tool = 0,
    user = 0,
    vel = 20.0,
    acc = 20.0,
    ovl = 1.0,
    blendR = 0.0,
    flag = 0,
    search = 0,
    speed = 0,
    ep1 = 0,
    ep2 = 0,
    ep3 = 0,
    ep4 = 0, 
    offset = 0,
    offset_x = 0,
    offset_y = 0,
    offset_z = 0,
    offset_rx = 0,
    offset_ry = 0,
    offset_rz = 0,
    
    -- Spacing between bottles
    d_x = 0.5,      -- space between bottles
    d_x_last = 0.5, -- space between bottles at the end of row 
    d_y_last = 0.5, -- space between bottles at the end of row

    -- Wait Time
    filler_wait = 3000,

    -- Gripper config
    OPEN      = 27,   -- gripper open for bottle pick up 
    CLOSED    = 4,    -- gripper closed on bottle neck
    FULL_OPEN = 100,  -- gripper fully open

    -- Speeds fix these they're not all being used!!!!
    fast      = 50,   -- approach/retreat
    approach  = 50,   -- descend to pick
    place     = 25,   -- descend to place
    insert    = 10,   -- tight insertion
    pullout   = 20,   -- back out

}
return Params