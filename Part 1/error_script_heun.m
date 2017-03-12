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
exact= @(t) 0.07553*cos( 41883.7*(t) ) + 0.94901*sin( 41883.7*(t) ); % works for arrays

%error as a function of t
error=exact-vout; 

figure(1);
plot(t,error); %for heun
loglog(error);

end