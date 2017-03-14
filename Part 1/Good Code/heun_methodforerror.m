function [y, t] = heun_methodforerror(f,a,b,ya,n)
h = (b - a) / n;
halfh = h / 2;
y(1,:) = ya;
t(1) = a;
for i = 1 : n
    t(i+1) = t(i) + h;
    g = f(t(i),y(i,:));
    z = y(i,:) + h * g;
    y(i+1,:) = y(i,:) + halfh * ( g + f(t(i+1),z) );
end;

%func,t0,tf,i0,step_size