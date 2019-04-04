a = 1;
b = 50;
n = 100;
h = (b-a)/n;
x = a:h:b;
fun = @(x, y)(-10000*y);
y = zeros(1, length(x));
y(1)=0;

y1 = ExplEuler(x, y, h, fun);
y2 = implEuler(x, y, h, fun);
plot(x, y1);
plot(x, y2);
