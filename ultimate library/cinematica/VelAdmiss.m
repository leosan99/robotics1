function [r] = VelAdmiss(J, v)
% this functions computes the admissability of a velocity given the
% jacobian
% in fact if the jacobian has the same rank as the product of J and v, then
% v it implies that the velocity vector V​ is within the space spanned by the
% Jacobian. Mathematically, this means V​ can be achieved given the robot's
% current configuration and its constraints.
% inputs: 
% - v = vector of velocity that must be analized.
% - J = jacobian
% output:
% - rank = rank of the product

Jup = [J v];
r = rank(Jup);
val = rank(J);

if val == r
    fprintf('Velocity [')
    fprintf(' %d', v)
    fprintf('] is admissable\n');
    fprintf('The augmentation [J v] has rank %d equal to the rank of J %d', r, val);
elseif val ~= r
    fprintf('Velocity [')
    fprintf(' %d', v)
    fprintf('] is NOT admissable\n');
    fprintf('The augmentation [J v] has rank %d NOT equal to the rank of J %d', r, val);
end

end