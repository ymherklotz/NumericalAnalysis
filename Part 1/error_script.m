%-----------------------------------------------------------------
% clear;
% ts = 0;     % set initial value of x_0
% is = 0;
% h = 0.0001;  % set step-size
% tf = 0.03;     % stop here
% R = 0.5;
% L = 0.0015;
% 
% A = 6;
% T = 0.00015;
% 
% vin = @(t) A * cos(2*pi*t/T);
% func = @(t, iout) (vin(t) - iout*R) / L;      % define func
% [t, iout ] = midpoint(func, ts, tf, is, h);
% 
% %numerical solution
% vout = vin(t) - iout * R;
% 
% %obtaining the exact solution with favorite method
% i_Exact = (6/L)*((2*pi)/T * sin((2*pi)/T*t) + (R/L)*cos((2*pi)/T*t) - (R/L)*exp(-(R/L)*t))/((2*pi)/T^2 + (R/L)^2);
% exact = vin(t) - R*i_Exact;
% 
% %error as a function of t
% error = exact - vout; 
% 
% figure(2);
% plot(t,error); %for midpoint
% figure(3);
% t = logspace(-10 ,1);
% loglog(t,error);
% grid on;


%--------------------------------------------------------------------

clear;
ts = 0;     % set initial value of x_0
is = 0;
h = 0.0000005;  % set step-size
tf = 0.03;     % stop here
R = 0.5;
L = 0.0015;

A = 6;
T = 0.00015;

vin = @(t) A * cos(2*pi*t/T);
func = @(t, iout) (vin(t) - iout*R) / L;      % define func
[t, iout ] = ralston(func, ts, tf, is, h);

%numerical solution 
vout = vin(t) - iout * R;

%obtaining the exact solution with favorite method
i_Exact = @(t) (6/L)*((2*pi)/T * sin((2*pi)/T*t) + (R/L)*cos((2*pi)/T*t) - (R/L)*exp(-(R/L)*t))/((2*pi)/T^2 + (R/L)^2);
exact = vin(t) - R*i_Exact(t);

%error as a function of t
error = abs(exact - vout); 

figure(3);
plot(t,error); %for ralston


max_error = max(error);


figure(5);
for k = 1:5
    
    [t, iout] = ralston(func, ts, tf, is, h);
    exact = vin(t) - R*i_Exact(t);
    vout = vin(t) - R*iout;
    error = abs(exact - vout); 
    max_error = max(error);
    plot(log(t), log(max_error),'b*');
    hold on;
    h = 2*h;
end

