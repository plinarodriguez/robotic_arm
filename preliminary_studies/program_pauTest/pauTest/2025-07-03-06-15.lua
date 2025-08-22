loop1 = 0 
while (loop1 < 1) do
PTP(pHome,75,-1,0)
ActGripper(1,1)
ActGripper(1,0)
PTP(Pt1GRIPTEST,75,-1,0)
PTP(point2GRIPPERTESTCorrect,75,-1,0)
ActGripper(1,1)
MoveGripper(1,28,25,17,5000,0,0,0,0,0)
PTP(Pt1GRIPTEST,75,-1,0)
WaitMs(3000)
PTP(point2GRIPPERTESTCorrect,75,-1,0)
MoveGripper(1,100,25,17,5000,0,0,0,0,0)
ActGripper(1,0)
PTP(Pt1GRIPTEST,75,-1,0)
PTP(pHome,75,-1,0)
loop1 = loop1 + 1
end