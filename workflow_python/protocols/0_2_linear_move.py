### Successful test!!! Only moves around the home position 

import Robot
import time
# Establish a connection with the robot controller and return a robot object if the connection is successful
robot = Robot.RPC('192.168.58.2')

m = 5
# Move point
desc_initial = [99.999,-195.001,370.661,169.561,89.557,76.324]  #[X,Y,Z,RX,RY,RZ]]
desc_pt2 = [99.999+m,-195.001+m,370.661+m,169.561,89.557,76.324]  #[X,Y,Z,RX,RY,RZ]]

# Move conditions 
offset_pos = [0, 0, 0, 0, 0, 0]
epos = [0, 0, 0, 0]
tool = 0
user = 0
vel = 20.0
acc = 20.0
ovl = 1.0
blendT = 0.0
blendR = 0.0
flag = 0
search = 0
robot.SetSpeed(10) #20)

# Move to Home Position 
rtn = robot.MoveL(desc_pos=desc_initial, tool=tool, user=user, vel=vel, blendR=blendR)
print(f"movel errcode: {rtn}")

# Move to Pt 2 + 5mm in each direction
rtn = robot.MoveL(desc_pos=desc_pt2, tool=tool, user=user, vel=vel, blendR=blendR)
print(f"movel errcode: {rtn}")

# Move back to Home Position 
rtn = robot.MoveL(desc_pos=desc_initial, tool=tool, user=user, vel=vel, blendR=blendR)
print(f"movel errcode: {rtn}")