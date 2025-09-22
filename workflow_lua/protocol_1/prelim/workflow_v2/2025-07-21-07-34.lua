loop1 = 0 
while (loop1 < 1) do
PTP(pHome,75,-1,0)
ActGripper(1,1)
MoveGripper(1,33,75,17,5000,0,0,0,0,0)
PTP(bottlepickUp,25,-1,0)
MoveGripper(1,28,75,17,5000,0,0,0,0,0)
Lin(point2GRIPPERTESTCorrect,75,-1,0,0)
Lin(Pt1GRIPTEST,75,-1,0,0)
WaitMs(3000)
Lin(point2GRIPPERTESTCorrect,75,-1,0,0)
MoveGripper(1,30,75,17,5000,0,0,0,0,0)
PTP(Pt1GRIPTEST,75,-1,0)
PTP(pHome,75,-1,0)
MoveGripper(1,100,75,17,5000,0,0,0,0,0)
ActGripper(1,0)
loop1 = loop1 + 1
end