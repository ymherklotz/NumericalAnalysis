clear;
%inital
ts = 0;     % set initial value of x_0
is = 0;

%parameter
tf = 0.03;     % stop here
R = 0.5;
L = 0.0015; 



%vin and the function
A = 6;
T = 0.00015;
vin = @(t) A * cos(2*pi*t/T);
func = @(t, iout) (vin(t) - iout*R) / L;      % define func


for ind=3:16 % choose these carefully
 h1=2^(-ind); % set stepsize
 
    [t, iout, exact] = midpoint(func, ts, tf, is, h1);
    
    figure;
    plot(exact)
    
%     vout = vin - R*iout;
%     
%     error = max(abs(exact - vout)); 
%  
%     plot(log(h1),log(error),'b*'); % log/log plot stepsize vs error
%      xlabel({'Time', '(seconds)'});
%      ylabel({'Error'});
%      title('MIDPOINT');
%      hold on; % for next value to be plotted
end
