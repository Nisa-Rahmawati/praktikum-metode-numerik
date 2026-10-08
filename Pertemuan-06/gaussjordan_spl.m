% Praktikum 6 - Sistem Persamaan Linear 2
% Metode Eliminasi Gauss-Jordan
function [x, Ab, waktu] = gaussjordan_spl(A, b)
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

    % ----- Backward Elimination -----
    for j = n:-1:2
        for i = j-1:-1:1
            m = Ab(i,j) / Ab(j,j);
            Ab(i,:) = Ab(i,:) - m * Ab(j,:);
        end
    end

    % ----- Normalisasi -----
    x = zeros(n,1);
    for j = 1:n
        x(j) = Ab(j,n+1) / Ab(j,j);
    end
    waktu = toc;
end


