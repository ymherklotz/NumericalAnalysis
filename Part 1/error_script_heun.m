function error_script_heun (tf)

ts = 0;     % set initial value of x_0
is = 0;
h = 0.0001;  % set step-size
R = 0.5;
L = 0.0015;


A = 6;
T = 0.00015;

vin = @(t) A * cos(2*pi*t/T);
func = @(t, iout) (vin(t) - iout*R) / L;      % define func
[t, iout ] = heun(func, ts, is, h);

%numerical solution
vout = vin(t) - iout * R;

%obtaining the exact solution with favorite method
i_Exact = @(t) (6/L)*((2*pi)/T * sin((2*pi)/T*t) + (R/L)*cos((2*pi)/T*t) - (R/L)*exp(-(R/L)*t))/((2*pi)/T^2 + (R/L)^2);
exact = vin(t) - R*i_Exact(t);
%error as a function of t
error = abs(exact - vout); 

figure(1);
plot(t,error); %for heun
%loglog(error);

figure(5);
for ind=3:16 % choose these carefully
 h1=2^(-ind); % set stepsize
 
 
    [t, iout] = heun(func, ts, is, h1);
    exact = vin(t) - R*i_Exact(t)  ;
    vout = vin(t) - R*iout;
    error = max(abs(exact - vout)); 
    
    plot(log(h1),log(error),'b*'); % log/log plot stepsize vs error
    hold on; % for next value to be plotted
end

end

