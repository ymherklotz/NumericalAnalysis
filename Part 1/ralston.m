function [xa,ya] = ralston(func, t0, tf,i0 , h)

N = round((tf) / h);
xa = zeros(1,N);
ya = zeros(1,N);
xa(1)=t0;
ya(1)=i0;

%param
a1=1/3;
a2=2/3;
p1=3/4;
q11=3/4;

for i=1: N - 1
    xtemp=xa(i);
    ytemp=ya(i); 
    
    
k1=func(xtemp,ytemp);
k2=func(xtemp+p1*h,ytemp+q11*k1*h);

ya(i+1)=ytemp+(a1*k1+a2*k2)*h;
xa(i+1)=xtemp+h;
end
