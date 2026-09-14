% Grafik Garis 3D - Line Plot
t = 0:0.1:7*pi;
x = sqrt(t).*cos(4*t);
y = sqrt(t).*sin(4*t);
z = 0.6*t;
plot3(x, y, z, 'm', 'linewidth', 1);
grid on
xlabel('x');
ylabel('y');
zlabel('z');
