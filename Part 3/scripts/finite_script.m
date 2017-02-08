% This script implements the finite difference method to solve the heat
% equation

clear;

% Set the number of samples to take
N = 60;

% Set the total time to run
m = 300;

% Declare final size of matrix for speed
res = zeros(N+1, m+1);

% Set v
v = 0.25;

% Get h and k
h = 1/N;
k = h^2 * v;

% Set Initial condition
res(:, 1) = get_function(N, h, 3);

% Set boundary conditions
res(1, :) = zeros(1, m+1);
res(N+1, :) = zeros(1, m+1);

% Calculate M+1 and plot it continuously
for c = 1:m
    for i = 2:N
        res(i, c+1) = v * res(i-1, c) + (1-2*v) * res(i, c) + v * res(i+1, c);
    end
end

for i = 1:m+1
    if rem(i, 10) == 0
        plot(0:h:1, res(:, i));
        hold on;
    end
end
hold off;
xlabel('x');
ylabel('y');
title('Plots of 1D Heat equation over time, bc = abs(sin(2*pi*x))');
legend('m = 0', 'm = 1', '...', 'm = 99');