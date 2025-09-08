# Problems 
This includes a list of challenges and problems that I encountered and solved. 

- Python environment required: This is part of a new python requirement 
- use python3 or python 3.11 to run python commands
- In order to install the fairino python SDK you need to download the files and enter the directory that has the `setup.py` file. This is what's needed to begin the install 
- When running python scripts you don't need `from fairino import Robot` only the `import Robot ` since the setup.py file is next to the robot.py and there isn't a directory separation with fairino at the highest level. 

## Signficant Install Error
**Description:** when I tried to use the `robot.moveL(point)` the `point` although in the correct format was not being read in. In fact some of the errors showed tha the type was wrong (string variable name), the length was wrong (1 entered with 12 expected) while only 6 list item points were required (x,y,z,rx,ry,rz). The `moveL` function takes in points in the cartesian format but it needs to convert them to joint points. So it has a function `GetInverseKin(0, desc_pos, config)` that takes cartesian points and converts them to joint points. Note that the output of this function is `error, [_error[1], _error[2], _error[3], _error[4], _error[5], _error[6]]`. These values are then stored to a variable `ret`.

**Find Problem:** Turns out there was an error in the installed function `moveL()` cartesian to joint conversion. 

**Troubleshoot:** So I copied the parts of the function causing the problem to `protocols/test_moveL_problem` with the conditions that were causing the problem. With a ton of print statements I found the problem. The function currently assumes that `ret` has 7 elements `ret[0]=0` and `ret[1]` through `ret[6]`. But there are only two items in `ret`: `ret[0]=0` only has one element and `ret[1]` which has 6 elements also known as all 6 joint points!!!!! So when the `moveL` function (incorrectly) runs through: 
`joint_pos = [ret[1], ret[2], ret[3], ret[4], ret[5], ret[6]]`
there aren't enough ret elements to generate this list. 

**Solution:** A possible solution is to change `joint_pos` to `joint_pos = [ret[1][0],ret[1][1],ret[1][2],ret[1][3],ret[1][4],ret[1][5]]` or `joint_pos=ret[1]` which is consistent with the output of `GetInverseKin()`. This change requires a significant function changes to an install file. In future installs make sure that this is fixed!!!!! I also check against a known home point for the joint conversion and it's correct. 