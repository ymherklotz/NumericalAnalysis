%-----------------------------------------------------------------
clear;
ts = 0;     % set initial value of x_0
is = 0;
h = 0.0001;  % set step-size
tf = 0.03;     % stop here
R = 0.5;
L = 0.0015;

A = 6;
T = 0.00015;

vin = @(t) A * cos(2*pi*t/T);
func = @(t, iout) (vin(t) - iout*R) / L;      % define func
[t, iout ] = midpoint(func, ts, tf, is, h);

%numerical solution
vout = vin(t) - iout * R;

%obtaining the exact solution with favorite method
exact= @(t) 0.07553*cos( 41883.7*(t) ) + 0.94901*sin( 41883.7*(t) ); % works for arrays
%exact = Vin0 - R*((Vin0/R) * (1 - exp(-(R/L)*ta)));  %Vin0 is the initial value of Vin, ta is the value of t


%error as a function of t
error = @(t) exact(t) -vout; 

figure(2);
plot(t,error); %for midpoint
loglog(error);

%--------------------------------------------------------------------

clear;
ts = 0;     % set initial value of x_0
is = 0;
h = 0.0001;  % set step-size
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
exact= @(t) 0.07553*cos( 41883.7*(t) ) + 0.94901*sin( 41884.7*(t) ); % works for arrays

%error as a function of t
error = @(t) exact(t) -vout; 

figure(3);
plot(t,error); %for ralston
loglog(error);






