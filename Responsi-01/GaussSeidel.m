% Fungsi metode iterasi Gauss-Seidel untuk menyelesaikan A*x = b
function [x, iter, riwayat] = GaussSeidel(A, b, tol, max_iter)
    n = length(b);
    x = zeros(n,1);                     % tebakan awal = 0
    riwayat = zeros(max_iter, n+1);     % menyimpan x dan selisih tiap iterasi
    iter = max_iter;

    for k = 1:max_iter
        x_lama = x;

        % nilai terbaru langsung dipakai pada perhitungan variabel berikutnya
        for i = 1:n
            jumlah = A(i,:)*x - A(i,i)*x(i);
            x(i) = (b(i) - jumlah) / A(i,i);
        end

        selisih = max(abs(x - x_lama));
        riwayat(k,:) = [x' selisih];

        % berhenti bila selisih antar-iterasi tidak lebih dari toleransi
        if selisih <= tol
            iter = k;
            break;
        end
    end
    riwayat = riwayat(1:iter,:);
end


