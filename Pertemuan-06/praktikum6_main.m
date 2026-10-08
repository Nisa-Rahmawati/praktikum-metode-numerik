% Praktikum 6 - Sistem Persamaan Linear 2
% Program utama: menjalankan kelima metode, menghitung galat, dan running time
clc; clear;

A = [ 5 -1 -1  0  0;
     -1  5 -1 -1  0;
     -1 -1  4 -1 -1;
      0  0  1  4 -2;
      0  1 -1  1  4];
b = [-1; 2; 6; 2; -1];

tol      = 0.001;
max_iter = 20;
nama     = {'p','q','r','s','t'};
n        = length(b);

% ===== 1. ELIMINASI GAUSS =====
[x_g, Ab_g, t_g] = gauss_spl(A, b);
fprintf('===== ELIMINASI GAUSS =====\n');
fprintf('Hasil forward elimination:\n');
for i = 1:n
    fprintf('%10.4f', Ab_g(i,:)); fprintf('\n');
end
fprintf('Solusi:\n');
for i = 1:n
    fprintf('%s = %.6f\n', nama{i}, x_g(i));
end
fprintf('Waktu komputasi : %.6f detik\n\n', t_g);

% ===== 2. ELIMINASI GAUSS-JORDAN =====
[x_gj, Ab_gj, t_gj] = gaussjordan_spl(A, b);
fprintf('===== ELIMINASI GAUSS-JORDAN =====\n');
fprintf('Hasil forward + backward elimination:\n');
for i = 1:n
    fprintf('%10.4f', Ab_gj(i,:)); fprintf('\n');
end
fprintf('Solusi:\n');
for i = 1:n
    fprintf('%s = %.6f\n', nama{i}, x_gj(i));
end
fprintf('Waktu komputasi : %.6f detik\n\n', t_gj);

% ===== 3. DEKOMPOSISI LU =====
[x_lu, L, U, y, t_lu] = lu_spl(A, b);
fprintf('===== DEKOMPOSISI LU =====\n');
fprintf('Matriks L:\n');
for i = 1:n
    fprintf('%10.4f', L(i,:)); fprintf('\n');
end
fprintf('Matriks U:\n');
for i = 1:n
    fprintf('%10.4f', U(i,:)); fprintf('\n');
end
fprintf('Vektor y (L*y = b):\n');
fprintf('%10.4f', y); fprintf('\n');
fprintf('Solusi (U*x = y):\n');
for i = 1:n
    fprintf('%s = %.6f\n', nama{i}, x_lu(i));
end
fprintf('Waktu komputasi : %.6f detik\n\n', t_lu);

% ===== 4. ITERASI JACOBI =====
[x_j, it_j, kv_j, rw_j, t_j] = jacobi_spl(A, b, tol, max_iter);
fprintf('===== ITERASI JACOBI =====\n');
fprintf('%4s%12s%12s%12s%12s%12s\n', 'k', 'p', 'q', 'r', 's', 't');
for k = 1:it_j
    fprintf('%4d', k); fprintf('%12.6f', rw_j(k,:)); fprintf('\n');
end
if kv_j
    fprintf('Jacobi konvergen pada iterasi ke-%d\n', it_j);
else
    fprintf('Jacobi belum konvergen setelah %d iterasi\n', it_j);
end
fprintf('Solusi:\n');
for i = 1:n
    fprintf('%s = %.6f\n', nama{i}, x_j(i));
end
fprintf('Waktu komputasi : %.6f detik\n\n', t_j);

% ===== 5. ITERASI GAUSS-SEIDEL =====
[x_gs, it_gs, kv_gs, rw_gs, t_gs] = gaussseidel_spl(A, b, tol, max_iter);
fprintf('===== ITERASI GAUSS-SEIDEL =====\n');
fprintf('%4s%12s%12s%12s%12s%12s\n', 'k', 'p', 'q', 'r', 's', 't');
for k = 1:it_gs
    fprintf('%4d', k); fprintf('%12.6f', rw_gs(k,:)); fprintf('\n');
end
if kv_gs
    fprintf('Gauss-Seidel konvergen pada iterasi ke-%d\n', it_gs);
else
    fprintf('Gauss-Seidel belum konvergen setelah %d iterasi\n', it_gs);
end
fprintf('Solusi:\n');
for i = 1:n
    fprintf('%s = %.6f\n', nama{i}, x_gs(i));
end
fprintf('Waktu komputasi : %.6f detik\n\n', t_gs);

% ===== GALAT (nilai eksak = solusi Eliminasi Gauss) =====
x_eksak = x_g;
galat_j  = abs(x_eksak - x_j);
galat_gs = abs(x_eksak - x_gs);
fprintf('===== GALAT ABSOLUT =====\n');
fprintf('%-9s%14s%14s\n', 'Variabel', 'Jacobi', 'Gauss-Seidel');
for i = 1:n
    fprintf('%-9s%14.6e%14.6e\n', nama{i}, galat_j(i), galat_gs(i));
end
fprintf('Galat maksimum Jacobi       : %.6e\n', max(galat_j));
fprintf('Galat maksimum Gauss-Seidel : %.6e\n\n', max(galat_gs));

% ===== RUNNING TIME =====
fprintf('===== RUNNING TIME =====\n');
fprintf('Eliminasi Gauss        : %.6f detik\n', t_g);
fprintf('Eliminasi Gauss-Jordan : %.6f detik\n', t_gj);
fprintf('Dekomposisi LU         : %.6f detik\n', t_lu);
fprintf('Iterasi Jacobi         : %.6f detik\n', t_j);
fprintf('Iterasi Gauss-Seidel   : %.6f detik\n', t_gs);
