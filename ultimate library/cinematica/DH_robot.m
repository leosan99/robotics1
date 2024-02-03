classdef DH_robot
    properties       
        p %end effector position
        %phi % orientation end effector
        dhtable
        T
        A
        f_r_4D
        params
    end
    
    methods
        function self = DH_robot(dhtable)
            self.dhtable=dhtable;
            [self.T, self.A] = DHMatrix(self.dhtable);
            n = size(dhtable, 1);
            params = cell(1, n);
            for i = 1:n
                params{i} = dhtable(i,:);
            end
            self.params = params;
            self.f_r_4D = get_f_r(self.T); %(X Y Z PHI);

            self.p = affine_get_translation(self.T); %[f_r_4D(1); f_r_4D(2); f_r_4D(3)];
            %self.phi = f_r_4D(4);

        end
    end
end