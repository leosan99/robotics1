function [R_eul] = EulToRotMatrix(eul)
% in radianti

phi = eul(1);
th = eul(2);
psi = eul(3);

R_eul = eul2rotm(eul);

end