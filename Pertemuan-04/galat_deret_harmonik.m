% Tugas 2
% Menghitung galat penjumlahan 1/1 + 1/2 + ... + 1/20

% (a) Perhitungan secara eksak
total_eksak = 0;
for k = 1:20
    total_eksak = total_eksak + 1/k;
end
fprintf('(a) Eksak         = %.15f\n', total_eksak);

% (b) Masing-masing pembagian dibulatkan (2 desimal)
total_bulat = 0;
for k = 1:20
    suku = round((1/k) * 100) / 100;
    total_bulat = total_bulat + suku;
end
galat_b = abs(total_eksak - total_bulat);
fprintf('(b) Dibulatkan    = %.2f\n', total_bulat);
fprintf('    Galat (b)     = %.15f\n', galat_b);

% (c) Tanpa looping, menggunakan fungsi sum
k = 1:20;
total_sum = sum(1./k);
galat_c = abs(total_eksak - total_sum);
fprintf('(c) sum()         = %.15f\n', total_sum);
fprintf('    Galat (c)     = %.15f\n', galat_c);


