function RLC_script(f,h)
%initailise the circuits 
R = 280;
L = 600*10^(-3);
C = 3*60^(-6);
tf = 1/f;
N = round(tf/h,0);

qc_dash = zeros(1,N);
qc = zeros(1,N);
t = zeros(1,N);
Vout = zeros(1,N);

%input voltage
Vin = @(t)5;

%the coupled equation
func1 = @(t,qc,qc_dash)qc_dash;
func2 = @(t,qc,qc_dash)(Vin(t) - qc/C - R*qc_dash) / L;

%the initial condition
t(1) = 0;
qc(1) = 500*10^(-9);
qc_dash(1) = 0;

%Rouge Kutta
for i = 1 : N -1
    [qc(i+1),qc_dash(i+1)] = RK4second(t(i),qc(i),qc_dash(i),h,func1,func2);
    t(i + 1) = t(i) + h;
    Vout(i) = R*qc_dash(i);
end

%plot
plot(Vout);
xlabel('Time');
ylabel('Amplitude');

end
