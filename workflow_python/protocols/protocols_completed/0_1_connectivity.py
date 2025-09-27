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


# Show all callable methods that start with "Get"
#methods = [m for m in dir(robot) if m.startswith('Get') and callable(getattr(robot, m))]
#for m in methods:
#    print(m)


if hasattr(robot, "ClearAlarm"):
    print("Clearing alarms…")
    robot.ClearAlarm()
    print("Safety code after ClearAlarm:", robot.GetSafetyCode())

print("ping")
print("pong")


robot.CloseRPC()
