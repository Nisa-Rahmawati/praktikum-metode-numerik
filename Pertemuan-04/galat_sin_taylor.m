% Tugas 3
% Menghitung galat sin(x) menggunakan deret Taylor
% sin(x) = sum_{n=0}^{N} (-1)^n * x^(2n+1) / (2n+1)!

x = 1;
eksak = sin(x);

fprintf('             Eksak = %.15f\n', eksak);
for N = 1:5
    p = 0;
    for n = 0:N
        p = p + ((-1)^n) * (x^(2*n+1)) / factorial(2*n+1);
    end
    galat = abs(eksak - p);
    fprintf('N = %d | Pendekatan = %.15f | Galat = %.15f\n', N, p, galat);
end



