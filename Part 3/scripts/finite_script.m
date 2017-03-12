% This script implements the finite difference method to solve the heat
% equation

clear;

steps = 100;

% Set the number of samples to take
N = 150;

% Set the total time to run
m = 5000;

% Declare final size of matrix for speed
res = zeros(N+1, m+1);

% Set v
v = 0.25;

% Get h and k
h = 1/N;
k = h^2 * v;

% Set Initial condition
res(:, 1) = get_function(N, h, 3)';

% Set boundary conditions
res(1, :) = zeros(1, m+1);
res(N+1, :) = zeros(1, m+1);

% Calculate M+1 and plot it continuously
for c = 1:m
    for i = 2:N
        res(i, c+1) = v * res(i-1, c) + (1-2*v) * res(i, c) + v * res(i+1, c);
    end
end

% Plot 2D
figure;
Z = zeros(N+1, m/steps+1);
count = 1;
for i = 1:m+1
    if rem(i, steps) == 1
        plot(0:h:1, res(:, i));
        Z(:, count) = res(:, i);
        hold on;
        count = count + 1;
    end
end
hold off;

xlabel('x');
ylabel('y');
title('Plots of 1D Heat equation over time, bc = 1');
legend('m = 0', 'm = 100', 'm = 200', 'm = ...', 'm = 5000');

% Plot 3D
figure;
x = (0:m/steps) / (m/steps);
y = (0:N) / N;
[X,Y] = meshgrid(x, y);
surf(X, Y, Z);

xlabel('time / t');
ylabel('x');
zlabel('y');
title('3D plot of 1D Heat equation over time, bc = 1');


