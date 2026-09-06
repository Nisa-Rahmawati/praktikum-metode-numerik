% ===================================================
% Tugas 1: Cek Instalasi GNU Octave
% Nama   : Nisa Rahmawati
% Prodi  : Informatika UNS
% ===================================================

clc;
clear;

disp('========================================');
disp('   UJI INSTALASI GNU OCTAVE BERHASIL    ');
disp('========================================');

% Menampilkan versi Octave
printf('Versi GNU Octave yang terinstal: %s\n\n', version());

% Uji operasi matriks sederhana
A = [1 2; 3 4];
B = [5 6; 7 8];
C = A * B;

disp('Hasil Pengujian Perkalian Matriks (A * B):');
disp(C);
