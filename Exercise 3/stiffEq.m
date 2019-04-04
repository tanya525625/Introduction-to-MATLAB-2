a = 1;
b = 1;
timespan = linspace(1,10,10);
[T1,x1] = ode45(@fun, timespan, [a; b]);

[T2,x2] = ode23s(@fun, timespan, [a; b]);

figure
grid on;
hold on;
plot(T1, x1);

figure
grid on;
hold on;
plot(T2, x2);

function res = fun(t,y)
    res = [y(2); 100000.001.*y(2)+100.*y(1)];
end

