function [ t, i_Exact ] = exact_solution(R,L,T,tfinal, h)

N = round((tfinal) / h);
t = zeros(1,N);
i_Exact = zeros(1,N);
for i = 1 : N - 1
    t(i+1) = t(i) + h;
    i_Exact(i+1) = (6/L)*((2*pi)/T * sin((2*pi)/T*t(i)) + (R/L)*cos((2*pi)/T*t(i)) - (R/L)*exp(-(R/L)*t(i)))/((2*pi)/T^2 + (R/L)^2);
end
