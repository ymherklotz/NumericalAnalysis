function heun_script (tf) %tf is the end time

%initailise the circuits 
R = 0.5;
L = 1.5*10^(-3);
h = 0.00001; %step size


%initailise the container 

N = round(tf/h); %number of iterations
t = zeros(1, N);
Vout = zeros(1, N);
current = zeros(1,N);

%input voltage
% step function of 5 volt
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

%---------------------------------------------------------------------------------------------

%initailise the circuits at the top

%initailise the container at the top

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
title('(Exponential #1) V_{out} versus time');

%-----------------------------------------------------------------------------------------------

%initailise the circuits at the top

%initailise the container at the top

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
title('#(Exponential #2) V_{out} versus time');


%-------------------------------------------------------------------------------------------


%initailise the circuits at the top


%initailise the container at the top

N = round(tf/h); %number of iterations
t = zeros(1, N);
Vout = zeros(1, N);
current = zeros(1,N);

%input voltage
% step function of 5 volt
Vin = @(t)4*sin(2*pi*6000*t);

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
title('(Sine wave) V_{out} versus time ');

%-----------------------------------------------------------------------------------------

%initailise the circuits at the top


%initailise the container 


%input voltage
% step function of 5 volt
A = 4;
T = 0.0015;

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
title('(Square wave) V_{out} versus time');

%--------------------------------------------------------------------------------------
%initailise the circuits at the top

%initailise the container at the top

%input voltage
% step function of 5 volt
A = 4;
T = 0.0015;

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
title('(Sawtooth wave) V_{out} versus time');

end