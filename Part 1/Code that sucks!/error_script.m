%-----------------------------------------------------------------
clear;
ts = 0;     % set initial value of x_0
is = 0;
h = 0.0001;  % set step-size
tf = 0.03;     % stop here
R = 0.5;
L = 0.0015;

A = 6;
T = 0.00015;

vin = @(t) A * cos(2*pi*t/T);
func = @(t, iout) (vin(t) - iout*R) / L;      % define func
[t, iout ] = midpoint(func, ts, tf, is, h);

%numerical solution
vout = vin(t) - iout * R;

%obtaining the exact solution with favorite method
i_Exact = (6/L)*((2*pi)/T * sin((2*pi)/T*t) + (R/L)*cos((2*pi)/T*t) - (R/L)*exp(-(R/L)*t))/((2*pi)/T^2 + (R/L)^2);
exact = vin(t) - R*i_Exact;

%error as a function of t
error = exact - vout; 

figure(1);
plot(t,error); %for midpoint

figure(2);

for ind=3:16 % choose these carefully
 h1=2^(-ind); % set stepsize
 
 
    [t, iout] = midpoint(func, ts, tf, is, h1);
    exact = vin(t) - R*i_Exact(t)  ;
    vout = vin(t) - R*iout;
    error = max(abs(exact - vout)); 
    
    plot(log(h1),log(error),'b*'); % log/log plot stepsize vs error
     xlabel({'Time', '(seconds)'});
     ylabel({'Error'});
     title('MIDPOINT');
     hold on; % for next value to be plotted
end



% 
% %--------------------------------------------------------------------
% 
% clear;
% ts = 0;     % set initial value of x_0
% is = 0;
% h = 0.0000005;  % set step-size
% tf = 0.03;     % stop here
% R = 0.5;
% L = 0.0015;
% 
% A = 6;
% T = 0.00015;
% 
% vin = @(t) A * cos(2*pi*t/T);
% func = @(t, iout) (vin(t) - iout*R) / L;      % define func
% [t, iout ] = ralston(func, ts, tf, is, h);
% 
% %numerical solution 
% vout = vin(t) - iout * R;
% 
% %obtaining the exact solution with favorite method
% i_Exact = @(t) (6/L)*((2*pi)/T * sin((2*pi)/T*t) + (R/L)*cos((2*pi)/T*t) - (R/L)*exp(-(R/L)*t))/((2*pi)/T^2 + (R/L)^2);
% exact = vin(t) - R*i_Exact(t);
% 
% %error as a function of t
% error = abs(exact - vout); 
% 
% figure(3);
% plot(t,error); %for ralston
% 
% 
% 
% figure(4);
% 
% for ind=3:16 % choose these carefully
%  h1=2^(-ind); % set stepsize
%  
%  
%     [t, iout] = ralston(func, ts, tf, is, h1);
%     exact = vin(t) - R*i_Exact(t)  ;
%     vout = vin(t) - R*iout;
%     error = max(abs(exact - vout)); 
%     
%     plot(log(h1),log(error)); % log/log plot stepsize vs error
%      xlabel({'Time', '(seconds)'});
%      ylabel({'Error'});
%      title('V_{out} versus time (original function)');
%      hold on; % for next value to be plotted
% end


