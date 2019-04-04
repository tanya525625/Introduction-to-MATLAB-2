a = 0;
b = 10;
n = 100;
x0 = 1.0;
y0 = -4.1;
timespan = linspace(a, b, n);
[T1,x1] = ode45(@eq1, timespan, [x0; y0]);

[T2,x2] = ode45(@eq2, timespan, [x0; y0]);

figure
title('y'''' = 16.81y ');
grid on;
hold on;
plot(T1, x1);

figure
title('y'''' + 8.2y'' + 16.81y   = 0');
grid on;
hold on;
plot(T2, x2);

function res = eq1(t,y)
    res = [y(2); 16.81*y(1)];
end

function res = eq2(t,y)
    res = [y(2); -8.2*y(2)-16.81*y(1)];
end


