% Praktikum 5 - Sistem Persamaan Linear
% Metode Dekomposisi LU

A = [ 2  1 -1;
      4  3  1;
     -2  1  2];
b = [3; 9; 4];

n = length(b);
L = eye(n);
U = A;

% ----- Forward elimination sambil mencatat pengali m ke L -----
for j = 1:n-1
    for i = j+1:n
        m = U(i,j) / U(j,j);
        L(i,j) = m;
        U(i,:) = U(i,:) - m * U(j,:);
    end
end

fprintf('Matriks L:\n'); disp(L);
fprintf('Matriks U:\n'); disp(U);
fprintf('Cek A = L*U:\n'); disp(L*U);

% ----- Forward substitution: L*y = b -----
y = zeros(n,1);
y(1) = b(1) / L(1,1);
for j = 2:n
    y(j) = (b(j) - L(j,1:j-1) * y(1:j-1)) / L(j,j);
end
fprintf('Vektor y:\n'); disp(y);

% ----- Backward substitution: U*x = y -----
x = zeros(n,1);
x(n) = y(n) / U(n,n);
for j = n-1:-1:1
    x(j) = (y(j) - U(j,j+1:n) * x(j+1:n)) / U(j,j);
end

fprintf('\nSolusi Dekomposisi LU:\n');
fprintf('x1 = %.4f\n', x(1));
fprintf('x2 = %.4f\n', x(2));
fprintf('x3 = %.4f\n', x(3));

