% Grafik Garis 3D - Mesh Plot
x = -8:0.5:8;
y = x;
[X, Y] = meshgrid(x, y);
R = sqrt(X.^2 + Y.^2);
Z = sin(R)./(R + 0.5);
mesh(X, Y, Z);
