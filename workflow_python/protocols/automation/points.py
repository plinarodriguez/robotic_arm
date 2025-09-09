# This file has the home point and all the new points created for the test 

xhome  =  100.0
yhome  = -195.0
zhome  =  371.0
rxhome =  170.0
ryhome =   90.0
rzhome =   76.0

diff_mm = 25.0

desc_initial  = [xhome,yhome,zhome,rxhome,ryhome,rzhome]
desc_right    = [xhome+diff_mm,yhome,zhome,rxhome,ryhome,rzhome]
desc_left     = [xhome-diff_mm,yhome,zhome,rxhome,ryhome,rzhome]
desc_forward  = [xhome,yhome-diff_mm,zhome,rxhome,ryhome,rzhome]
desc_backward = [xhome,yhome+diff_mm,zhome,rxhome,ryhome,rzhome]
desc_up       = [xhome,yhome,zhome+diff_mm,rxhome,ryhome,rzhome]
desc_down     = [xhome,yhome,zhome-diff_mm,rxhome,ryhome,rzhome]