%% Q1
clear all;
clc;
alfa = pi/4;
beta = - pi/3;
z = [0 0 1 alfa]';
Ral = vrrotvec2mat(z);
y = [0 1 0]';
ynew = Ral * y;
ynew(4,1) = beta;
Rbe = vrrotvec2mat(ynew);
Rf = Ral * Rbe;
[phi, theta, psi] = rpy_rotation_inverse('zyx', Rf);

%% Q2
clear all;
clc;
gam = -pi/2;
del = pi/3;
x = [1 0 0]';
v = [1/sqrt(2) -1/sqrt(2) 0]';
x(4,1) = gam;
v(4,1) = del;
Rdel = vrrotvec2mat(v);
Rgam = vrrotvec2mat(x);
R = Rgam * Rdel;
v = vrrotmat2vec(R)

%%  Q4  
clear all;
clc;
q1 = pi/2;
c1 = cos(q1);
s1 = sin(q1);
q2 = -pi/2;
c2 = cos(q2);
s2 = sin(q2);
a1 = 0.5;
c12 = cos(q1+q2);
s12 = sin(q1+q2);
l1 = 0.5;
l2 = 0.6;

A1 = [c1 -s1 0 a1*c1; s1 c1 0 a1*s1; 0 0 1 0; 0 0 0 1];
A2 = [c12 -s12 0 l1*c1+l2*c12; s12 c12 0 l1*s1+l2*s12; 0 0 1 0; 0 0 0 1];
T = A1*A2;