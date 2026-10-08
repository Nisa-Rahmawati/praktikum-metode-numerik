% Praktikum 6 - Sistem Persamaan Linear 2
% Metode Dekomposisi LU
function [x, L, U, y, waktu] = lu_spl(A, b)
    n = length(b);

    tic;
    L = eye(n);
    U = A;

    % ----- Dekomposisi A = L*U -----
    for j = 1:n-1
        for i = j+1:n
            m = U(i,j) / U(j,j);
            L(i,j) = m;
            U(i,:) = U(i,:) - m * U(j,:);
        end
    end

    % ----- Forward Substitution: L*y = b -----
    y = zeros(n,1);
    y(1) = b(1) / L(1,1);
    for i = 2:n
        y(i) = (b(i) - L(i,1:i-1) * y(1:i-1)) / L(i,i);
    end

    % ----- Backward Substitution: U*x = y -----
    x = zeros(n,1);
    x(n) = y(n) / U(n,n);
    for i = n-1:-1:1
        x(i) = (y(i) - U(i,i+1:n) * x(i+1:n)) / U(i,i);
    end
    waktu = toc;
end
