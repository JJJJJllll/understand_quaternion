p = [1,0,1]
u = [0,1,0]
a = pi/2

% 1. build quat
point = quaternion(0,p(1),p(2),p(3))

q = quaternion(cos(a/2),u(1)*sin(a/2),u(2)*sin(a/2),u(3)*sin(a/2))

qinv = conj(q)

q*point*qinv

% 2. use list as quat (more clear)
quatmultiply([cos(a/2),u*sin(a/2)],quatmultiply([0,p],[cos(a/2),-u*sin(a/2)]))