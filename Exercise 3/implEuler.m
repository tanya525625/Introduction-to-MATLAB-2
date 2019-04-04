function y = implEuler(x, y,  h, fun)
    for n=1:length(x)-1
        y(n+1) = -10000*y(n)/(1+10000*h);
    end
end