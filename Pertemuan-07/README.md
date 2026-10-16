# Pertemuan 07 - Sistem Persamaan Non-Linear 1

## 📌 Ringkasan

Pertemuan ini membahas pencarian akar persamaan non-linear, yaitu mencari nilai x yang membuat f(x) = 0. Tiga persamaan yang diselesaikan adalah:

1. y = 3x³ − 5x² + 4x − 7, dengan y = 1
2. y = eˣ − x², dengan y = 0
3. y = log(x + 2) + 2x − 3, dengan y = 0

Akar diperkirakan terlebih dahulu dengan pendekatan grafik, yaitu metode Grafik Tunggal (titik potong kurva dengan sumbu x) dan Grafik Ganda (titik potong dua kurva y₁ dan y₂). Perkiraan tersebut dipakai sebagai interval awal [a, b] untuk metode Biseksi (titik tengah interval menjadi kandidat akar baru) dan Regula-Falsi (kandidat akar diambil dari perpotongan garis lurus melalui (a, f(a)) dan (b, f(b)) dengan sumbu x). Kedua metode ini dijalankan dengan batas maksimum iterasi 20 dan toleransi error 0,0001.

Hasil akar yang diperoleh:

| Persamaan | Interval awal | Biseksi | Iterasi | Regula-Falsi | Iterasi |
| :---: | :---: | :---: | :---: | :---: | :---: |
| 1 | [1, 2]  | 1,766418  | 14 | 1,766441  | 6 |
| 2 | [−1, 0] | −0,703430 | 14 | −0,703466 | 6 |
| 3 | [0, 2]  | 0,957825  | 15 | 0,957781  | 4 |

## 📁 Berkas Codingan

* `tunggal.m` : Script metode Grafik Tunggal untuk ketiga persamaan. Setiap persamaan digambar pada `figure(1)` sampai `figure(3)`, lengkap dengan garis sumbu x dan y serta anotasi `gtext`. Titik kurva yang memotong sumbu x adalah akar.
* `ganda.m` : Script metode Grafik Ganda untuk ketiga persamaan. Setiap persamaan dipecah menjadi y₁ dan y₂ lalu digambar pada `figure(4)` sampai `figure(6)`. Titik perpotongan kedua kurva adalah akar.
* `Biseksi.m` : Fungsi mencari akar dengan metode Biseksi, `c = Biseksi(f,a,b,n,tol)`. Fungsi mengecek syarat f(a)·f(b) < 0, mencetak tabel iterasi, dan berhenti saat |c−a| ≤ tol atau |c−b| ≤ tol, atau saat iterasi mencapai n.
* `RegulaFalsi.m` : Fungsi mencari akar dengan metode Regula-Falsi, `c = RegulaFalsi(f,a,b,n,tol)`. Strukturnya sama dengan Biseksi, hanya rumus kandidat akarnya yang berbeda.

## 💡 Cara Menjalankan

Simpan keempat berkas `.m` dalam satu folder yang sama. Buka Octave lalu arahkan ke folder ini. Tidak ada program utama, jadi setiap berkas dijalankan sendiri-sendiri.

1. **Grafik Tunggal dan Grafik Ganda:** jalankan langsung pada Command Window.
   ```octave
   tunggal
   ganda
   ```
   Perintah `gtext` menunggu klik mouse pada grafik untuk menaruh setiap label. Klik sebanyak jumlah `gtext` pada persamaan tersebut (2 kali pada `tunggal`, 3 kali pada `ganda`), setelah itu figure persamaan berikutnya akan muncul.

2. **Biseksi dan Regula-Falsi:** definisikan fungsi, interval, iterasi maksimum, dan toleransi terlebih dahulu, lalu panggil fungsinya. Contoh untuk persamaan 1 (y = 1 dipindah ke ruas kiri, sehingga f(x) = 3x³ − 5x² + 4x − 8):
   ```octave
   f = @(x) 3*x.^3-5*x.^2+4*x-7-1;
   a = 1;
   b = 2;
   n = 20;
   tol = 10^-4;

   c = Biseksi(f,a,b,n,tol)
   c = RegulaFalsi(f,a,b,n,tol)
   ```
   Untuk persamaan 2, gunakan `f = @(x) exp(x)-x.^2;` dengan `a = -1; b = 0;`. Untuk persamaan 3, gunakan `f = @(x) log(x+2)+2*x-3;` dengan `a = 0; b = 2;`. Contoh pemanggilan ketiga persamaan juga tersedia sebagai komentar di bagian bawah `Biseksi.m` dan `RegulaFalsi.m`.
