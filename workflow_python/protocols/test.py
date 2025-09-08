# Confirm this really is an XML-RPC proxy
print(self.robot)  # should look like <ServerProxy for 192.168.58.2:20003/RPC2>

# List available methods
print(self.robot.system.listMethods())

# Get help text (often includes param names/order)
print(self.robot.system.methodHelp('MoveL'))

# Get the type signature(s)
print(self.robot.system.methodSignature('MoveL'))

