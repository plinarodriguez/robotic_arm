import Robot

# Establish a connection with the robot controller and return a robot object if the connection is successful
robot = Robot.RPC('192.168.58.2')

config=-1
config = int(config)

# Home Point Location 
desc_pos = [99.999, -195.001, 370.661,169.561, 89.557, 76.3249]
print(f'desc_pos={desc_pos}, length = {len(desc_pos)}, type = {type(desc_pos)}')
# Format point location to list of floats
desc_pos = list(map(float, desc_pos))
print(f'desc_pos={desc_pos}, length = {len(desc_pos)}, type = {type(desc_pos)}')

#default joint
joint_pos=[0,0,0,0,0,0]
print(f'join_pos={joint_pos}, length = {len(joint_pos)}, type = {type(joint_pos)}')

# if default position is used then convert to the cartesian coordinates to joint coordinates 
if ((joint_pos[0] == 0.0) and (joint_pos[1] == 0.0) and (joint_pos[2] == 0.0) and (joint_pos[3] == 0.0)
                and (joint_pos[4] == 0.0) and (joint_pos[5] == 0.0)):
	print(f'condition is met!!!!')    
	# Convert Cartesian to Joint Posisions
	ret = robot.GetInverseKin(0, desc_pos, config)  

	if ret[0] == 0:
		print(f'ret[0]:{ret[0]},ret[1]:{ret[1]}') #,ret[2]:{ret[2]},ret[3]:{ret[3]},ret[4]:{ret[4]},ret[5]:{ret[5]}')
		# Replace default joint coordinates
		joint_pos = ret[1] #[ret[1][0],ret[1][1], ret[1][2], ret[1][3], ret[1][4], ret[1][5]]
		print(f'error condition is NOT met!!!!')
	else:
		error1 = ret[0]
		print(f'error condition is met!!!!')

# resulting points and joints 
print(f'desc_pos={desc_pos}, length = {len(desc_pos)}, type = {type(desc_pos)}')
print(f'join_pos={joint_pos}, length = {len(joint_pos)}, type = {type(joint_pos)}')


# Possible error1 rewrites!!!!

# error1 = self.robot.MoveL([joint_pos[0],joint_pos[1],joint_pos[2],joint_pos[3],joint_pos[4],joint_pos[5], desc_pos[0],desc_pos[1],desc_pos[2],desc_pos[3],desc_pos[4],desc_pos[5], tool, user, vel, acc, ovl, blendR, blendMode, exaxis_pos[0],exaxis_pos[1],exaxis_pos[2],exaxis_pos[3], search,offset_flag, offset_pos[0],offset_pos[1],offset_pos[2],offset_pos[3],offset_pos[4],offset_pos[5],100.0,velAccParamMode])

# error1 = self.robot.MoveL([desc_pos[0],desc_pos[1],desc_pos[2],desc_pos[3],desc_pos[4],desc_pos[5]], tool, user,[joint_pos[0],joint_pos[1],joint_pos[2],joint_pos[3],joint_pos[4],joint_pos[5]],vel, acc, ovl, blendR, blendMode, [exaxis_pos[0],exaxis_pos[1],exaxis_pos[2],exaxis_pos[3]], search,offset_flag, [offset_pos[0],offset_pos[1],offset_pos[2],offset_pos[3],offset_pos[4],offset_pos[5]],100.0,velAccParamMode)


# ([desc_pos[0], desc_pos[1], desc_pos[2], desc_pos[3], desc_pos[4], desc_pos[5]],tool,user,vel,acc,ovl,bledR,blendMode,search,offset_flag,config,velAccParamMode)


#  MoveL(self, desc_pos, tool, user, joint_pos=[0.0, 0.0, 0.0, 0.0, 0.0, 0.0], vel=20.0, acc=0.0, ovl=100.0,
#               blendR=-1.0, blendMode = 0,exaxis_pos=[0.0, 0.0, 0.0, 0.0], search=0, offset_flag=0,
#               offset_pos=[0.0, 0.0, 0.0, 0.0, 0.0, 0.0],config=-1,velAccParamMode=0,overSpeedStrategy=0,speedPercent=10):
        