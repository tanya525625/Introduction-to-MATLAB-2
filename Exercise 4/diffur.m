function [t,z] = diffur(k)
    kp = k(1);
    kd = k(2);
    zstar = 200;
    x = linspace(0, 50, 100);
    matrixDiff = [0 1; -kp -kd];
    column = [0; kp*zstar];
    slay = @(t, z) (matrixDiff*z + column);
    [t, z] = ode45(slay, x, [0; 0]);
end