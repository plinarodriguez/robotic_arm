loop1 = 0 
while (loop1 < 3) do
PTP(pHome,75,-1,0)
ActGripper(1,1)
MoveGripper(1,75,75,17,5000,0,0,0,0,0) 
MoveGripper(1,50,75,17,5000,0,0,0,0,0)
MoveGripper(1,25,75,17,5000,0,0,0,0,0)
MoveGripper(1,100,75,17,5000,0,0,0,0,0)
ActGripper(1,0)
loop1 = loop1 + 1
end