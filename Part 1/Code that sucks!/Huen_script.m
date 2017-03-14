function Huen_script (tf) %tf is the end time

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
%Vin = @(t)5*heaviside(t); 
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

plot(Vout);
xlabel('T/s');
ylabel('Vout/V');
end