clear;
%intial values
ts = 0;     
is = 0;
tf = 0.03; 

%params
R = 0.5;
L = 0.0015;


%input vin
A = 6;
T = 0.00015;

vin = @(t) A * cos(2*pi*t/T);
func = @(t, iout) (vin(t) - iout*R) / L;      % define func


figure;
for ind=16:28 % choose these carefully

    h1=2^(-ind); % set stepsize
    
    %obtaining the exact solution with favorite method
    [t, i_Exact] = exact_solution(R,L,T,tf,h1);
    exact = vin(t) - R*i_Exact;

    [t, iout_ralston] = ralston(func, ts, tf, is, h1);
    vout_ralston = vin(t) - R*iout_ralston;

    error_ralston = exact - vout_ralston; 
    error_ralston = max(abs(error_ralston));

    [t, iout_heun] = heun_temp(func, ts, tf, is, h1);
    vout_heun = vin(t) - R*iout_heun;
    
    error_heun = exact - vout_heun; 
    error_heun = max(abs(error_heun));
    
    [t, iout_midpoint] = midpoint(func, ts, tf, is, h1);
    vout_midpoint = vin(t) - R*iout_midpoint;

    error_midpoint = exact - vout_midpoint; 
    error_midpoint = max(abs(error_midpoint));


   % comparision graphs (Heun, Midpoint and Ralston)
   hold on;
   plot(log(h1), log(error_ralston), 'r*','DisplayName', 'Ralston(loglog)error');
   plot(log(h1), log(error_heun), 'g*', 'DisplayName', 'Heun(loglog)error'); 
   plot(log(h1), log(error_midpoint), 'b*','DisplayName', ' Midpoint(loglog)eror'); 

   legend('show')

    xlabel({'Step size', '(h)'});
    ylabel({'Error', '(volts)'});
    title('ERROR COMPARISON');
    hold on;

end
