% RESPONSI 1 - KASUS 2 : SPL harga bahan makanan per kg
clc; clear;

% ----- 1. Data belanja (semua satuan sudah dikonversi ke kg) -----
% kolom : beras, telur, tepung, ayam
nama_orang = {'Adel', 'Briza', 'Caca', 'Dinda'};
nama_bahan = {'Beras', 'Telur', 'Tepung', 'Ayam'};
A = [2.5  1.5   5    0.5;       % Adel
     4    0.75  1    2;         % Briza
     2    1.5   0.5  6;         % Caca
     1    4.25  2    0.9];      % Dinda
b = [161000; 149000; 251500; 173000];
n = length(b);

tol      = 0.0001;              % toleransi iterasi
max_iter = 100;                 % batas maksimum iterasi

fprintf('===== KASUS 2 : HARGA BAHAN MAKANAN PER KG =====\n\n');
fprintf('Matriks A (kg) dan vektor b (Rp), urutan asli :\n');
for i = 1:n
    fprintf('%10.4f%10.4f%10.4f%10.4f%12.0f\n', A(i,:), b(i));
end

% ----- 2. Pemeriksaan dominan diagonal (urutan asli) -----
d = abs(diag(A));
s = sum(abs(A), 2) - d;
fprintf('\nPemeriksaan dominan diagonal (urutan asli) :\n');
fprintf('%-8s%10s%14s   %s\n', 'Baris', '|aii|', 'Jumlah |aij|', 'Dominan?');
for i = 1:n
    if d(i) > s(i), ya = 'Ya'; else ya = 'Tidak'; end
    fprintf('%-8s%10.4f%14.4f   %s\n', nama_orang{i}, d(i), s(i), ya);
end

% jari-jari spektral matriks iterasi Gauss-Seidel : T = -(D+L)^-1 * U
D = diag(diag(A));  L = tril(A, -1);  U = triu(A, 1);
rho_asli = max(abs(eig(-(D+L) \ U)));
fprintf('Jari-jari spektral Gauss-Seidel (urutan asli) : %.4f\n', rho_asli);

% ----- 3. Mencari urutan persamaan yang dominan diagonal -----
P = perms(1:n);
urutan = [];
for k = 1:size(P,1)
    B  = A(P(k,:), :);
    dd = abs(diag(B));
    ss = sum(abs(B), 2) - dd;
    if all(dd > ss)
        urutan = P(k,:);
        break;
    end
end

fprintf('\nUrutan persamaan baru :');
fprintf(' %s', nama_orang{urutan});
fprintf('\n');

A2 = A(urutan, :);
b2 = b(urutan);
fprintf('Matriks A dan vektor b setelah urutan persamaan ditukar :\n');
for i = 1:n
    fprintf('%10.4f%10.4f%10.4f%10.4f%12.0f\n', A2(i,:), b2(i));
end

d2 = abs(diag(A2));
s2 = sum(abs(A2), 2) - d2;
fprintf('\nPemeriksaan dominan diagonal (urutan baru) :\n');
fprintf('%-8s%10s%14s   %s\n', 'Baris', '|aii|', 'Jumlah |aij|', 'Dominan?');
for i = 1:n
    if d2(i) > s2(i), ya = 'Ya'; else ya = 'Tidak'; end
    fprintf('%-8s%10.4f%14.4f   %s\n', nama_orang{urutan(i)}, d2(i), s2(i), ya);
end
D = diag(diag(A2));  L = tril(A2, -1);  U = triu(A2, 1);
rho_baru = max(abs(eig(-(D+L) \ U)));
fprintf('Jari-jari spektral Gauss-Seidel (urutan baru) : %.4f\n', rho_baru);

% ----- 4. Iterasi Gauss-Seidel -----
[x, iter, riwayat] = GaussSeidel(A2, b2, tol, max_iter);

fprintf('\nIterasi Gauss-Seidel (tol = %g, maksimum %d iterasi) :\n', ...
        tol, max_iter);
fprintf('%-5s%14s%14s%14s%14s%14s\n', ...
        'k', 'Beras', 'Telur', 'Tepung', 'Ayam', 'Selisih');
for k = 1:iter
    fprintf('%-5d%14.4f%14.4f%14.4f%14.4f%14.6f\n', k, riwayat(k,:));
end
fprintf('Konvergen pada iterasi ke-%d\n', iter);

% ----- 5. Hasil dan verifikasi -----
fprintf('\nHarga bahan makanan per kg :\n');
for j = 1:n
    fprintf('%-8s: Rp %10.2f\n', nama_bahan{j}, x(j));
end

fprintf('\nVerifikasi pada persamaan semula (urutan asli) :\n');
fprintf('%-8s%16s%16s%14s\n', 'Nama', 'A*x', 'Total belanja', 'Selisih');
hitung = A*x;
for i = 1:n
    fprintf('%-8s%16.4f%16.0f%14.6f\n', nama_orang{i}, hitung(i), ...
            b(i), hitung(i) - b(i));
end

x_pembanding = A \ b;
fprintf('\nPembanding (A\\b), galat maksimum terhadap Gauss-Seidel : %.6e\n', ...
        max(abs(x - x_pembanding)));
