# Tray Workflow Test Checklist (Manual Run Settings)

This file maps **each test you described** to the **exact variables to change** in your **Combined Runner** section so you can run one test at a time and troubleshoot.

## Global toggles (use these a lot)

These are already in your code:

```lua
-- Optional controls
local DO_FILLER = true
local DO_RETURN_RELEASE = true
```

**Common settings:**
- **Grab-only (no filler, no return/release):**
  ```lua
  local DO_FILLER = false
  local DO_RETURN_RELEASE = false
  ```
- **Grab + return/release (no filler):**
  ```lua
  local DO_FILLER = false
  local DO_RETURN_RELEASE = true
  ```
- **Full cycle (grab + filler + return/release):**
  ```lua
  local DO_FILLER = true
  local DO_RETURN_RELEASE = true
  ```

---

## Bottle ID mapping you’ll need

Row 16 is bottles **84..88**:
- Bottle 84 → row 16 col 1  
- Bottle 85 → row 16 col 2  
- **Bottle 86 → row 16 col 3**  
- **Bottle 87 → row 16 col 4**  
- Bottle 88 → row 16 col 5  

Bottle 1 is **row 1 col 1**.

---

## Test 1 — Single Bottle (Bottle 1)

### 1A) Bottle 1: move to grab pose **without gripping**
Set runner:

```lua
local RUN_MODE = "ONE_BOTTLE"
local ONE_BOTTLE_ROW = 1
local ONE_BOTTLE_COL = 1

local DO_FILLER = false
local DO_RETURN_RELEASE = false
```

> Note: Your current `F.bottle_approach_grab()` has the **gripper close commented out**, so right now it behaves like “no grip”.

### 1B) Bottle 1: grab **with grip** (close gripper), then lift back up
**Code change (temporary for this test):** in `F.bottle_approach_grab()` uncomment the close command:

```lua
MoveGripper(1, par.grip_Close, par.lin_speed, 17, 5000, 0, 0, 0, 0, 0)
WaitMs(par.gripper_wait_ms)
```

Runner:

```lua
local RUN_MODE = "ONE_BOTTLE"
local ONE_BOTTLE_ROW = 1
local ONE_BOTTLE_COL = 1

local DO_FILLER = false
local DO_RETURN_RELEASE = false
```

### 1C) Bottle 1: grab + filler (no return/release yet)
Runner:

```lua
local RUN_MODE = "ONE_BOTTLE"
local ONE_BOTTLE_ROW = 1
local ONE_BOTTLE_COL = 1

local DO_FILLER = true
local DO_RETURN_RELEASE = false
```

### 1D) Bottle 1: full cycle (grab + filler + return/release)
Runner:

```lua
local RUN_MODE = "ONE_BOTTLE"
local ONE_BOTTLE_ROW = 1
local ONE_BOTTLE_COL = 1

local DO_FILLER = true
local DO_RETURN_RELEASE = true
```

---

## Test 2 — Repeat single-bottle test with Bottle 86 (Row 16 special)

### 2A) Bottle 86: grab-only (no filler, no return/release)
Runner:

```lua
local RUN_MODE = "ONE_BOTTLE"
local ONE_BOTTLE_ROW = 16
local ONE_BOTTLE_COL = 3   -- bottle 86

local DO_FILLER = false
local DO_RETURN_RELEASE = false
```

### 2B) Bottle 86: grab + filler (no return/release)
```lua
local RUN_MODE = "ONE_BOTTLE"
local ONE_BOTTLE_ROW = 16
local ONE_BOTTLE_COL = 3

local DO_FILLER = true
local DO_RETURN_RELEASE = false
```

### 2C) Bottle 86: full cycle
```lua
local RUN_MODE = "ONE_BOTTLE"
local ONE_BOTTLE_ROW = 16
local ONE_BOTTLE_COL = 3

local DO_FILLER = true
local DO_RETURN_RELEASE = true
```

---

## Test 3 — Test all positions with **grab only** (no filler)

For all of these, use:

```lua
local DO_FILLER = false
local DO_RETURN_RELEASE = false
```

### 3A) Row 1 only (grab-only)
```lua
local RUN_MODE = "ONE_ROW"
local ROW_TO_RUN = 1
local START_COL = 1
local END_COL = nil
```

### 3B) Rows 2–15 one at a time (grab-only)
Repeat this pattern, changing only `ROW_TO_RUN`:

```lua
local RUN_MODE = "ONE_ROW"
local ROW_TO_RUN = 2   -- set 2, then 3, then 4, ... up to 15
local START_COL = 1
local END_COL = nil
```

### 3C) Rows 1–15 all rows (grab-only)
```lua
local RUN_MODE = "ROWS_1_15"
```

### 3D) Row 16 only (grab-only)
Option 1 (recommended, full row):  
```lua
local RUN_MODE = "ONE_ROW"
local ROW_TO_RUN = 16
local START_COL = 1
local END_COL = nil
```

Option 2 (start at a bottle id and go to end of row 16):
```lua
local RUN_MODE = "ROW_16"
local ROW16_START_BOTTLE_ID = 84
```

### 3E) Rows 15–16 (grab-only)
```lua
local RUN_MODE = "ROWS_RANGE"
local ROW_START = 15
local ROW_END = 16
```

### 3F) Rows 1–16 (grab-only)
```lua
local RUN_MODE = "ROWS_RANGE"
local ROW_START = 1
local ROW_END = 16
```

---

## Test 4 — Test all bottles with filler

For all of these, use:

```lua
local DO_FILLER = true
local DO_RETURN_RELEASE = true
```

Then choose the runner:

### 4A) Row 1 with filler
```lua
local RUN_MODE = "ONE_ROW"
local ROW_TO_RUN = 1
local START_COL = 1
local END_COL = nil
```

### 4B) Rows 2–15 one at a time with filler
```lua
local RUN_MODE = "ONE_ROW"
local ROW_TO_RUN = 2   -- set 2, then 3, ... up to 15
local START_COL = 1
local END_COL = nil
```

### 4C) Rows 1–15 with filler
```lua
local RUN_MODE = "ROWS_1_15"
```

### 4D) Row 16 with filler
```lua
local RUN_MODE = "ONE_ROW"
local ROW_TO_RUN = 16
local START_COL = 1
local END_COL = nil
```

### 4E) Rows 15–16 with filler
```lua
local RUN_MODE = "ROWS_RANGE"
local ROW_START = 15
local ROW_END = 16
```

### 4F) Rows 1–16 with filler
```lua
local RUN_MODE = "ROWS_RANGE"
local ROW_START = 1
local ROW_END = 16
```

---

## Recommended cleanup in your Combined Runner block (to avoid self-overwriting)

Right now you have this (problematic):

```lua
local RUN_MODE = "ONE_BOTTLE"
...
local RUN_MODE = "ROWS_RANGE"
```

✅ Keep **only one**:

```lua
local RUN_MODE = "ONE_BOTTLE"   -- or "ONE_ROW" / "ROWS_RANGE" / etc.
```

---

## Optional (recommended) toggle: “grip on/off” without commenting code

If you want your tests “without grip” vs “with grip” to be a **simple boolean**, add:

```lua
local DO_GRIP_CLOSE = false   -- set true when you want to actually grip
```

Then in `F.bottle_approach_grab()` change to:

```lua
if DO_GRIP_CLOSE then
  MoveGripper(1, par.grip_Close, par.lin_speed, 17, 5000, 0, 0, 0, 0, 0)
  WaitMs(par.gripper_wait_ms)
end
```

Now you can flip **only** `DO_GRIP_CLOSE` during Test 1A vs 1B, instead of editing function code.

---

## Notes for troubleshooting
- If you’re testing **motion only**, keep `DO_RETURN_RELEASE=false` so you don’t accidentally drop a bottle.
- Start slow: your current settings are already conservative:
  - bottle MoveL: `par.bottle_params.speed = 15`, `acc = 15`, `ovl = 30`
  - Lin moves: `par.lin_speed = 10`
