%% Q1
clear all;
v = 1/sqrt(3) .* [1 1 1]';
v(4,1) = pi/3;
R_v = vrrotvec2mat(v);

y = [0 1 0]';
y(4,1) = -pi/3;
R_y = vrrotvec2mat(y);

Rf = R_y * R_v

%% Q2
clear all;
Ri = [0 0.5 -sqrt(3)/2; -1 0 0; 0 sqrt(3)/2 0.5];
Rf = eye(3);
rotm = Ri'*Rf;
a = rotm2eul(rotm, 'zyz') 

%% Q3