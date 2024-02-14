function bangCbangPlot(v_max, a_max, T, L, q_i, q_f)
    if L > 0
        if q_i > q_f
            L = -L;
            q_i = -q_i;
            q_f = -q_f;
        end
    else
        if q_i < q_f
            L = -L;
            q_i = -q_i;
            q_f = -q_f;
        end
    end

    t1 = v_max / a_max; % Time to accelerate to maximum velocity
    d1 = 0.5 * a_max * t1^2; % Distance covered during acceleration

    if abs(L) <= 2 * d1 % If distance is less than or equal to 2*d1, then no coast phase
        t1 = sqrt(abs(L) / (0.5 * a_max)); % Recalculate time to cover distance without coast
        d1 = 0.5 * a_max * t1^2; % Recalculate distance covered during acceleration
        t_coast = 0;
    else
        t_coast = (T - 2 * t1); % Coast time
    end

    t_total = 2 * t1 + t_coast; % Total time

    % Time vector
    t = linspace(0, t_total, 1000);

    % Position function
    p = zeros(size(t));
    p(t <= t1) = q_i + 0.5 * a_max * t(t <= t1).^2;
    p(t > t1 & t <= (t1 + t_coast)) = q_i + v_max * (t(t > t1 & t <= (t1 + t_coast)) - t1);
    p(t > (t1 + t_coast) & t <= t_total) = q_f - 0.5 * a_max * ((t(t > (t1 + t_coast) & t <= t_total) - (t_total - t1)).^2);

    % Velocity function
    v = zeros(size(t));
    v(t <= t1) = a_max * t(t <= t1);
    v(t > t1 & t <= (t1 + t_coast)) = v_max;
    v(t > (t1 + t_coast) & t <= t_total) = v_max - a_max * (t(t > (t1 + t_coast) & t <= t_total) - (t_total - t1));

    % Acceleration function
    a = zeros(size(t));
    a(t <= t1) = a_max;
    a(t > t1 & t <= (t1 + t_coast)) = 0;
    a(t > (t1 + t_coast) & t <= t_total) = -a_max;

    % Plotting
    figure;
    subplot(3,1,1);
    plot(t, p, 'b', 'LineWidth', 1.5);
    xlabel('Time');
    ylabel('Position');
    title('Position vs Time');
    grid on;

    subplot(3,1,2);
    plot(t, v, 'r', 'LineWidth', 1.5);
    xlabel('Time');
    ylabel('Velocity');
    title('Velocity vs Time');
    grid on;

    subplot(3,1,3);
    plot(t, a, 'g', 'LineWidth', 1.5);
    xlabel('Time');
    ylabel('Acceleration');
    title('Acceleration vs Time');
    grid on;

    sgtitle('Bang-Coast-Bang Profile');

    % Display information
    fprintf('Total Time: %.2f s\n', t_total);
    fprintf('Time to accelerate: %.2f s\n', t1);
    fprintf('Coast time: %.2f s\n', t_coast);
    fprintf('Distance covered during acceleration: %.2f m\n', d1);
end
