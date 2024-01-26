function [r, th] = rotm2rth(rotm)
R = rotm;
r = zeros(3,2);
th = zeros(2,2);
% data rotm
% funzione che trova le due coppia (r,th)
% soluzione del problema inverso
sinthpos = 0.5*sqrt((R(1,2) - R(2,1))^2 + (R(1,3) - R(3,1))^2 + (R(2,3) - R(3,2))^2);
sinthneg = -sinthpos;
costh = (trace(R) - 1) / 2;
thpos = atan2(sinthpos * 2, costh * 2);
thneg = atan2(sinthneg * 2, costh * 2);

if thpos == 0 && thneg == 0
    % singular case
    fprintf('\n r non è definito, viene stampato come 500 \n');
    rpos = [500 500 500]';
    rneg = rpos;

elseif thpos == pi && thneg == -pi
    % singular case
    rx = sqrt((R(1,1) + 1) / 2);
    ry = sqrt((R(2,2) + 1) / 2);
    rz = sqrt((R(3,3) + 1) / 2);
    rpos = [rx, ry, rz]';
    rneg = -rpos;

    while 

else 
    % general case
    rxx = R(3,2) - R(2,3);
    ryy = R(1,3) - R(3,1);
    rzz = R(2,1) - R(1,2);
    rr = [rxx ryy rzz]';
    rpos = ((1 / (2 * sin(thpos))) * rr);
    rneg = -rpos;

end

r(:,1) = rpos;
r(:,2) = rneg;

th(:,1) = thpos;
th(:,2) = thneg;

end