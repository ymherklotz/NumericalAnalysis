% This script implements the finite difference method to solve the heat
% equation

format long;

% Set the number of samples to take
N = 14;

% Set the total time to run
m = 50;

% Declare final size of matrix for speed
res = zeros(N+1, m+1);

% Set v
v = 0.25;

% Get h and k
h = 1/N;
k = h^2 * v;

% Set initial condition to triangle function
umj = 0:h:1;
count = 1;
for i = 0:h:1
    if i < 0.5
        umj(count) = 2*i;
    else
        umj(count) = 2-2*i;
    end
    count = count + 1;
end

% Set boundary conditions
res(1, :) = zeros(1, m+1);
res(N+1, :) = zeros(1, m+1);

% Calculate M+1 and plot it continuously
res(:, 1) = umj;
for c = 1:m
    for i = 2:N
        res(i, c+1) = v * res(i-1, c) + (1-2*v) * res(i, c) + v * res(i+1, c);
    end
end

plot(0:h:1, res);
xlabel('x');
ylabel('y');
title('Plot of result from t = 1:m and u = 1:N');