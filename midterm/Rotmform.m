%% FORMA DELLE MATRICI DI ROTAZIONE
%
% notazione compatta:
%      cth = cos(th)
%      sth = sin(th)
% oppure:
%      c1 = cos(alfa1);
%      s1 = sin(alfa1);
%
% rotazione di un angolo th
%
%% DATE R_i e R_f di posizione trovare Rotm
%
% Rotm = R_i' * R_f;
%  nota: R_i è trasposta
%
%% ROTAZIONE ATTORNO x
%
% R_x = [1 0 0; 0 cth sth; o -sth cth];
%
%% ROTAZIONE ATTORNO y
%
% R_y = [cth 0 sth; 0 1 0; -sth 0 cth];
%
%% ROTAZIONE ATTORNO z
% 
% R_z = [cth sth 0; -sth cth 0; 0 0 1];
%
%% ROTAZIONE YXY
% rispettivamente di tre angoli 1,2,3
% 
% R_yxy = [c1c3-s1c2s3 , s1s2, c1s3+s1c2c3;
%          s2s3        , c2  , -s2c3      ;
%          -s1c3-c1c2s3, c1s2, c1c2c3-s1s3]
%
% ==> s2 = sqrt(R_yxy(1,2)^2 + R_yxy(3,2)^2);
% nota: ottenuto dalla relazione tra cos e sin 
% visti gli elementi della matrice
%
%% ROTAZIONE ZYZ
% R_zyz = [c1c2c3-s1s3, -c1c2s3-s1c3, c1s2;
%          s1c2c3+c1s3, c1c3-s1c2s3 , s1s2;
%          -s2c3      , s2s3        , c2  ]
% 
% ==> s2 = sqrt(R_zyz(3,1)^2 + R_zyz(3,2)^2);
%
%% MOLTIPLICAZIONE DI MATRICI DI ROTAZIONE
% esempio: rotazione attorno y di pi/3 poi attorno z di pi/3
%  ==> Rfinale = Rz * Ry;
%      e non Ry * RZ!
%
%%