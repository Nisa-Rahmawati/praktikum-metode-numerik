% Praktikum 6 - Sistem Persamaan Linear 2
% Metode Eliminasi Gauss
function [x, Ab, waktu] = gauss_spl(A, b)
    n = length(b);

    tic;
    Ab = [A b];

    % ----- Forward Elimination -----
    for j = 1:n-1
        for i = j+1:n
            m = Ab(i,j) / Ab(j,j);
            Ab(i,:) = Ab(i,:) - m * Ab(j,:);
        end
    end

    % ----- Back Substitution -----
    x = zeros(n,1);
    x(n) = Ab(n,n+1) / Ab(n,n);
    for j = n-1:-1:1
        x(j) = (Ab(j,n+1) - Ab(j,j+1:n) * x(j+1:n)) / Ab(j,j);
    end
    waktu = toc;
end



