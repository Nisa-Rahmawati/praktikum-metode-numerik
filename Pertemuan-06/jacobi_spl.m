% Praktikum 6 - Sistem Persamaan Linear 2
% Metode Iterasi Jacobi
function [x, iter, konvergen, riwayat, waktu] = jacobi_spl(A, b, tol, max_iter)
    n = length(b);

    tic;
    x_lama = zeros(n,1);
    x = zeros(n,1);
    riwayat = zeros(max_iter, n);
    konvergen = false;
    iter = 0;

    for k = 1:max_iter
        for i = 1:n
            jumlah = A(i,:) * x_lama - A(i,i) * x_lama(i);
            x(i) = (b(i) - jumlah) / A(i,i);
        end
        riwayat(k,:) = x';
        iter = k;

        if max(abs(x - x_lama)) <= tol
            konvergen = true;
            break;
        end
        x_lama = x;
    end
    riwayat = riwayat(1:iter,:);
    waktu = toc;
end
