% Grafik Garis 2D - Percobaan 4
x = 0:0.01:2*pi;
y = 8*sin(3*x) - 4*cos(2*x);
z = 3*sin(10*x).*-2.*cos(6*x);
plot(x, y, x, z);
