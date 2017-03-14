function heun_script (tf) %tf is the end time

%initailise the circuits 
R = 0.5;
L = 0.0015;
h = 0.0001; %step size


%initailise the container 

N = round(tf/h); %number of iterations
t = zeros(1, N);
Vout = zeros(1, N);
current = zeros(1,N);

%input voltage
% step function of 3.5 volt
Vin = @(t)3.5*heaviside(t); 

%the initial condition
t(1) = 0;
current(1) = 0;


%the equation
func =  @(t,current) (Vin(t)-R*(current))/L; %Function input for difference method


%Huen
for j = 1 : N-1
    [t(j + 1),current(j + 1)] = heun(func, t(j), current(j), h);
    Vout(j + 1) = Vin(t(j)) - R*current(j); %Create Vout array from Iout, R and Vin
end

%plot

figure(1);
plot(Vout);
xlabel({'Time', '(seconds)'});
ylabel({'V_{out}', '(volt)'});
title('(Heaviside) V_{out} versus time');

figure(8);
plot(t, current);
xlabel({'Time', '(seconds)'});
ylabel({'V_{out}', '(volt)'});
title('V_{out} versus time (Heaviside)');

%---------------------------------------------------------------------------------------------

%initailise the circuits information at the top

%input voltage
tau = 0.000150;
A = 3.5;

Vin = @(t) A * exp(-t.^2/tau);
 
%the initial condition
t(1) = 0;
current(1) = 0;


%the equation
func =  @(t,current) (Vin(t)-R*(current))/L; %Function input for difference method


%Huen
for j = 1 : N-1
    [t(j + 1),current(j + 1)] = heun(func, t(j), current(j), h);
    Vout(j + 1) = Vin(t(j)) - R*current(j); %Create Vout array from Iout, R and Vin
end

%plot

figure(2);
plot(Vout);
xlabel({'Time', '(seconds)'});
ylabel({'V_{out}', '(volt)'});
title('V_{out} versus time (Exponential square function #1)');

%-----------------------------------------------------------------------------------------------

%initailise the container information at the top

%input voltage
tau = 0.000150;
A = 3.5;

Vin = @(t) A * exp(-t/tau);
 
%the initial condition
t(1) = 0;
current(1) = 0;


%the equation
func =  @(t,current) (Vin(t)-R*(current))/L; %Function input for difference method


%Huen
for j = 1 : N-1
    [t(j + 1),current(j + 1)] = heun(func, t(j), current(j), h);
    Vout(j + 1) = Vin(t(j)) - R*current(j); %Create Vout array from Iout, R and Vin
end

%plot

figure(3);
plot(Vout);
xlabel({'Time', '(seconds)'});
ylabel({'V_{out}', '(volt)'});
title('V_{out} versus time (Exponential #2)');


% %-------------------------------------------------------------------------------------------


%initailise the circuits information at the top


N = round(tf/h); %number of iterations
t = zeros(1, N);
Vout = zeros(1, N);
current = zeros(1,N);

%input voltage
% step function of 5 volt
% T= 0.00015, 0.000015, 0.0004, 0.0011
T = 0.0011;
Vin = @(t)4*sin(2*pi*t/T);

%the initial condition
t(1) = 0;
current(1) = 0;


%the equation
func =  @(t,current) (Vin(t)-R*(current))/L; %Function input for difference method


%Huen
for j = 1 : N-1
    [t(j + 1),current(j + 1)] = heun(func, t(j), current(j), h);
    Vout(j + 1) = Vin(t(j)) - R*current(j); %Create Vout array from Iout, R and Vin
end

%plot

figure(4);
plot(Vout);
xlabel({'Time', '(seconds)'});
ylabel({'V_{out}', '(volt)'});
title('V_{out} versus time (T=0.0011)(Sine wave)');

%-----------------------------------------------------------------------------------------

%initailise the circuits information at the top

%input voltage
% step function of 5 volt
A = 4;
T = 0.0011;

Vin = @(t) A * square(2*pi*t/T);

%the initial condition
t(1) = 0;
current(1) = 0;


%the equation
func =  @(t,current) (Vin(t)-R*(current))/L; %Function input for difference method


%Huen
for j = 1 : N-1
    [t(j + 1),current(j + 1)] = heun(func, t(j), current(j), h);
    Vout(j + 1) = Vin(t(j)) - R*current(j); %Create Vout array from Iout, R and Vin
end

%plot

figure(5);
plot(Vout);
xlabel({'Time', '(seconds)'});
ylabel({'V_{out}', '(volt)'});
title('V_{out} versus time (T=0.0011) (Square wave)');

%--------------------------------------------------------------------------------------
%initailise the circuits information at the top

%input voltage
% step function of 5 volt
A = 4;
T = 0.0011;

Vin = @(t) A * sawtooth(2*pi*t/T);

%the initial condition
t(1) = 0;
current(1) = 0;


%the equation
func =  @(t,current) (Vin(t)-R*(current))/L; %Function input for difference method


%Huen
for j = 1 : N-1
    [t(j + 1),current(j + 1)] = heun(func, t(j), current(j), h);
    Vout(j + 1) = Vin(t(j)) - R*current(j); %Create Vout array from Iout, R and Vin
end

%plot

figure(6);
plot(Vout);
xlabel({'Time', '(seconds)'});
ylabel({'V_{out}', '(volt)'});
title('V_{out} versus time (T=0.0011) (Sawtooth wave)');

end