function [new_eq_vec2, eq_vec, q_sing] = davedet(A, noti, qus)
% this function computes all the minors of a rectangular matrix, in order
% to reduce the time used to compute a determinant.
% the function works only with rectangular matrices in which dimensions
% differ at maximum by two.
% inputs:
% A = matrix that you're studying
% noti = vector of symbolic values that are known, but not scalars. ex
% lenght of the links of a robot arm
% qus = vector of variable dofs
% outputs:
% new_ew_vec2 = equations of the minors of the matrix (det of
% undermatrices)
% eq_vec = equations not reduced by symtrue

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
    eq_vec = [eq_vec, simplify(det(MINORI{i}))];
end

% symtrue reduction
eq_vec2 = simplify(eq_vec);

% following two lines are removed because of not anymore equations but just
% determinants
% logical_index = (eq_vec2 == symtrue);
% new_eq_vec2 = eq_vec2(~logical_index);

semplification = ones(size(noti));
new_eq_vec2 = subs(eq_vec2, noti, semplification);

% solution of determinants. 
% does work only if you know already from which variables will depend the
% solution, you can use a trial and error method: change qus until reaching
% a solution, it will not display a solution otherwise
% q_sing = solve(eq_vec2, qus, 'Real', true);
end