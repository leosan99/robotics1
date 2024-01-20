function [qtau, qdottau] = cubic_poly_symbolic_2Rrobot(qin, vfin, Dq, T)
% function for a 2R robot with vin == 0 and vfin ~= 0

syms tau
qtau = qin + Dq*((vfin*T/Dq - 2)*tau^3 + (3 - vfin*T/Dq)*tau^2); 
qdottau = (Dq/T) * (3*(vfin*T/Dq - 2)*tau^2 + 2*(3 - vfin*T/Dq)*tau);
disp('qtau');
disp(qtau);
disp('qdottau');
disp(qdottau);
end