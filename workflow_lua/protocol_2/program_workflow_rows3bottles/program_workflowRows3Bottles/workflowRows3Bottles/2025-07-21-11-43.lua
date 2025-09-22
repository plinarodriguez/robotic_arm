loop1 = 0 
while (loop1 < 2) do
PTP(pHome,75,-1,0)
ActGripper(1,1)
MoveGripper(1,33,75,17,5000,0,0,0,0,0)
PTP(bottlepickUpBOX,25,-1,0)
MoveGripper(1,28,75,17,5000,0,0,0,0,0)
Lin(bottlepickUpBOX_pt2,25,-1,0,0)
Lin(boxbottle_pt3NEW,25,-1,0,0)
Lin(bottlepickUpBOX_pt4,10,-1,0,0)
WaitMs(3000)
Lin(boxbottle_pt3NEW,25,-1,0,0)
Lin(bottlepickUpBOX_pt2,25,-1,0,0)
Lin(bottlepickUpBOX,25,-1,0,0)
MoveGripper(1,30,75,17,5000,0,0,0,0,0)
Lin(bottlepickUpBOX_pt2,25,-1,0,0)
PTP(pHome,75,-1,0)
MoveGripper(1,100,75,17,5000,0,0,0,0,0)
ActGripper(1,0)
loop1 = loop1 + 1
end