function [xnext, ynext] = RK4second(t, x, y, h, f1, f2)
    %source from http://www.mymathlib.com/diffeq/runge-kutta/runge_kutta_3_8.html
    ky1 = f2(t, x, y);
    ky2 = f2(t, x + h/3, y + h*ky1/3);
    ky3 = f2(t, x + 2*h/3, y - h*ky1/3 + h*ky2);
    ky4 = f2(t, x + h, y + h*ky1 - h*ky2 + h*ky3);
    %yi+1 = yi + 1/8 ( k1 + 3 k2 + 3 k3 + k4 )
    %xi = x0 + i h
    xnext = x + h*f1(t, x, y);
    ynext = y + h/8*(ky1 + 3*ky2 + 3*ky3 + ky4);
end
