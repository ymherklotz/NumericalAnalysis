clear;
ts = 0;     % set initial value of x_0
is = 0;
tf = 0.03;     % stop here
R = 0.5;
L = 0.0015;

A = 6;
T = 0.00015;

vin = @(t) A * cos(2*pi*t/T);
func = @(t, iout) (vin(t) - iout*R) / L;      % define func



figure(1);

for ind=16:25 % This increments the time step by 2^-n every time where n = 16, 17, .... 25
    %we started from 16 as we observed the results with larger step sizes
    %gave irregualar data

    h1=2^(-ind); % set stepsize
    
    %obtaining the exact solution with favorite method
    [t, i_Exact] = exact_solution(R,L,T,tf,h1);
    exact = vin(t) - R*i_Exact;
    
    %call appropriate method
    %[t, iout] = heun_methodforerror(func, ts, tf, is, h1);
    %[t, iout] = ralston(func, ts, tf, is, h1);
    [t, iout] = midpoint(func, ts, tf, is, h1);

    vout = vin(t) - R*iout;
    
    %error as a function of t
    error1 = exact - vout; 
    error_final = max(abs(error1));

    %this plots a log lgo plot to show the order of the error
    plot(log(h1),log(error_final), '*g'); % log/log plot stepsize vs error
    xlabel({'Step size', '(h)'});
    ylabel({'Error', '(volts)' });
    title('RALSTON ERROR (LOGLOG PLOT) ');
    hold on;
   
 
end

%this gives us the error function for the above method
figure(2);
    plot(error1);
    xlabel({'Time', '(sec)'});
    ylabel({'Error', '(volts)'});
    title('RALSTON ERROR');
   
    
    