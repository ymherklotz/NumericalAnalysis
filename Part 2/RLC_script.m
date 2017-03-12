function RLC_Script (tf) 

%initailise the circuits 
R = 250;
L = 650*10^(-3);
C = 3*10^(-6);
h = 0.00001; %step size

%initailise the container 

N = round(tf/h); %number of iterations
qc = zeros(1, N); %x
qc_dash = zeros(1, N); %y  
t = zeros(1, N);
Vout = zeros(1, N);

%input voltage
%%step function of 5 volt
%Vin = @(t)5*heaviside(t);

%%Impulse with Exponential Decay
Tau = 3*(10^-6);
Vin = @(t)5*exp(-(t.^2)/Tau);

%%Square Wave (5Hz, 100Hz, 500Hz)
%Vin = @(t)5*square(2*pi*5*t);


%%Sine Wave (5Hz, 100Hz, 500Hz)
%Vin = @(t)5*sin(2*pi*5*t);

%the coupled equation
func1 = @(t, qc, qc_dash)qc_dash; 
func2 = @(t, qc, qc_dash)(Vin(t) - qc/C - R*qc_dash)/L; 


%the initial condition
qc_dash(1) = 0; 
qc(1) = 500*(10.^-9); 
t(1) = 0;

%Runge Kutta
for i = 1 : N - 1
    t(i + 1) = t(i) + h;
    [qc(i + 1), qc_dash(i + 1)] = RK4second(t(i), qc(i), qc_dash(i), h, func1, func2); 
    Vout(i) = R*qc_dash(i);
end

%Plot the input function
plot(t, Vin(t));

%Plot the output of the system
figure
plot(t, Vout);
xlabel('Time');
ylabel('Amplitude');
end
