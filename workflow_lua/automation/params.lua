local Params = {
    -- Number of columns and rows
    cols = 6,
    rows = 8,

    -- Set the starting position
    x = 1, -- position in mms
    y = 1, -- position in mms

    -- Spacing between bottles
    d_x = 0.5,      -- space between bottles
    d_x_last = 0.5, -- space between bottles at the end of row 
    d_y_last = 0.5, -- space between bottles at the end of row

    -- Wait Time
    filler_wait = 3000

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