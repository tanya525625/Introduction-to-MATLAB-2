clc;
clear;
k = [15,40];
k_opt = fminsearch(@integral,k)
[t,z] = diffur(k_opt);
figure;
plot(t,z(:,1)), title('������ Z (����� ������)');
grid, hold on;