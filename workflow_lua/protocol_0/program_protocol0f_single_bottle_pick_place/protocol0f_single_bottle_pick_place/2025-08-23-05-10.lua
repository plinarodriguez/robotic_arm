loop1 = 0 
while (loop1 < 3) do
Lin(home_initial,50,-1,0,0)
Lin(single_bottle_rotate45,25,-1,0,0)
ActGripper(1,1)
MoveGripper(1,20,75,17,5000,0,0,0,0,0)
Lin(single_bottle_approach,25,-1,0,0)
Lin(single_bottle_grab,25,-1,0,0)
MoveGripper(1,0,75,17,5000,0,0,0,0,0)
Lin(single_bottle_approach,25,-1,0,0)
Lin(single_bottle_grab,25,-1,0,0)
MoveGripper(1,20,75,17,5000,0,0,0,0,0)
Lin(single_bottle_approach,25,-1,0,0)
Lin(home_initial,25,-1,0,0)
MoveGripper(1,100,75,17,5000,0,0,0,0,0)
ActGripper(1,0)
loop1 = loop1 + 1
end