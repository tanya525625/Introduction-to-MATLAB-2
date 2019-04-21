x0 = 2;
xn = 2.5;
a = 1;
b = 2;
n = 10000;
d = (b-a)/n;
q = (b-a)/4;
y = ([a,a+q,a+2*q,a+3*q,b]);
x = ([x0,x0+q,x0+2*q,x0+3*q,xn]);

e2 = 10e-5;
e1 = 10e-5;

exit = false;
ev = zeros(size(x));
f1 = false;
f2 = false;

for j = 1:300
    if (exit)
        break;
    end
    f1 = false;
    for k = 1:length(x)-1 
       ev(k + 1) = 1;
       if (exit)
           break;
       end
       gr = grad(x, y);
       if (sum(abs(gr)) < e1)
           exit = true;
       end
       tk = 0.5;
       x_new = x - tk * (gr(k+1)) .* ev;
       while (integral(x_new, y) - integral(x, y) >= 0)
            tk = tk / 2;
            x_new = x - tk * (gr(k+1)) .* ev;
       end
       if (sum(abs(x_new - x)) < e2 || abs(integral(x_new, y) - integral(x, y)) < e2)
           f1 = true;
           if f2
               exit = true;
           end
       end
       x(2:length(x) - 1) = x_new(2:length(x) - 1);
       ev(k + 1) = 0;
    end
    f2 = f1;
end

xx = linspace(1, 2, 10000);

f = lagrange(y, x, xx);

plot(xx, f, 'go');

integral(x, y)

function res = grad(x, y)
    eps = 0.00001;
    shift = zeros(size(x));
    res = zeros(size(x));
    J = integral(x, y);
    for i=1:length(x)
        shift(i) = eps;
        res(i) = (integral(x + shift, y) - J) / eps;
        shift(i) = 0;
    end
end

function res = integral(x, y)
    fun_x_coef = polyfit(y, x, 5);
    der_x_coef = polyder(fun_x_coef);
    rng = linspace(1, 2, 2000);
    
    fun_x = polyval(fun_x_coef, rng);
    der_x = polyval(der_x_coef, rng);
    delta = rng(2) - rng(1);
    
    F = rng .* (der_x .^ 2) + (fun_x .^2) ./ rng;
    
    res = sum(F * delta);
end

function L = lagrange(x,y,xx)
    N = length(x);
    L=zeros(size(xx));
    for k=1:N
        t=ones(size(xx));
        for j=[1:k-1, k+1:N]
            t=t.*(xx-x(j))/(x(k)-x(j));
        end
        L = L + y(k)*t;
    end
end 
