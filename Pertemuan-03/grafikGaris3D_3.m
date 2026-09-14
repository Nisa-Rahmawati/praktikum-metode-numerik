% Grafik Garis 3D - Contour Plot
x = -5:0.25:5;
y = -5:0.25:5;
[X, Y] = meshgrid(x, y);
Z = 1.7.^(-1.5*sqrt(X.^2 + Y.^2)).*cos(0.6*X).*sin(Y);
contour3(X, Y, Z, 15)
xlabel('x');
ylabel('y');
zlabel('z');
