function [ x, y ] = midpoint( f, t0, tfinal, y0, h)

N = round((tfinal - t0) / h);
ya = zeros(1,N);
ta = zeros(1,N);
ya(1) = y0; 
ta(1) = t0;

for i = 1 : N - 1
    ta(i+1) = ta(i) + h;
    halfstep = ta(i) + 1 * h / 2;
    gradient1 = f(ta(i), ya(i)); 
    ypredict = ya(i) + 0.5 * h * gradient1;
    gradient2 = f(halfstep, ypredict); 
    ya(i+1) = ya(i) + h * gradient2;
end
x = ta;
y = ya;


