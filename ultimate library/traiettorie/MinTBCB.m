function [Tmin] = MinTBCB(Amax, Vmax, L)
% this function applies time law for BANG-COAST-BANG profile in order to
% compute minimum time for REST-TO-REST motion.
% inputs:
%        Amax = maximum acceleration given by boundary
%        Vmax = maximum velocity given by boundary
%        L = distance the robot needs to complete
% output:
%        Tmin = minimum time for rest-to-rest motion

Tmin = (L*Amax + Vmax^2)/(Amax*Vmax);
end