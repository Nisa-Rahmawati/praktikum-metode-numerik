% RESPONSI 1 - KASUS 1 : Galat dan Error Pemotongan
% Gelombang air laut : h = h0*(cos(t*v/lambda) + e^x)
% cos(z) dan e^x didekati dengan deret Maclaurin sebanyak n suku
clc; clear; close all;

% ----- 1. Data / parameter -----
lambda = 12;
v      = 36;
x      = 10;
h0     = 5;
n_list = [23 24 25];        % batas iterasi (jumlah suku deret)
t      = 0:0.01:5;          % rentang waktu 0 <= t <= 5
z      = t*v/lambda;        % sudut pada cos : t*v/lambda
toleransi = 1;              % batas toleransi error (%)

% ----- 2. Perhitungan eksak -----
h_eksak = h0*(cos(z) + exp(x));

% ----- 3. Perhitungan pendekatan (deret Maclaurin) -----
jml = length(n_list);
h_aprx = zeros(jml, length(t));
e_aprx = zeros(jml, 1);
for m = 1:jml
    n = n_list(m);

    cos_aprx = zeros(size(z));      % pendekatan cos(z)
    exp_aprx = 0;                   % pendekatan e^x
    for k = 0:n-1
        cos_aprx = cos_aprx + (-1)^k * z.^(2*k) / factorial(2*k);
        exp_aprx = exp_aprx + x^k / factorial(k);
    end

    h_aprx(m,:) = h0*(cos_aprx + exp_aprx);
    e_aprx(m)   = exp_aprx;
end

% ----- 4. Galat terhadap hasil eksak -----
selisih        = abs(repmat(h_eksak, jml, 1) - h_aprx);
galat_relatif  = selisih ./ repmat(abs(h_eksak), jml, 1) * 100;
rerata_mutlak  = mean(selisih, 2);
rerata_relatif = mean(galat_relatif, 2);

% ----- 5. Menampilkan hasil -----
fprintf('===== KASUS 1 : GELOMBANG AIR LAUT =====\n');
fprintf('lambda = %g, v = %g, x = %g, h0 = %g\n', lambda, v, x, h0);
fprintf('Rentang t : 0 sampai 5 (%d titik, langkah 0.01)\n', length(t));
fprintf('e^x eksak : %.6f\n\n', exp(x));

fprintf('Pendekatan e^x :\n');
fprintf('%-6s%18s%22s\n', 'n', 'e^x pendekatan', '|e^x - pendekatan|');
for m = 1:jml
    fprintf('%-6d%18.6f%22.6f\n', n_list(m), e_aprx(m), ...
            abs(exp(x) - e_aprx(m)));
end

fprintf('\nNilai h(t) pada beberapa titik t :\n');
fprintf('%-6s%16s%16s%16s%16s\n', 't', 'h eksak', 'n = 23', 'n = 24', 'n = 25');
for ts = 0:5
    i = round(ts/0.01) + 1;
    fprintf('%-6g%16.4f%16.4f%16.4f%16.4f\n', t(i), h_eksak(i), ...
            h_aprx(1,i), h_aprx(2,i), h_aprx(3,i));
end

fprintf('\nGalat terhadap hasil eksak :\n');
fprintf('%-6s%22s%22s   %s\n', 'n', 'Rerata galat mutlak', ...
        'Rerata galat relatif', 'Keterangan');
for m = 1:jml
    if rerata_relatif(m) < toleransi
        ket = 'Layak (< 1%)';
    else
        ket = 'Tidak layak';
    end
    fprintf('%-6d%22.6f%21.6f%%   %s\n', n_list(m), rerata_mutlak(m), ...
            rerata_relatif(m), ket);
end

% ----- 6. Tambahan : pengaruh n terhadap rerata galat relatif -----
fprintf('\nPengaruh n terhadap rerata galat relatif :\n');
fprintf('%-6s%22s\n', 'n', 'Rerata galat relatif');
for n = 16:25
    cos_aprx = zeros(size(z));
    exp_aprx = 0;
    for k = 0:n-1
        cos_aprx = cos_aprx + (-1)^k * z.^(2*k) / factorial(2*k);
        exp_aprx = exp_aprx + x^k / factorial(k);
    end
    h_n = h0*(cos_aprx + exp_aprx);
    rel = mean(abs(h_eksak - h_n) ./ abs(h_eksak)) * 100;
    fprintf('%-6d%21.6f%%\n', n, rel);
end

% ----- 7. Grafik -----
% Gambar 1 : keempat fungsi dalam satu plot
figure(1);
plot(t, h_eksak, 'k-', t, h_aprx(1,:), 'r--', ...
     t, h_aprx(2,:), 'g-.', t, h_aprx(3,:), 'b:');
xlabel('t'); ylabel('h(t)');
title('Perbandingan h(t) eksak dan pendekatan');
legend('Eksak', 'n = 23', 'n = 24', 'n = 25');
grid on;
