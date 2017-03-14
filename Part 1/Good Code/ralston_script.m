clear;
ts = 0;     % set initial value of x_0
is = 0;
h = 0.0001;  % set step-size
tf = 0.03;     % stop here
R = 0.5;
L = 0.0015;

% vin = @(t) 3.5;
% func = @(t, iout) (vin(t) - iout*R) / L;      % define func
% [t, iout ] = ralston(func, ts, tf, is, h);
% 
% vout = vin(t) - iout * R;
% plot(t,vout);
% xlabel({'Time', '(seconds)'});
% ylabel({'V_{out}', '(volt)'});
% title('V_{out} versus time (original function)');
% %____________________________________________________________________
% h = 0.0001;
% tf = 0.03;
% figure;
% A = 3.5;
% tau = 0.00015;
% 
% vin = @(t) A * exp(-t.^2/tau);
% func = @(t, iout) (vin(t) - iout*R) / L;      % define func
% [t, iout ] = ralston(func, ts, tf, is, h);
% 
% vout = vin(t) - iout * R;
% plot(t,vout);
% xlabel({'Time', '(seconds)'});
% ylabel({'V_{out}', '(volt)'});
% title('V_{out} versus time (exponential square funtion)');
% %____________________________________________________________________
% h = 0.0001;
% tf = 0.03;
% figure;
% A = 3.5;
% tau = 0.00015;
% 
% vin = @(t) A * exp(-t/tau);
% func = @(t, iout) (vin(t) - iout*R) / L;      % define func
% [t, iout ] = ralston(func, ts, tf, is, h);
% 
% vout = vin(t) - iout * R;
% plot(t,vout);
% xlabel({'Time', '(seconds)'});
% ylabel({'V_{out}', '(volt)'});
% title('V_{out} versus time (exponential function)');

%____________________________________________________________________
h = 0.0001;
tf = 0.03;
figure;
A = 4;
T = 0.000015;

vin = @(t) A * sin(2*pi*t/T);
func = @(t, iout) (vin(t) - iout*R) / L;      % define func
[t, iout ] = ralston(func, ts, tf, is, h);

vout = vin(t) - iout * R;
plot(t,vout);
xlabel({'Time', '(seconds)'});
ylabel({'V_{out}', '(volt)'});
title('V_{out} versus time (T=0.000015) (sine function)');
% % % ____________________________________________________________________
% h = 0.0001;
% tf = 0.03;
% figure;
% A = 4;
% T = 0.0011;
% 
% vin = @(t) A * square(2*pi*t/T);
% func = @(t, iout) (vin(t) - iout*R) / L;      % define func
% [t, iout ] = ralston(func, ts, tf, is, h);
% 
% vout = vin(t) - iout * R;
% plot(t,vout);
% xlabel({'Time', '(seconds)'});
% ylabel({'V_{out}', '(volt)'});
% title('V_{out} versus time (T=0.0011) (square function)');
% %____________________________________________________________________
% h = 0.0001;
% tf = 0.03;
% figure;
% A = 4;
% T = 0.000015;
% 
% vin = @(t) A * sawtooth(2*pi*t/T);
% func = @(t, iout) (vin(t) - iout*R) / L;      % define func
% [t, iout ] = ralston(func, ts, tf, is, h);
% 
% vout = vin(t) - iout * R;
% plot(t,vout);
% xlabel({'Time', '(seconds)'});
% ylabel({'V_{out}', '(volt)'});
% title('V_{out} versus time (T=0.0011)(sawtooth function)');






