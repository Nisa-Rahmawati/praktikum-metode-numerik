% Praktikum 5 - Sistem Persamaan Linear
% Metode Eliminasi Gauss

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

fprintf('Hasil forward elimination:\n');
disp(Ab);

% ----- Back Substitution -----
x = zeros(n,1);
x(n) = Ab(n,n+1) / Ab(n,n);
for j = n-1:-1:1
    x(j) = (Ab(j,n+1) - Ab(j,j+1:n) * x(j+1:n)) / Ab(j,j);
end

fprintf('\nSolusi Eliminasi Gauss:\n');
fprintf('x1 = %.4f\n', x(1));
fprintf('x2 = %.4f\n', x(2));
fprintf('x3 = %.4f\n', x(3));

