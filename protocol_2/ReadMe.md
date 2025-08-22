This workflow was able to repeat protocol_1 over three bottles 
- automation is too manual 
- there are movements along the y-axis not just the x-axis for moving between bottles 
    - need to quantify this amount
- linear movements and positions are good enough 
- this study was performed with original gripper fingers 
    - limitations over the positioning and gripping of the bottle 

To Do: 
- redo with new gripper fingers of 3d printed plastic 

Test List: 

## Tests (`protocol_2/`) — Three Bottles in a Row

These tests extend the single-bottle workflows to operate sequentially across **three bottles in a row** (e.g., columns `[0,1,2]` in the same row). Each test validates that the robot can repeat motions consistently across multiple targets.

- **`three_bottle_reach`**  
  - Start at home position  
  - Move to bottle 1  
  - Return to home position  
  - Move to bottle 2  
  - Return to home position  
  - Move to bottle 3  
  - Return to home position  
  *Purpose: verifies motion planning to multiple bottles in sequence*

- **`three_bottle_cycle`**  
  - Start at home position  
  - For each bottle (1 → 3):  
    - Move to bottle  
    - Grab bottle (close gripper)  
    - Pick up bottle (lift)  
    - Return bottle to tray  
    - Drop bottle (open gripper)  
    - Return to home position  
  *Purpose: verifies gripper control and repeatable pick/place cycles*

- **`three_bottle_filler_approach`**  
  - Start at home position  
  - For each bottle (1 → 3):  
    - Move to bottle  
    - Grab bottle (close gripper)  
    - Pick up bottle (lift)  
    - Move to under-filler position  
    - Return bottle to tray  
    - Drop bottle (open gripper)  
    - Return to home position  
  *Purpose: verifies filler approach alignment for multiple bottles*

- **`three_bottle_filler_integration`**  
  - Start at home position  
  - For each bottle (1 → 3):  
    - Move to bottle  
    - Grab bottle (close gripper)  
    - Pick up bottle (lift)  
    - Move to under-filler position  
    - Lift into filler  
    - Drop bottle from filler (open gripper)  
    - Move back under filler  
    - Return bottle to tray  
    - Drop bottle (open gripper)  
    - Return to home position  
  *Purpose: verifies full filler interaction across multiple bottles in sequence*
