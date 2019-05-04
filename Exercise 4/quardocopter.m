height = 100;
weight = 3;
timespan = [0 50];
z_initial = 0;

coeffs = fminsearch(@(coeffs) J(z_initial, height, coeffs, timespan,weight), [0 0]);

kp = coeffs(1);
kd = coeffs(2);

[t,z] = ode45(@(t,z) movement_equation(kp, kd, z, height, weight), timespan, [z_initial; 0]);
hold on;
plot(t,z(:,1));

function res = smoothness(z, u, z_change)
    res = (z(:,1)-z_change).^2 + z(:,2).^2 + u.^2;
end

function dydt = movement_equation(kp, kd, z, z_change, weight)
    dydt = [z(2);(-kp.*(z(1)-z_change)-kd.*z(2))./weight];
end

function res = J(z_initial, z_change, coeffs, time_span, weight)
    kp = coeffs(1);
    kd = coeffs(2);
    [t,z] = ode45(@(t,z) movement_equation(kp, kd, z, z_change, weight), time_span, [z_initial; 0]);
    u = T(kp, kd, z, z_change, weight);
    values = smoothness(z, u, z_change);
    res = 0;
    for i = 2 : length(t)
        res = res + (t(i)-t(i-1))*(values(i)+values(i-1))/2;
    end
end

function res = T(kp, kd, z, z_change, weight)
    res = kp.*(z(:,1)-z_change) + kd.*z(:,2) + weight.*9.8;
end