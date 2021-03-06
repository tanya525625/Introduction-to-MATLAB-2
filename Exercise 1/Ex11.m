a = 0;
b = 10;
n = 100;
h = (b-a)/n;
x = a:h:b;
fun = @(x, y) sqrt(1-y^2);
y = zeros(1, length(x));
y(1)=0;

y = Euler(x, y, h, fun);
plot(x, y);

ode_options = odeset('AbsTol', 1e-6, 'RelTol', 1e-7);
[T, x] = ode45(@(x,y)sqrt(1-y^2), x, y(1), ode_options);
hold on
plot(T, x)

legend('Euler method', '4-order Runge-Kutta method');