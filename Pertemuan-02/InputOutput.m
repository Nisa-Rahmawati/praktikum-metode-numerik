% TEORI INPUT-OUTPUT MATLAB

% [KASUS 1] Menggunakan Teori 1: fprintf (tanpa \n) digabung dengan disp
umur = input('Masukkan umur Anda saat ini: ');

fprintf('Umur yang Anda masukkan adalah ');
disp(umur);
fprintf('\n');


% [KASUS 2] Menggunakan Teori 2: fprintf penuh dengan penentu format (%g\n)
tinggi = input('Masukkan tinggi badan Anda (cm): ');

fprintf('Tinggi badan Anda telah tersimpan, yaitu %g cm.\n', tinggi);
fprintf('\n');

% [KASUS 3] Menggunakan Teori 3: Dua fungsi disp secara terpisah
nilai = input('Masukkan nilai ujian Metode Numerik Anda: ');

disp('Nilai ujian yang Anda peroleh adalah: ')
disp(nilai);



