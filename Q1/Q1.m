%%prep work space%%
clc, clear

%% Givens %%
L = 0.05; %in m%
K = 0.2; %in W/m.k%
g = 10000; %in W/m^3%
T_inf = 25; %in C%
h = 20; %W/m2.k%
q_rad = 150; %W/m2%

% Nodes and Element Length %
M = 100;
dx = L/(M-1);

% Initial Guess %
T = ones(M,1) * T_inf;

% Iteration Settings %
error = 1;
iter = 0;

% Calculations %
while error > 0.0001
    T_old = T;

    % Interior Nodes %
    for i = 2:M-1
        T(i) = 0.5 * (T(i+1) + T(i-1) + (g * dx^2)/K);
    end

    % Left Boundry: %
    T(1) = (2*T(2) + 2*dx*(h*T_inf + q_rad)/K) / (2 + 2*dx*h/K);

    % Right Boundry: insulated (dT/dx = 0) %
    T(M) = T(M-1);

    % Error Check %
    error = max(abs(T - T_old));
    iter = iter + 1;
end

% Analytical Solution %
x = linspace(0, L, M);
T_anal = -g/(2*K) * x.^2 + g*L/K * x + 57.5;

% Maximum Temperature and Position %
[T_max, idx] = max(T);
x_max = x(idx);
T_max_anal = max(T_anal);

% Heat Transfer Rate%
q_left = g*L/K * -K ;
q_right = 0;

% Displaying Results %
fprintf('Maximum Temperature from Numerical Solution: %2f °C at x = %.4f m\n', T_max, x_max);
fprintf('Maximum Temperature from Analytical Solution: %2f °C\n', T_max_anal);
fprintf('Heat Transfer Rate at x = 0: %.2f W/m^2\n', q_left);
fprintf('Heat Transfer Rate at x = L: %.2f W/m^2\n', q_right);

%% Plotting Results %%
figure;
plot(x, T, '-b', 'DisplayName', 'Numerical');
hold on;
plot(x, T_anal, '-r', 'DisplayName', 'Analytical')
xlabel('Position x (m)');
ylabel('Temperature (°C)');
title('Temperature Distribution in A Plate');
legend('show');
grid on;
