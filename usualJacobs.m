%% 2R robot
clear;
clc;

syms q1 q2
c = @(x) cos(x);
s = @(x) sin(x);

Jq = [-s(q1)-s(q1+q2), -s(q1+q2);
    c(q1)+c(q1+q2), c(q1+q2)];

%% 3R+1P robot
clear;
clc;

syms a q1 q2 q3 q4 b
c = @(x) cos(x);
s = @(x) sin(x);

Jq = [-a*s(q1)-q3*s(q1+q2)-b*s(q1+q2+q4), -q3*s(q1+q2)-b*s(q1+q2+q4), c(q1+q2), -b*s(q1+q2+q4);
    a*c(q1)+q3*c(q1+q2)+b*c(q1+q2+q4), q3*c(q1+q2)+b*c(q1+q2+q4), s(q1+q2), b*c(q1+q2+q4);
    1, 1, 0, 1];

%% 3R robot
syms q1 q2 q3
qv = [q1 q2 q3];

% Position Vector
p = [cos(q1)+cos(q1+q2)+cos(q1+q2+q3);
    sin(q1)+sin(q1+q2)+sin(q1+q2+q3)];

% Jacobian
Jq = jacobian(p,qv)