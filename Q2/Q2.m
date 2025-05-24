%%PREP%%
clear; clc; close all;

%% Parameters%%
L = 0.12; % thickness (m)
k = 50; % thermal conductivity (W/m·K)
alpha = 3.94e-5; % thermal diffusivity (m²/s)
h = 700; % convection coefficient (W/m²·K)
T_inf = 30; % water temperature (°C)
q_flux = 100e3; % heat flux (W/m²)
T_initial = 20; % initial temperature (°C)

% Discretization
dx = 0.024; % spatial step (m)
dt = 5; % time step (s)
x = 0:dx:L; % spatial nodes (6 nodes total)
N = length(x); % number of nodes = 6

% Stability check
Fo = alpha*dt/dx^2;
if Fo > 0.5
    error('Stability criterion not satisfied! Reduce time step.');
end
fprintf('Fourier number Fo = %.3f (stable)\n', Fo);

% Simulation time setup
sim_time = 30*60; % 30 minutes in seconds
output_times = [5, 10, 15, 20, 25, 30]*60; % in seconds

% Initialize temperature array
T = ones(1,N)*T_initial;
T_record = zeros(length(output_times), N);
time_indices = zeros(1, length(output_times));

% Time stepping
current_time = 0;
output_counter = 1;
min_temp_history = [];

while current_time <= sim_time
    % Store current temperature for time stepping
    T_old = T;
    
    % Interior nodes (i=2 to N-1)
    for i = 2:N-1
        T(i) = T_old(i) + Fo*(T_old(i+1) - 2*T_old(i) + T_old(i-1));
    end
    
    % Left boundary (node 1, convection)
    T(1) = (k*T_old(2)/dx + h*T_inf)/(k/dx + h);
    
    % Right boundary (node N, constant heat flux)
    T(N) = T_old(N-1) + q_flux*dx/k;
    
    % Record minimum temperature
    min_temp_history = [min_temp_history, min(T)];
    
    % Check if current time matches output times
    if output_counter <= length(output_times) && current_time >= output_times(output_counter)
        T_record(output_counter,:) = T;
        time_indices(output_counter) = current_time;
        fprintf('Time = %d min:\n', current_time/60);
        fprintf('Node positions (m): %s\n', sprintf('%.3f ', x));
        fprintf('Temperatures (°C): %s\n\n', sprintf('%.1f ', T));
        output_counter = output_counter + 1;
    end
    
    current_time = current_time + dt;
end

% Plotting temperature distributions
figure;
hold on;
colors = lines(length(output_times));
for i = 1:size(T_record,1)
    plot(x, T_record(i,:), 'o-', 'Color', colors(i,:), 'DisplayName', sprintf('%d min', output_times(i)/60));
end
xlabel('Position (m)');
ylabel('Temperature (°C)');
title('Temperature Distribution Across Plate (6 nodes, ?t=5s)');
legend('Location', 'northwest');
grid on;

% Plotting minimum temperature vs time
figure;
plot((1:length(min_temp_history))*dt/60, min_temp_history, 'b-');
xlabel('Time (minutes)');
ylabel('Minimum Temperature (°C)');
title('Minimum Temperature in Plate vs Time');
grid on;

% Calculate total heat stored after 30 minutes
rho_cp = k/alpha; % ?*c_p (J/m³·K)
total_heat = sum(T - T_initial)*dx*rho_cp; % J/m²
total_heat_kJ = total_heat/1000; % kJ/m²

fprintf('\nTotal heat stored after 30 minutes: %.2f kJ/m²\n', total_heat_kJ);