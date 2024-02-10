function [BestJ, J_all] = ShowFormsJ(J,A)
% this function search for and computes the best form of J, if there is
% one. With best form is intended the one with more null rows/columns, in
% order to have an easier way to compute determinant.


numForms = length(A);
bestForm = 0; % Initialize the best form index
bestZeros = 0; % Initialize the count of rows/columns with all zeros
J_all = cell(numForms);
BestJ = 0;
R = 1;

for i = 1:numForms
    Ai = A{i};
    Rnow = Ai(1:3, 1:3);
    R = R*Rnow;

    % composition of the multiplication matrix for the jacobian
    M = blkdiag(R',R');
    J_transformed = M * J;
    J_transformed = simplify(J_transformed);

    J_all{i} = J_transformed;
    
    % Count the number of rows with all zeros in the transformed Jacobian
    zerosInRows = sum(all(J_transformed == 0, 2));

    % Count the number of columns with all zeros in the transformed Jacobian
    zerosInCols = sum(all(J_transformed == 0, 1));

    % Update the best form index if the current form has more all-zero rows/columns
    if zerosInRows > bestZeros || zerosInCols > bestZeros
        BestJ = J_transformed;
        fprintf('best form is the one multiplied by R%d transposed \n', i)
        bestZeros = max(zerosInRows, zerosInCols);
    end
end

if BestJ == 0
    fprintf('There is not a best form \n')
end

end