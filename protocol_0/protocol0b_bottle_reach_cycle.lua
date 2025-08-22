loop1 = 0 
while (loop1 < 3) do
PTP(pHome,75,-1,0)
ActGripper(1,1)
MoveGripper(1,33,75,17,5000,0,0,0,0,0) 
Lin(single_bottle_approach,75,-1,0)
Lin(single_bottle_grasp,75,-1,0)
Lin(single_bottle_approach,75,-1,0)
PTP(pHome,75,-1,0)
MoveGripper(1,100,75,17,5000,0,0,0,0,0)
ActGripper(1,0)
loop1 = loop1 + 1
end