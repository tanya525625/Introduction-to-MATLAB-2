a = 1;
b = 1;
timespan = linspace(1,10,10);
clock_start = cputime; 
[T1,x1] = ode45(@fun, timespan, [a; b]);
time_ode45 = cputime - clock_start

clock_start = cputime; 
[T2,x2] = ode23s(@fun, timespan, [a; b]);
time_ode23s = cputime - clock_start

figure
grid on;
hold on;
plot(T1, x1);

figure
grid on;
hold on;
plot(T2, x2);

function res = fun(t,y)
    res = [y(2); -100000.001.*y(2)-100.*y(1)];
end

