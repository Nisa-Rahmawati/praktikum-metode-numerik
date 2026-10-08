# Pertemuan 06 - Sistem Persamaan Linear 2

## 📌 Ringkasan

Pertemuan ini melanjutkan penyelesaian sistem persamaan linear (SPL) dengan menambahkan metode tidak langsung (iteratif), yaitu Iterasi Jacobi (nilai hampiran baru dihitung dari nilai hampiran iterasi sebelumnya) dan Iterasi Gauss-Seidel (nilai hampiran terbaru langsung dipakai dalam iterasi yang sama). Kedua metode iteratif ini dibandingkan dengan tiga metode langsung dari pertemuan sebelumnya (Eliminasi Gauss, Eliminasi Gauss-Jordan, dan Dekomposisi LU) pada SPL 5 variabel (p, q, r, s, t) yang sama, dengan batas maksimum iterasi 20 dan toleransi error 0,001. Selain mencari solusi, program juga menghitung galat absolut metode iteratif terhadap nilai eksak (solusi Eliminasi Gauss) dan mengukur running time kelima metode menggunakan `tic` dan `toc`.

## 📁 Berkas Codingan

* `praktikum6_main.m` : Program utama yang mendefinisikan SPL, memanggil kelima fungsi metode, menampilkan hasil tiap metode, menghitung galat absolut Jacobi dan Gauss-Seidel terhadap solusi Eliminasi Gauss, serta merekap running time kelima metode.
* `gauss_spl.m` : Fungsi menyelesaikan SPL menggunakan metode Eliminasi Gauss (forward elimination membentuk matriks segitiga atas, dilanjutkan back substitution).
* `gaussjordan_spl.m` : Fungsi menyelesaikan SPL menggunakan metode Eliminasi Gauss-Jordan (forward elimination dilanjutkan backward elimination hingga matriks berbentuk diagonal, solusi diperoleh melalui normalisasi).
* `lu_spl.m` : Fungsi menyelesaikan SPL menggunakan metode Dekomposisi LU (menyusun matriks L dan U dari proses eliminasi, lalu menyelesaikan sistem melalui forward substitution (Ly = b) dan backward substitution (Ux = y)).
* `jacobi_spl.m` : Fungsi menyelesaikan SPL menggunakan metode Iterasi Jacobi (tebakan awal nol, iterasi berhenti saat selisih maksimum antar-iterasi ≤ toleransi atau mencapai iterasi maksimum).
* `gaussseidel_spl.m` : Fungsi menyelesaikan SPL menggunakan metode Iterasi Gauss-Seidel (tebakan awal nol, nilai terbaru langsung dipakai dalam iterasi yang sama, dengan kriteria berhenti yang sama seperti Jacobi).

## 💡 Cara Menjalankan

Simpan keenam berkas `.m` dalam satu folder yang sama. Buka Octave, arahkan ke folder ini, lalu cukup jalankan program utama pada Command Window. Kelima fungsi lainnya akan dipanggil secara otomatis oleh program utama, sehingga tidak perlu dijalankan satu per satu.

1. **Menjalankan seluruh penyelesaian SPL (lima metode, galat, dan running time):**
   ```octave
   praktikum6_main
   ```

2. **(Opsional) Menjalankan satu metode saja** setelah mendefinisikan `A` dan `b` terlebih dahulu, misalnya Iterasi Gauss-Seidel dengan toleransi 0,001 dan iterasi maksimum 20:
   ```octave
   A = [5 -1 -1 0 0; -1 5 -1 -1 0; -1 -1 4 -1 -1; 0 0 1 4 -2; 0 1 -1 1 4];
   b = [-1; 2; 6; 2; -1];
   [x, iter, konvergen, riwayat, waktu] = gaussseidel_spl(A, b, 0.001, 20)
   ```
