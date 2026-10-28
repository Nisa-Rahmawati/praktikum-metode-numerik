% RESPONSI 1 - KASUS 3 : Persamaan non-linear (tabung dan bola)
% Memakai fungsi Biseksi.m dari materi praktikum (harus satu folder)
clc; clear; close all;

% ----- 1. Data dan perumusan persamaan -----
V_bola = 300;                      % volume bola (cm^3)
% bola menyentuh dinding dan tutup tabung, sehingga t = 2r :
%   V_bola : V_tabung = (4/3)*pi*r^3 : pi*r^2*(2r) = 2 : 3
V_tabung = V_bola * 3/2;           % volume tabung
V_luar   = V_tabung - V_bola;      % volume tabung di luar bola

% persamaan non-linear : (2/3)*pi*r^3 - V_luar = 0
f = @(r) (2/3)*pi*r.^3 - V_luar;

fprintf('===== KASUS 3 : TABUNG DAN BOLA =====\n');
fprintf('Volume bola                 : %.6f cm^3\n', V_bola);
fprintf('Volume tabung               : %.6f cm^3\n', V_tabung);
fprintf('Volume tabung di luar bola  : %.6f cm^3\n', V_luar);
fprintf('Persamaan : f(r) = (2/3)*pi*r^3 - %g = 0\n\n', V_luar);

% ----- 2. Metode grafik untuk menentukan nilai awal -----
r = linspace(0, 6);
figure(1);
plot(r, f(r));
line([0, 6], [0, 0])              % sumbu r
line([0, 0], [-200, 350])         % sumbu f(r)
xlabel('r (cm)'); ylabel('f(r)');
title('Grafik f(r) = (2/3)*pi*r^3 - 150');

% dari grafik, kurva memotong sumbu r di antara r = 3 dan r = 5
a = 3;
b = 5;
hold on;
plot([a b], [f(a) f(b)], 'ro');
text(4.3, -70, 'Akar');
text(0.2, 250, 'f(r) = (2/3)*pi*r^3-150');
hold off;

fprintf('Nilai awal dari grafik : a = %g, b = %g\n', a, b);
fprintf('f(a) = %.6f, f(b) = %.6f\n', f(a), f(b));

% ----- 3. Metode biseksi -----
n   = 20;                          % batas iterasi
tol = 10^-4;                       % batas toleransi error
r_akar = Biseksi(f, a, b, n, tol);

% ----- 4. Hasil -----
t_akar = 2 * r_akar;               % tinggi tabung
fprintf('\nJari-jari bola dan tabung (r)  : %.6f cm\n', r_akar);
fprintf('Tinggi tabung (t = 2r)         : %.6f cm\n', t_akar);

% ----- 5. Verifikasi -----
fprintf('\nVerifikasi :\n');
fprintf('Volume bola   = (4/3)*pi*r^3   = %.6f cm^3\n', (4/3)*pi*r_akar^3);
fprintf('Volume tabung = pi*r^2*t       = %.6f cm^3\n', pi*r_akar^2*t_akar);
fprintf('Volume di luar bola            = %.6f cm^3\n', ...
        pi*r_akar^2*t_akar - (4/3)*pi*r_akar^3);

r_analitik = (3*V_luar/(2*pi))^(1/3);
fprintf('r analitik = (3*V/(2*pi))^(1/3) = %.6f cm\n', r_analitik);
fprintf('Galat |r analitik - r biseksi|  = %.6e\n', abs(r_analitik - r_akar));
