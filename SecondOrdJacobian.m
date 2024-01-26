% function [J2] =SecondOrdJacobian(J, dofs)
% % dofs structure is a symbolic vector of the q1, q2, q3, ...
% for i = 1:numel(dofs)
%     [row, col] = size(J);
%     J2 = sym(zeros(row, col));
%     J2(:,i) = diff(J,dofs(i));
% end


function J2 = SecondOrdJacobian(J, variables)
% Compute the second-order derivative of a Jacobian matrix J with respect to symbolic variables

% Get the size of the Jacobian matrix
[numRows, numCols] = size(J);

% Initialize the second-order Jacobian matrix
J2 = sym(zeros(numRows, numCols));

% Compute the second-order derivatives
for i = 1:numel(variables)
    variable = variables(i);
    for j = 1:numRows
        for k = 1:numCols
            J2(j, k) = diff(diff(J(j, k), variable), variable);
        end
    end
end


