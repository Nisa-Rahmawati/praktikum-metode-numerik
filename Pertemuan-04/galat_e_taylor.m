% Tugas 1
% Menghitung galat e^0.3 menggunakan deret Taylor
% e^x = sum_{i=0}^{n} x^i / i!

x = 0.3;
eksak = exp(x);

fprintf('             Eksak = %.15f\n', eksak);

for n = 0:4
    p = 0;
    for i = 0:n
        p = p + (x^i)/factorial(i);
    end
    galat = abs(eksak - p);
    fprintf('n = %d | Pendekatan = %.15f | Galat = %.15f\n', n, p, galat);
end



