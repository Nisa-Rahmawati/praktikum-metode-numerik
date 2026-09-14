% Grafik Garis 2D - Percobaan 3
% Menggunakan linspace serta menambahkan label sumbu dan judul grafik
x = linspace(0, 30);
y = sin(x/2).*exp(-x/8);
plot(x, y);
xlabel('Sumbu X')
ylabel('Sumbu Y')
title('Grafik persamaan f(x)=sin(x/2).*exp(-x/8)')
