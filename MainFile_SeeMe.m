%% Section 1: Modelling
clear
clc

circulation_model = Circulation(75, 2, 0.06);

T = 5;
% T = 10;
[time, state] = circulation_model.simulate(T);

% [time, state] = circulation_model.explicit_euler(T);

%%% TASK 4
% Do the necessary calculation (if required, this may be based on Q (4th state)) and then generate the desired plots.
% Q is flow rate (similar to current in electrical systems) 

ventricular_pressure = state(:,1);
atrial_pressure = state(:,2);
arterial_pressure = state(:,3);
aortic_pressure = zeros(size(state(:,4)));

% Calculations for aortic pressure just outside the aortic valve
% over time span 
for i = 1:length(time)
    x_dot = circulation_model.get_derivative(time(i), transpose(state(i,:)));
    aortic_pressure(i) = state(i,3) + circulation_model.R4*state(i,4) + circulation_model.L.*x_dot(4);
end

%%% Plotting all pressures just outside the aortic valve over time span
figure()
LineWidth = 1.5;
FontSize = 12;
plot(time, ventricular_pressure, 'LineWidth', LineWidth), hold on;
plot(time, atrial_pressure, 'LineWidth', LineWidth);
plot(time, arterial_pressure, 'LineWidth', LineWidth);
plot(time, aortic_pressure, 'LineWidth', LineWidth), hold off;

legend('ventricular', 'atrial', 'arterial', 'aortic') % note the order here
xlabel('Time (seconds)')
ylabel('Pressure (mmHg)')
set(gca, 'FontSize', FontSize)

%% Optimization (you dont need to change any code for this section)
clear
clc

% Loading the true Ventricular Pressure which we 
% need it to calculate the objective function for optimization
load VentricularPressure

% create random initial solution
w_int =  [randi([60 80],1,1); rand(2,1)]; % initial solution
options = optimoptions('simulannealbnd','PlotFcns',...
    {@saplotbestf,@saplotf}, ... 
    'FunctionTolerance', 5e-7, ...
    'MaxIterations', 50, ... % here you can change the maximum iteration
    'ReannealInterval', 25);
lb = [60 0.3 0.001]; % lower bound for solutions
ub = [80 4 0.1]; % upper bound for solutions
tic
[w, fval] = simulannealbnd(@(w) ObjectiveFunction(w, ventricularPressure, time), ...
    w_int, lb, ub, options);
toc

disp(['Objective Function Value = ' num2str(fval)])
disp(['Estimated HR = ' num2str(round(w(1)))])
disp(['Estimated E_{max} = ' num2str(w(2))])
disp(['Estimated E_{min} = ' num2str(w(3))])




