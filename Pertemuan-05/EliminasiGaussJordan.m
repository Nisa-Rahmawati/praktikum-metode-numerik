% Praktikum 5 - Sistem Persamaan Linear
% Metode Eliminasi Gauss-Jordan

A = [ 2  1 -1;
      4  3  1;
     -2  1  2];
b = [3; 9; 4];

n = length(b);
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

fprintf('Hasil setelah forward + backward elimination:\n');
disp(Ab);

% ----- Normalisasi (bagi tiap baris dengan elemen diagonalnya) -----
x = zeros(n,1);
for j = 1:n
    x(j) = Ab(j,n+1) / Ab(j,j);
end

fprintf('\nSolusi Eliminasi Gauss-Jordan:\n');
fprintf('x1 = %.4f\n', x(1));
fprintf('x2 = %.4f\n', x(2));
fprintf('x3 = %.4f\n', x(3));

