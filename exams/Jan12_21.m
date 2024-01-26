%% Q6
clear;
clc;

syms a q1 q2 q3 q4 b
c = @(x) cos(x);
s = @(x) sin(x);

Jq = [-a*s(q1)-q3*s(q1+q2)-b*s(q1+q2+q4), -q3*s(q1+q2)-b*s(q1+q2+q4), c(q1+q2), -b*s(q1+q2+q4);
    a*c(q1)+q3*c(q1+q2)+b*c(q1+q2+q4), q3*c(q1+q2)+b*c(q1+q2+q4), s(q1+q2), b*c(q1+q2+q4);
    1, 1, 0, 1];

qs = [pi/2, 0];
Jqs = subs(Jq, [q2, q3], qs);
basis = null(Jqs);


%% Q7
clear;
clc;

syms q1 q2
c = @(x) cos(x);
s = @(x) sin(x);

Jq = [-s(q1)-s(q1+q2), -s(q1+q2);
    c(q1)+c(q1+q2), c(q1+q2)];

qa = [3*pi/4, -pi/2];
Jqa = subs(Jq,[q1, q2], qa);
fprintf('Jqa is: \n');
disp(Jqa);

F = 10.*[c(q1+q2); 
    s(q1+q2)];

Fa = subs(F, [q1, q2], qa);
fprintf('Fa is:\n');
disp(Fa);

tau = Jqa'*Fa;
fprintf('tau is: \n');
disp(tau);

%% Q8
clear;
clc;
% p_x=P_rv(1);p_y=P_rv(2);
% c2=(p_x^2+p_y^2-(l_1^2+l_2^2))/(2*l_1*l_2)
% s2=-sqrt(1-c2^2) % choose the minus sign to have the elbow-up solution as goal,
% % being this `closer' to the start configuration qs
% q2_g=atan2(s2,c2)
% q1_g=atan2(p_y*(l_1+l_2*c2)-p_x*l_2*s2,p_x*(l_1+l_2*c2)+p_y*l_2*s2)
q1 = [pi, 1.5495, 0, -0.4696];
q1in = pi;
q1fin = q1(2);
v1in = 0;
v1fin = q1(4);
q2in = 0;
q2fin = -1.0996;
v2in = 0;
v2fin = 0.1986;
T = 2;
Dq1 = -1.5921;
[q1tau, qdottau] = cubic_poly_symbolic(q1in, v1fin, Dq1, T);
[]
