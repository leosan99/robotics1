function [det] = dett(A)
% determinant of a non-squared matrix trough the method of the minors
% analysis
% The aim of this function is to compute all the symbolic minors of 
% the input non-squared matrix and return the value that brings them all to
% zero.
% we return also an array of the determinants in order to have a check on
% the consistency of the function.

% allocation of determinants and variables
dets = [];
[n,m] = size(A);

if n > m % non-squared for a rows excess
    k = n-m;
    for i = 1:n
        if k == 0
            submatrix = A;
            submatrix(i, :) = []; % Remove row i
            determinant = det(submatrix);
            dets = [dets; determinant];
            
        elseif k ~= 0
            for j = 1:k
                submatrix = A;
                submatrix(i, :) = [];
elseif m > n% non-squared for a columns excess

end
for i = 1:size(A, 1)
    for j = 1:size(A, 2)
        submatrix = A;
        submatrix(i, :) = []; % Remove row i
        submatrix(:, j) = []; % Remove column j
        determinant = det(submatrix);
        dets = [dets; determinant];
    end
end

% Check for values that make the matrix singular
singular_values = solve(dets == 0, [x, y, z]);


end