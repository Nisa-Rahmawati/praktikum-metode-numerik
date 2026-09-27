# Pertemuan 05 - Sistem Persamaan Linear 1

## 📌 Ringkasan

Pertemuan ini membahas penyelesaian sistem persamaan linear (SPL) menggunakan metode langsung, meliputi Eliminasi Gauss (forward elimination dan back substitution), Eliminasi Gauss-Jordan (forward dan backward elimination hingga matriks berbentuk diagonal), serta Dekomposisi LU (memecah matriks A menjadi perkalian matriks segitiga bawah L dan segitiga atas U, kemudian menyelesaikan sistem melalui forward dan backward substitution). Ketiga metode diterapkan pada SPL yang sama untuk membuktikan bahwa solusi x1, x2, x3 yang dihasilkan identik.

## 📁 Berkas Codingan

* `EliminasiGauss.m` : Skrip menyelesaikan SPL menggunakan metode Eliminasi Gauss (forward elimination membentuk matriks segitiga atas, dilanjutkan back substitution).
* `EliminasiGaussJordan.m` : Skrip menyelesaikan SPL menggunakan metode Eliminasi Gauss-Jordan (forward elimination dilanjutkan backward elimination hingga matriks berbentuk diagonal, solusi diperoleh melalui normalisasi).
* `DekomposisiLU.m` : Skrip menyelesaikan SPL menggunakan metode Dekomposisi LU (menyusun matriks L dan U dari proses forward elimination, membuktikan A = L×U, lalu menyelesaikan sistem melalui forward substitution (Ly = b) dan backward substitution (Ux = y)).

## 💡 Cara Menjalankan

Buka Octave, arahkan ke folder ini, lalu ketikkan nama skrip yang ingin dijalankan pada Command Window:

1. **Menjalankan Penyelesaian SPL dengan Eliminasi Gauss:**
   ```octave
   EliminasiGauss
   ```

2. **Menjalankan Penyelesaian SPL dengan Eliminasi Gauss-Jordan:**
   ```octave
   EliminasiGausJordan
   ```

3. **Menjalankan Penyelesaian SPL dengan Dekomposisi LU:**
   ```octave
   DekomposisiLU
   ```