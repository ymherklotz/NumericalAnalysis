function [x,y] = heun(func, xa, ya, h)

%caluclaye next x buy incrementing by the stepsize
x = xa + h;

gradient1 = feval(func, xa, ya); %calculate the gradient at t
ypredictor=ya+h*gradient1;        %calculate predictor for the next value of y
gradient2=feval(func, x, ypredictor);  %calculate the gradient at t + h
y = ya + h/2*(gradient1 + gradient2);

end