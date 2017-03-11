function [qc_next,qc_dash_next] = RK4second(t,qc,qc_dash,h,func1,func2)
    %source from http://www.mymathlib.com/diffeq/runge-kutta/runge_kutta_3_8.html
    k1 = func2(t,qc,qc_dash);
    k2 = func2(t,qc + h/3, qc_dash + h*k1/3);
    k3 = func2(t,qc + 2*h/3, qc_dash - h*k1/3 + h*k2);
    k4 = func2(t,qc + h,qc_dash + h*k1 - h*k2 + h*k3);
    %yi+1 = yi + 1/8 ( k1 + 3 k2 + 3 k3 + k4 )
    %xi = x0 + i h
    qc_next = qc + h*func1(t, qc, qc_dash);
    qc_dash_next = qc_dash + h/8*(k1 + 3*k2 + 3*k3 + k4);
end