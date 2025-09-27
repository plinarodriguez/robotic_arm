P = {}

function P.home()
    name = 'home_initial' 
    return (name)
end


function P.convertPoint(x,y,z,rx,ry,rz,joint_seed)
    point = {x,y,z,rx,ry,rz}
    j1,j2,j3,j4,j5,j6 = GetInverseKin(0,point,joint_seed)
    return {j1,j2,j3,j4,j5,j6}
end 

return P