function y = implEuler(x, y, h, fun)
    for n=1:length(x)-1
        y(n+1) = y(n)+ h*fun(x(n+1),y(n+1));
    end
end