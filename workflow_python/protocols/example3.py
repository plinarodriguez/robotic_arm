import Robot
# Establish a connection with the robot controller and return a robot object if the connection is successful
robot = Robot.RPC('192.168.58.2')
rtn,robotModel, webversion, controllerVersion = robot.GetSoftwareVersion()
print(f"Getsoftwareversion rtn is: {rtn}")
print(f"robotmodel is: {robotModel}, webversion is: {webversion}, controllerVersion is: {controllerVersion}\n")
rtn,ctrlBoxBoardversion, driver1version, driver2version,driver3version, driver4version, driver5version,driver6version, endBoardversion = robot.GetHardwareversion()
print(f"GetHardwareversion rtn is: {rtn}")
print(f"GetHardwareversion get hardware version is: {ctrlBoxBoardversion}, {driver1version}, {driver2version}, "
      f"{driver3version}, {driver4version}, {driver5version}, {driver6version}, {endBoardversion}\n")
rtn,ctrlBoxBoardversion, driver1version, driver2version,driver3version, driver4version, driver5version,driver6version, endBoardversion = robot.GetFirmwareVersion()
print(f"GetFirmwareversion rtn is: {rtn}")
print(f"GetFirmwareversion get firmware version is: {ctrlBoxBoardversion}, {driver1version}, {driver2version}, "
      f"{driver3version}, {driver4version}, {driver5version}, {driver6version}, {endBoardversion}\n")
robot.CloseRPC()