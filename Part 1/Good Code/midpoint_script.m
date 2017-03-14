clear;
ts = 0;     % set initial value of x_0
is = 0;
h = 0.0001;  % set step-size
tf = 0.03;     % stop here

R = 0.5;
L = 0.0015;

vin = @(t) 3.5;
func = @(t, iout) (vin(t) - iout*R) / L;      % define func
[t, iout ] = midpoint(func, ts, tf, is, h);

vout = vin(t) - iout * R;
figure(1);
plot(t,vout);
xlabel({'Time', '(seconds)'});
ylabel({'V_{out}', '(volt)'});
title('V_{out} versus time (Heaviside)');
%____________________________________________________________________
h = 0.0001;
tf = 0.03;
figure;
A = 3.5;
tau = 0.00015;

vin = @(t) A * exp(-t.^2/tau);
func = @(t, iout) (vin(t) - iout*R) / L;      % define func
[t, iout ] = midpoint(func, ts, tf, is, h);

vout = vin(t) - iout * R;
figure(2);
plot(t,vout);
xlabel({'Time', '(seconds)'});
ylabel({'V_{out}', '(volt)'});
title('V_{out} versus time (Exponential square function #1)');

%____________________________________________________________________
h = 0.0001;
tf = 0.03;
figure;
A = 3.5;
tau = 0.00015;

vin = @(t) A * exp(-t/tau);
func = @(t, iout) (vin(t) - iout*R) / L;      % define func
[t, iout ] = midpoint(func, ts, tf, is, h);

vout = vin(t) - iout * R;
figure(3);
plot(t,vout);
xlabel({'Time', '(seconds)'});
ylabel({'V_{out}', '(volt)'});
title('V_{out} versus time (Exponential function #2)');

%____________________________________________________________________
h = 0.0001;
tf = 0.03;
figure;
A = 4;
T = 0.0011;

vin = @(t) A * sin(2*pi*t/T);
func = @(t, iout) (vin(t) - iout*R) / L;      % define func
[t, iout ] = midpoint(func, ts, tf, is, h);

vout = vin(t) - iout * R;
figure(4);
plot(t,vout);
xlabel({'Time', '(seconds)'});
ylabel({'V_{out}', '(volt)'});
title('V_{out} versus time (T=0.0011) (Sine wave)');
%____________________________________________________________________
h = 0.0001;
tf = 0.03;
A = 4;
T = 0.0011;

vin = @(t) A * square(2*pi*t/T);
func = @(t, iout) (vin(t) - iout*R) / L;      % define func
[t, iout ] = midpoint(func, ts, tf, is, h);

vout = vin(t) - iout * R;
figure(5);
plot(t,vout);
xlabel({'Time', '(seconds)'});
ylabel({'V_{out}', '(volt)'});
title('V_{out} versus time (T=0.0011) (Square wave)');
%____________________________________________________________________
h = 0.0001;
tf = 0.03;
A = 4;
T = 0.0011;

vin = @(t) A * sawtooth(2*pi*t/T);
func = @(t, iout) (vin(t) - iout*R) / L;      % define func
[t, iout ] = midpoint(func, ts, tf, is, h);

vout = vin(t) - iout * R;
figure(6);
plot(t,vout);
xlabel({'Time', '(seconds)'});
ylabel({'V_{out}', '(volt)'});
title('V_{out} versus time (T=0.0011) (Sawtooth wave)');






