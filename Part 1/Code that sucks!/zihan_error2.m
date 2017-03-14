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



figure(1);

for ind=16:20 % choose these carefully

    h1=2^(-ind); % set stepsize
    
    %obtaining the exact solution with favorite method
    [t, i_Exact] = exact_solution(R,L,T,tf,h1);
    exact = vin(t) - R*i_Exact;
    
    [t, iout] = ralston(func, ts, tf, is, h1);
    vout = vin(t) - R*iout;
    
    %error as a function of t
    error1 = exact - vout; 
    error_final = max(abs(error1));

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
   
    
    