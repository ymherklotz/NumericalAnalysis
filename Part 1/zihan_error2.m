%-----------------------------------------------------------------
clear;
ts = 0;     % set initial value of x_0
is = 0;
tf = 0.03;     % stop here
R = 0.5;
L = 0.00015;

A = 6;
T = 0.00015;

vin = @(t) A * cos(2*pi*t/T);
func = @(t, iout) (vin(t) - iout*R) / L;      % define func

%obtaining the exact solution with favorite method

%error as a function of t
%error = exact - vout; 

figure;

for ind=16:50 % choose these carefully

    h1=2^(-ind); % set stepsize
    [t, i_Exact] = exact_solution(R,L,T,tf,h1);
    exact = vin(t) - R*i_Exact;

    [t, iout] = ralston(func, ts, tf, is, h1);
    vout = vin(t) - R*iout;

    error = exact - vout; 
    error = max(abs(error));

    plot(log(h1),log(error)); % log/log plot stepsize vs error
    xlabel({'Step size', '(h)'});
    ylabel({'Error'});
    title('MIDPOINT');
    hold on; % for next value to be plotted
 
end
