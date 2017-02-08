% This script implements the finite difference method to solve the heat
% equation

clear;

% Set the number of samples to take
N = 24;

% Set the total time to run
m = 100;

% Declare final size of matrix for speed
res = zeros(N+1, m+1);

% Set v
v = 0.25;

% Get h and k
h = 1/N;
k = h^2 * v;

% Set initial condition to triangle function
count = 1;
for i = 0:h:1
    if i < 0.5
        res(count, 1) = 2*i;
    else
        res(count, 1) = 2-2*i;
    end
    count = count + 1;
end

% Set inital condition to sin function
% res(:, 1) = sin(2*pi*(0:h:1));

% Set initial condition to abs of sin
% res(:, 1) = abs(sin(2*pi*(0:h:1)));



% Set boundary conditions
res(1, :) = zeros(1, m+1);
res(N+1, :) = zeros(1, m+1);

% Calculate M+1 and plot it continuously
for c = 1:m
    for i = 2:N
        res(i, c+1) = v * res(i-1, c) + (1-2*v) * res(i, c) + v * res(i+1, c);
    end
end

plot(0:h:1, res);
xlabel('x');
ylabel('y');
title('Plots of 1D Heat equation over time');
legend('m = 0', 'm = 1', '...', 'm = 99');