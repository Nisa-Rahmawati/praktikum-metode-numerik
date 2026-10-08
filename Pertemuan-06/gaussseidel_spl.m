% Praktikum 6 - Sistem Persamaan Linear 2
% Metode Iterasi Gauss-Seidel
function [x, iter, konvergen, riwayat, waktu] = gaussseidel_spl(A, b, tol, max_iter)
    n = length(b);

    tic;
    x = zeros(n,1);
    riwayat = zeros(max_iter, n);
    konvergen = false;
    iter = 0;

    for k = 1:max_iter
        x_lama = x;
        for i = 1:n
            jumlah = A(i,:) * x - A(i,i) * x(i);
            x(i) = (b(i) - jumlah) / A(i,i);
        end
        riwayat(k,:) = x';
        iter = k;

        if max(abs(x - x_lama)) <= tol
            konvergen = true;
            break;
        end
    end
    riwayat = riwayat(1:iter,:);
    waktu = toc;
end
