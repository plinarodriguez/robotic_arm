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

### This problem continued
Turns of the problem was not that. But instead the problem was with the formatting of all the function items. In particular it was the followin: 

`error1 = self.robot.MoveL([joint_pos[0],joint_pos[1],joint_pos[2],joint_pos[3],joint_pos[4],joint_pos[5]],[desc_pos[0], desc_pos[1], desc_pos[2], desc_pos[3], desc_pos[4], desc_pos[5]],tool,user,vel,acc,ovl,blendR,[exaxis_pos[0],exaxis_pos[1],exaxis_pos[2],exaxis_pos[3]],blendMode,search,[offset_pos[0],offset_pos[1],offset_pos[2],offset_pos[3],offset_pos[4],offset_pos[5]])`

This was not formatted in the code and it was being read in as one element. But in fact it needs 12! finding the correct formatting was a pain but in the end it worked. 


This is the working code 

``def MoveL(self, desc_pos, tool, user, joint_pos=[0.0, 0.0, 0.0, 0.0, 0.0, 0.0], vel=20.0, acc=0.0, ovl=100.0,
              blendR=-1.0, blendMode = 0,exaxis_pos=[0.0, 0.0, 0.0, 0.0], search=0, offset_flag=0,
              offset_pos=[0.0, 0.0, 0.0, 0.0, 0.0, 0.0],config=-1,velAccParamMode=0,overSpeedStrategy=0,speedPercent=10):
        while self.reconnect_flag:
            time.sleep(0.1)
        if self.GetSafetyCode() != 0:
            return self.GetSafetyCode()
        desc_pos = list(map(float, desc_pos))
        tool = int(tool)
        user = int(user)
        joint_pos = list(map(float, joint_pos))
        vel = float(vel)
        acc = float(acc)
        ovl = float(ovl)
        blendR = float(blendR)
        blendMode = int(blendMode)
        exaxis_pos = list(map(float, exaxis_pos))
        search = int(search)
        offset_flag = int(offset_flag)
        offset_pos = list(map(float, offset_pos))
        config = int(config)
        velAccParamMode = int(velAccParamMode)
        overSpeedStrategy = int(overSpeedStrategy)
        speedPercent = int(speedPercent)
        if (overSpeedStrategy > 0):
            error = self.robot.JointOverSpeedProtectStart(overSpeedStrategy, speedPercent)
            if error!=0:
                return error
            
        # print(f'desc_pos={desc_pos}, length = {len(desc_pos)}, type = {type(desc_pos)}')
        # print(f'joint_pos={joint_pos}, length = {len(joint_pos)}, type = {type(joint_pos)}')
        if ((joint_pos[0] == 0.0) and (joint_pos[1] == 0.0) and (joint_pos[2] == 0.0) and (joint_pos[3] == 0.0)
                and (joint_pos[4] == 0.0) and (joint_pos[5] == 0.0)):  # 若未输入参数则调用逆运动学求解
            # print(f'condition is met!!!!')    
            ret = self.robot.GetInverseKin(0, desc_pos, config)  # 逆运动学求解
            if ret[0] == 0:
                # print(f'ret[0]:{ret[0]},ret[1]:{ret[1]},ret[2]:{ret[2]},ret[3]:{ret[3]},ret[4]:{ret[4]},ret[5]:{ret[5]}') 
                joint_pos = [ret[1], ret[2], ret[3], ret[4], ret[5], ret[6]]
                # print(f'joint_pos={joint_pos}, length = {len(joint_pos)}, type = {type(joint_pos)}')
                # print(f'error condition is NOT met!!!!')
            else:
                error1 = ret[0]
                # print(f'error condition is met!!!!')
                return error1

        flag = True
        while flag:
            try:
                # print('try flag test')
                error1 = self.robot.MoveL([joint_pos[0],joint_pos[1],joint_pos[2],joint_pos[3],joint_pos[4],joint_pos[5]],[desc_pos[0], desc_pos[1], desc_pos[2], desc_pos[3], desc_pos[4], desc_pos[5]],tool,user,vel,acc,ovl,blendR,[exaxis_pos[0],exaxis_pos[1],exaxis_pos[2],exaxis_pos[3]],blendMode,search,[offset_pos[0],offset_pos[1],offset_pos[2],offset_pos[3],offset_pos[4],offset_pos[5]])
                # error1 = self.robot.MoveL([joint_pos[0],joint_pos[1],joint_pos[2],joint_pos[3],joint_pos[4],joint_pos[5], desc_pos[0],desc_pos[1],desc_pos[2],desc_pos[3],desc_pos[4],desc_pos[5], tool, user, vel, acc, ovl, blendR, blendMode, exaxis_pos[0],exaxis_pos[1],exaxis_pos[2],exaxis_pos[3], search,offset_flag, offset_pos[0],offset_pos[1],offset_pos[2],offset_pos[3],offset_pos[4],offset_pos[5],100.0,velAccParamMode])
                # print(f'error1: {error1}')
                flag = False
            except socket.error as e:
                flag = True
            # print(f'try flag test and flag={flag}')


        if (overSpeedStrategy > 0):
            error = self.robot.JointOverSpeedProtectEnd()
            if error!=0:
                return error

        return error1 ``