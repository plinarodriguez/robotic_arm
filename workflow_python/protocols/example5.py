### Successful test!!! Only moves around the home position 

import Robot
import time
# Establish a connection with the robot controller and return a robot object if the connection is successful
robot = Robot.RPC('192.168.58.2')

# Move point
desc_initial  = [99.999,-195.001,370.661,169.561,89.557,76.324]  #[X,Y,Z,RX,RY,RZ]]
desc_right    = [124.997,-195.001,370.658,169.453,89.557,76.214]  #[X,Y,Z,RX,RY,RZ]] 
desc_left     = [74.998,-195.001,370.656,169.578,89.556,76.340]  #[X,Y,Z,RX,RY,RZ]]
desc_up       = [99.999,-195.001,394.994,169.619,89.556,76.382]  #[X,Y,Z,RX,RY,RZ]]
desc_down     = [99.999,-195.001,345.002,169.595,89.556,76.360]  #[X,Y,Z,RX,RY,RZ]]
desc_forward  = [99.999,-220.000,370.661,169.629,89.556,76.393]  #[X,Y,Z,RX,RY,RZ]]
desc_backward = [99.999,-170.002,370.661,169.625,89.557,76.388]  #[X,Y,Z,RX,RY,RZ]]

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

# Move Right 
rtn = robot.MoveL(desc_pos=desc_right, tool=tool, user=user, vel=vel, blendR=blendR)
print(f"movel errcode: {rtn}")
# time.sleep(1)

# Move Left
rtn = robot.MoveL(desc_pos=desc_left, tool=tool, user=user, vel=vel, blendR=blendR)
print(f"movel errcode: {rtn}")
# time.sleep(1)

# Move back to Home position
rtn = robot.MoveL(desc_pos=desc_initial, tool=tool, user=user, vel=vel, blendR=blendR)
print(f"movel errcode: {rtn}")
# time.sleep(1)

# Move Up
rtn = robot.MoveL(desc_pos=desc_up, tool=tool, user=user, vel=vel, blendR=blendR)
print(f"movel errcode: {rtn}")
print(f'MoveL Up')
# time.sleep(1)

# Move Down
rtn = robot.MoveL(desc_pos=desc_down, tool=tool, user=user, vel=vel, blendR=blendR)
print(f"movel errcode: {rtn}")
print(f'MoveL Down')
# time.sleep(1)

# Move back to Home position
print(f'MoveL Home')
rtn = robot.MoveL(desc_pos=desc_initial, tool=tool, user=user, vel=vel, blendR=blendR)
print(f"movel errcode: {rtn}")
# time.sleep(1)

# Move Forward
rtn = robot.MoveL(desc_pos=desc_forward, tool=tool, user=user, vel=vel, blendR=blendR)
print(f"movel errcode: {rtn}")
print(f'MoveL Forward')
# time.sleep(1)

# Move Backward
rtn = robot.MoveL(desc_pos=desc_backward, tool=tool, user=user, vel=vel, blendR=blendR)
print(f"movel errcode: {rtn}")
print(f'MoveL Backward')
# time.sleep(1)

# Move back to Home position
print(f'MoveL Home')
rtn = robot.MoveL(desc_pos=desc_initial, tool=tool, user=user, vel=vel, blendR=blendR)
print(f"movel errcode: {rtn}")
# time.sleep(1)

robot.CloseRPC()