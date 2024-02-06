function [bestShape, determinant, description] = findSingul(A, J)
    % Initialize variables for timing and determinant computation
    minTime = inf;
    bestShape = [];
    description = '';
    determinant = 0;
    allDeterminants = []; % Initialize an array to store all determinants
    
    % Check if J is squared and directly compute the determinant if so
    if size(J, 1) == size(J, 2)
        tic;
        determinant = det(J);
        allDeterminants(end+1) = determinant; % Store the determinant
        timeElapsed = toc;
        if timeElapsed < minTime
            minTime = timeElapsed;
            bestShape = J;
            description = 'Direct det(J) used for 3x3 Jacobian.';
        end
    else
        % Iterate through the cell array A of rotation matrices
        for i = 1:length(A)
            Ai = A{i};
            R = Ai(1:3, 1:3);

            % composition of the multiplication matrix for the jacobian
            M = blkdiag(R',R');
            J_transformed = M * J;

            % start of the determinant of the non squared matrix
            tic;
            detJ = det(J_transformed);
            allDeterminants(end+1) = detJ; % Store each determinant
            timeElapsed = toc;
            % Update if this approach is better
            if timeElapsed < minTime
                minTime = timeElapsed;
                bestShape = J_transformed;
                determinant = detJ;
                description = sprintf('Multiplication with R from frame %d used.', i);
            end
        end
    end
     % Print all determinants for a safety check
    fprintf('All determinants:\n');
    disp(allDeterminants);
    
    % Check for consistency in determinants
    if all(abs(diff(allDeterminants)) < 1e-6) % Adjust tolerance as needed
        fprintf('Determinants are consistent.\n');
    else
        fprintf('Warning: Inconsistent determinants detected.\n');
    end
end

