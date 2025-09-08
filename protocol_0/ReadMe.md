## Data Points Required

- **`home_axis_test`**   
  - pHome
  - home_forward
  - home_backward
  - home_up
  - home_down
  - home_left
  - home_right

- **`bottle_reach_cycle`**  & **`single_bottle_pick_place`**  
  - single_bottle_rotate45
  - single_bottle_approach
  - single_bottle_grab 
  - single_bottle2_approach
  - single_bottle2_grab 
  - single_bottle3_approach
  - single_bottle3_grab 

- **`filler_approach`**  
  - filler_under_approach

- **`filler_suction`**  
  - filler_insert

## Tests (`protocol_0/`) — Capability Checks

These tests isolate basic capabilities of the robotic arm before moving on to more complex workflows.This test robotic arm capabilities without tray complexities or interference

**Configuration Notes**
- Draw a circle of the bottle in the center of where the tray will be located. Setup for future tests for always testing one bottle first. 

- **`home_axis_test`**  
  - Start at home position (`home`)  
  - Move forward (+x) → `home_forward`  
  - Move backward (–x) → `home_backward`  
  - Return to home (`home`)  
  - Move up (+z) → `home_up`  
  - Move down (–z) → `home_down`  
  - Return to home (`home`)  
  - Move left (+y) → `home_left`  
  - Move right (–y) → `home_right`  
  - Return to home (`home`)  
  *Purpose: verifies functionality and small ±1 mm Cartesian movements around start position(`home`)  

- **`gripper_closure`**  
  - Start at home position (`home`)  
  - Activate gripper  
  - Set gripper to **75%** closure 
  - Set gripper to **25%** closure  
  - Set gripper to **50%** closure 
  - Set gripper to **100%** closure 
  - Open gripper fully  
  - Deactivate gripper  
  *Purpose: verify gripper setpoints (25/50/75/100%)
  - **Notes:**  
    - Define closure as percentage of travel between `open_width` and `close_width`.  
    - Identify bottle neck clearance????


- **`bottle_reach_cycle`**  
  - Start at home position (`home`)  
  - Activate gripper  
  - Close gripper partially (pre-position to reduce interference)  
  - Move above bottle (`single_bottle_approach`)  
  - Move down to bottle neck (`single_bottle_grasp`)  
  - Return above bottle (`single_bottle_approach`)  
  - Return to home position (`home`)  
  - Open gripper fully  
  - Deactivate gripper  
  *Purpose: verifies approach, descent, and retreat motions to the single bottle position*  
  - Notes: single bottle test position = `single_bottle`

- **`single_bottle_pick_place`**  
  - Start at home position (`home`)  
  - Activate gripper  
  - Close gripper partially (pre-position to reduce interference)  
  - Move above bottle (`single_bottle_approach`)  
  - Move down to bottle neck (`single_bottle_grasp`)  
  - Close gripper fully (grab bottle)  
  - Move above bottle (`single_bottle_approach`)  
  - Move down to bottle neck (`single_bottle_grasp`)  
  - Open gripper (drop bottle)  
  - Move above bottle (`single_bottle_approach`)  
  - Return to home position (`home`)  
  - Open gripper fully  
  - Deactivate gripper  
  *Purpose: verifies gripper activation/deactivation and complete pick/place cycle*

- **`filler_approach`**  
  - Start at home position (`home`)  
  - Activate gripper  
  - Close gripper partially (pre‑position to reduce interference)  
  - Move above bottle (`single_bottle_approach`)  
  - Move down to bottle neck (`single_bottle_grasp`)  
  - Close gripper fully (grab bottle)  
  - Move above bottle (`single_bottle_approach`)  
  - Move to under‑filler approach position (`filler_under_approach`)  
  - Return above bottle (`single_bottle_approach`)  
  - Move down to bottle neck (`single_bottle_grasp`)  
  - Open gripper (drop bottle)  
  - Move above bottle (`single_bottle_approach`)  
  - Return to home position (`home`)  
  - Open gripper fully  
  - Deactivate gripper  
  *Purpose: verifies motion to filler approach and safe return without performing fill*

- **`filler_suction`**  
  - Start at home position (`home`)  
  - Activate gripper  
  - Close gripper partially (pre-position to reduce interference)  
  - Move above bottle (`single_bottle_approach`)  
  - Move down to bottle neck (`single_bottle_grasp`)  
  - Close gripper fully (grab bottle)  
  - Move above bottle (`single_bottle_approach`)  
  - Move to under-filler approach position (`filler_under_approach`)  
  - Lift into filler (`filler_insert`)  
  - Hold for 3 seconds  
  - Move back to under-filler approach (`filler_under_approach`)  
  - Move above bottle (`single_bottle_approach`)  
  - Move down to bottle neck (`single_bottle_grasp`)  
  - Open gripper (drop bottle)  
  - Move above bottle (`single_bottle_approach`)  
  - Return to home position (`home`)  
  - Open gripper fully  
  - Deactivate gripper  
  *Purpose: verifies full filler interaction, including lifting bottle into filler and safe return*
