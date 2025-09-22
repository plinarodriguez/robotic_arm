Currently the directory has a preliminary study 
- manual point configuration 
- has both point to point and linear movements
- goes to the filler machine
- points might not be consistent anymore 
- This was setup with the original gripper fingers

To Do: 
- redo with new gripper fingers of 3d printed plastic 
- Standardize pick up first bottle 
- identify starting point 
- pythonify this effort 

Test List:

## Tests (`protocol_1/`) — Single Bottle in 8×8 Tray

These tests mirror `protocol_0/` but add **tray indexing**: the robot targets a single bottle in an **8×8 tray** using `(row, col)` addressing. Each test validates one capability before building up to full filler integration.

### Tests

- **`home_cycle_from_grid`**  
  - Start at home  
  - Return to home  
  *Purpose: baseline homing (grid parameters parsed but not used).*

- **`bottle_reach_from_grid`**  
  - Start at home  
  - Move to `(row, col)` bottle approach position  
  - Return to home  
  *Purpose: verifies grid indexing and positioning.*

- **`single_bottle_cycle_from_grid`**  
  - Start at home  
  - Move to `(row, col)` bottle approach  
  - Descend to bottle  
  - Grab bottle (close gripper)  
  - Pick up bottle (lift)  
  - Return bottle to tray  
  - Drop bottle (open gripper)  
  - Return to home  
  *Purpose: validates gripper control and pick/place cycle using tray addressing.*

- **`filler_approach_from_grid`**  
  - Start at home  
  - Move to `(row, col)` bottle  
  - Grab bottle (close gripper)  
  - Pick up bottle (lift)  
  - Move to under-filler position  
  - Return bottle to tray  
  - Drop bottle (open gripper)  
  - Return to home  
  *Purpose: validates movement from tray to filler approach.*

- **`filler_integration_from_grid`**  
  - Start at home  
