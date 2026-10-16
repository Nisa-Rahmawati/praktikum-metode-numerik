function c = Biseksi(f,a,b,n,tol)
  %menghitung nilai dari fungsi f pada titik a dan b
  fa = f(a);
  fb = f(b);

  %mengecek apakah fa dan fb memiliki tanda yang sama
  %jika sama, tidak ada jaminan akar di antara keduanya
  if fa*fb > 0
    error('Warning: sama tanda.')
  endif

  fprintf('\nIter\ta\t\tb\t\tfa\t\tfb\t\tc\t\tfc\n');

  %iterasi pencarian akar menggunakan metode biseksi
  for i=1:n
    %rumus metode biseksi dimana Titik tengah c menjadi kandidat akar baru
    c = (a+b)/2;
    fc = f(c);
    %mencetak nilai
    fprintf('%d\t%f\t%f\t%f\t%f\t%f\t%f\n', ...
            i,a,b,fa,fb,c,fc);

    %menghentikan iterasi saat error mencapai batas toleransi
    if abs(c-a) <= tol || abs(c-b) <= tol
      break;
    endif

    %jika fa atau fc bernilai 0 maka akar ditemukan
    if fa*fc == 0
      break;
    %kondisi dimana akar berada diantara a dan c
    %sehingga nilai c menggantikan nilai b
    elseif fa*fc < 0
      b = c;
      fb = f(b);
    %kondisi dimana akar berada diantara b dan c
    %sehingga nilai c menggantikan nilai a
    else
      a = c;
      fa = f(a);
    endif
  endfor
end

% ===== Contoh penggunaan (jalankan di Command Window) =====
% %Persamaan 1 : y = 3x^3-5x^2+4x-7, dengan y = 1
% f = @(x) 3*x.^3-5*x.^2+4*x-7-1;
% a = 1;
% b = 2;
% n = 20;
% tol = 10^-4;
%
% c = Biseksi(f,a,b,n,tol)
%
%
% %Persamaan 2 : y = e^x-x^2, dengan y = 0
% f = @(x) exp(x)-x.^2;
% a = -1;
% b = 0;
% n = 20;
% tol = 10^-4;
%
% c = Biseksi(f,a,b,n,tol)
%
%
% %Persamaan 3 : y = log(x+2)+2x-3, dengan y = 0
% f = @(x) log(x+2)+2*x-3;
% a = 0;
% b = 2;
% n = 20;
% tol = 10^-4;
%
% c = Biseksi(f,a,b,n,tol)
