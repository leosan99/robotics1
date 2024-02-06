clear all
close all
clc

syms q1 q2 q3 q4 a1 a2 a3 a4 real
variables = [q1 q2 q3 q4];
A = [a1*sin(q2), 0, -(a3*sin(q3) + a4*sin(q3+q4)), -a4*sin(q3+q4);
     0, 0, a3*cos(q3) + a4*cos(q3+q4), a4*cos(q3+q4);
     -(a1*cos(q2) + a3*cos(q3) + a4*cos(q3+q4)), -(a3*cos(q3) + a4*cos(q3+q4)), 0, 0;
     0,0,0,0;
     1,1,0,0;
     0,0,1,1];



S = size(A);
r = A(1); c = A(2);

[N, i] = min(S);
iLoop = 1;
if i == 1
    iLoop = 2;
end

comb = nchoosek(1:S(iLoop), max(S) - min(S));
Nmat = size(comb, 1);

MINORI = cell(Nmat, 1);

for i = 1:Nmat
    c = linspace(1, S(iLoop), S(iLoop));
    c(comb(i, :)) = [];
    if iLoop == 1
        MINORI{i} = A(c, :);
    else
        MINORI{i} = A(:, c);
    end
end

eq_vec = [];

for i = 1:Nmat
    eq_vec = [eq_vec, det(MINORI{i}) == 0];
end
eq_vec2 = simplify(eq_vec);
logical_index = (eq_vec2 == symtrue);
new_eq_vec2 = eq_vec2(~logical_index);
semplification = [1 1 1 1];
noti = [a1 a2 a3 a4];
new_eq_vec2 = subs(new_eq_vec2, noti, semplification)