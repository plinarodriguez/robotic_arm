from Robot import RPC
import time

# Connect to the robotic arm
robot= RPC('192.168.58.2')

# Check if connection is established
if robot:
	print(f'Connected to 192.168.58.2: robot={robot}')
else:
	print(f'Failed to connect to 192.168.58.2: robot={robot}')

# Get SDK Version
error,version = robot.GetSDKVersion()
print(f"SDK version: {version}")
# Get the Robot IP address
error,ip = robot.GetControllerIP()
print(f"controller ip: {ip}")

#Robot hand-automatic mode switching
ret = robot.Mode(0) #Robot cuts to autorun mode
print("Robot cut into autorun mode", ret)
time.sleep(1)
ret = robot.Mode(1) #Robot cut to manual mode
print("Robot cut to manual mode", ret)


# Robot enters or exits drag-and-drop instructional mode
ret = robot.Mode(1) #Robot cut to manual mode
print("Robot cut to manual mode", ret)
time.sleep(1)
ret = robot.DragTeachSwitch(1) #Robot cuts to drag teach mode, must be in manual mode to cut to drag teach mode
print("Robot cut to drag-and-drop instructional mode", ret)
time.sleep(1)
ret,state = robot.IsInDragTeach() #query if in drag teach mode, 1-drag teach mode, 0-non-drag teach mode
if ret == 0:
    print("Current drag mode state:", state)
else:
    print("Query failed with error code:",ret)
time.sleep(3)
ret = robot.DragTeachSwitch(0) # robot cuts to non-drag teach mode, must be in manual mode to cut to non-drag teach mode
print("Robot cut to non-drag instructional mode", ret)
time.sleep(1)
ret,state = robot.IsInDragTeach() #query if in drag teach mode, 1-drag teach mode, 0-non-drag teach mode
if ret == 0:
    print("Current drag mode state:", state)
else:
    print("Query failed with error code:",ret)


# Robot up-enable or down-enable
ret = robot.RobotEnable(0) # robot down enable
print("Enabling under robot", ret)
time.sleep(3)
ret = robot.RobotEnable(1) #RobotEnable, robot is automatically enabled by default after power up
print("Enabling on robot", ret)

robot.CloseRPC()