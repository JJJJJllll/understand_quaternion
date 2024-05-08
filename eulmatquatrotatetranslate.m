% 1、平面坐标系w平移[1,0,0]、绕z轴顺时针旋转45°、成为w'
eul = [-45, 0, 0]
Rwwapos = [sqrt(2)/2,  sqrt(2)/2, 0;
           -sqrt(2)/2, sqrt(2)/2, 0;
           0,         0,          1] % w基在w'下坐标
q = [cos(-pi/8), sin(-pi/8)*[0,0,1]] % 轴角转四元数
quat2rotm(q)
quat2eul(q) * 180 / pi

% 2、四元数实现点的坐标变换
pwapos = [0; 1; 0] % in w'
t = [1;0;0]
pw = quatmultiply(q, quatmultiply([0; pwapos]', quatinv(q))) + [0;t]' % in w

% 3、SE3实现点的坐标变换
p = [quat2rotm(q), t;
     zeros(1,3),   1] * [pwapos;1]
