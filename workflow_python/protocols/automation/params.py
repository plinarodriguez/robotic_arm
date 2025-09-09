# These are the necessary parameters to configure the robot to move 

offset_pos = [0, 0, 0, 0, 0, 0] # Cartesian offset [dx,dy,dz,rx,ry,rz], mm & degrees, 0 unless a taught offset is needed 
epos = [0, 0, 0, 0]             # Positions for up to four external axes, set to 0 unless you have a rail/turntable  
tool = 0                        # Required, ID of the TCP/tool frame (0-14), set to 0 unless a custom TCP is used. 
user = 0                        # Required, ID of the workpiece/user frame (0-14), set to 0 which means base/world 
vel = 20.0                      # per command speed setpoint in percent (0-100) - not mm/s; default=20%
acc = 20.0                      # acceleration in percent, often ignored, safe to leave as default(#qty?))
ovl = 1.0                       # per command velocity scaling factor in perent (0-100),extra multiplier ontop of vel, 100 default 
blendT = 0.0                    # blending (non-stop) motion, used for MoveJ, default = -1, 
blendR = 0.0                    # blending (non-stop) motion, used for MoveL, default = -1 stops at the waypoint. 
flag = 0                        # set to 0 unless using a search move
search = 0                      # set to 0 unless using a search move
speed = 10                      # global speed cap (percent) for the whole controller


# Note: the whole Python SDK uses mm/°
# Add math calculation for relationship: speed, vel, ovl 