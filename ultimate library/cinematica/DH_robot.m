classdef DH_robot
    properties       
        p %end effector position
        %phi % orientation end effector
        dhtable
        T
        A
        f_r_4D
        f_r
        params
        J
        Jl
        Ja
        geometricJ
        sequence
    end
    
    methods
        function self = DH_robot(dhtable, var)
            % DH table parameters
            self.dhtable=dhtable;
            n_dof = size(dhtable, 1);
            fprintf('dhtable format: [alpha a d theta] \n');

            % Transformation and homogeneous matrices
            [self.T, self.A] = DHMatrix(self.dhtable);

            % f_r & p
            self.f_r_4D = get_f_r(self.T); %(X Y Z PHI);
            self.p = affine_get_translation(self.T); %[f_r_4D(1); f_r_4D(2); f_r_4D(3)];
            self.f_r = self.f_r_4D(1:length(self.f_r_4D)-1);

            % jacobian
            fprintf('jacobian variable are set: \n');
            disp(var);
            self.J = simplify(jacobian(self.p, var));

            % geometric jacobian
            sequence = [];
            for i = 1:n_dof
                if dhtable(i,4) == var(i)
                    sequence = [sequence, 'r'];
                elseif dhtable(i,3) == var(i)
                    sequence = [sequence, 'p'];
                else
                    fprintf('problem in the dhmatrix structure, check\n');
                end
            end
            self.sequence = sequence;
            [Jl, Ja] = geometric_jacobian(self.f_r, sequence, var, dhtable);
            self.Jl = simplify(Jl);
            self.Ja = simplify(Ja);
            self.geometricJ = [Jl; Ja]; % geometric jacobian found

            % parameters array build
            params = cell(1, n_dof);
            for i = 1:n_dof
                params{i} = dhtable(i,:);
            end
            self.params = params;

            %self.phi = f_r_4D(4);
        end
    end
end