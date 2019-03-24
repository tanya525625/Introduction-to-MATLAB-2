timespan = linspace(1,10,100);
[T1,x1] = ode45(@pendMotion1, timespan, [0; 5]);

timespan = linspace(1,10,100);
[T2,x2] = ode45(@pendMotion2, timespan, [0; 5]);

timespan = linspace(1,10,100);
[T3,x3] = ode45(@pendMotionLin1, timespan, [0; 3]);

timespan = linspace(1,10,100);
[T4,x4] = ode45(@pendMotionLin2, timespan, [0; 3]);

figure
grid on;
hold on;
plot(T1, x1);
plot(T3, x3);

figure
grid on;
hold on;
plot(T2, x2);
plot(T4, x4);


function res = pendMotion1(t,y)
    res = [y(2); -sin(y(1))];
end

function res = pendMotion2(t,y)
    m = 0.4;
    res = [y(2); -m.*y(2)-sin(y(1))];
end

function res = pendMotionLin1(t,y)
    res = [y(2); -y(1)];
end

function res = pendMotionLin2(t,y)
    m = 0.4;
    res = [y(2); -m.*y(2)-y(1)];
end

