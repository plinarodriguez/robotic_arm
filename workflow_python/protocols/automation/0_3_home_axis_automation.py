#!/usr/bin/env python3
# Author: Paulina Rodriguez 09/08/2024 21:00:00 PM
# Description: Linear perturbation test around home (diff = 25 mm).
#              Uses MoveL to poke ±25 mm in X/Y/Z with fixed orientation to test linear movements.
#              Safety: cap with SetSpeed(10), keep vel/acc low.s

import Robot
import time

from params import tool,user,vel,blendR,speed 
from points import desc_initial,desc_right,desc_left,desc_forward,desc_backward,desc_up,desc_down

# Establish a connection with the robot controller and return a robot object if the connection is successful
robot = Robot.RPC('192.168.58.2')
 
# set the speed 
robot.SetSpeed(speed) #20)

# Set point order
positions       = [desc_right,desc_left,desc_forward,desc_backward,desc_up,desc_down]
positions_label = ['desc_right','desc_left','desc_forward','desc_backward','desc_up','desc_down']

#####################################################################
########################## Begin Movements ##########################
#####################################################################

# Start at Home Position 
rtn = robot.MoveL(desc_pos=desc_initial, tool=tool, user=user, vel=vel, blendR=blendR)
print(f"movel to point desc_initial, Errcode: {rtn}")

count = 1 # keep track of movements, started with home positin so count starts at 1
for p,name in zip(positions,positions_label): 
    rtn = robot.MoveL(desc_pos=p, tool=tool, user=user, vel=vel, blendR=blendR)
    print(f"movel to point {name}, Errcode: {rtn}")
    
    # Return to Home Position 
    rtn = robot.MoveL(desc_pos=desc_initial, tool=tool, user=user, vel=vel, blendR=blendR)
    print(f"movel to point desc_initial, Errcode: {rtn}")

    count +=2
print(f'Total linear movements = {count}')

robot.CloseRPC()


