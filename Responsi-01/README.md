# Responsi 01 - Galat, SPL, dan SPNL

## 📌 Ringkasan

Responsi ini mencakup tiga materi praktikum, yaitu Galat, Sistem Persamaan Linear (SPL), dan Sistem Persamaan Non-Linear (SPNL), dengan satu kasus untuk tiap materi:

1. **Kasus 1 (Galat, Error Pemotongan):** rumus gelombang air laut h = h₀(cos(t·v/λ) + eˣ) dihitung secara eksak dan dengan pendekatan deret Maclaurin untuk cos dan eˣ (n = 23, 24, 25 suku). Keempat fungsi digambar dalam satu plot, lalu rata-rata galat mutlak (|h eksak − h hampiran|) dan galat relatif dibandingkan dengan toleransi error 1%.
2. **Kasus 2 (SPL):** harga beras, telur, tepung, dan ayam per kilogram dicari dari data belanja empat orang. Satuan dikonversi ke kg lebih dulu, SPL disusun, lalu dicek apakah matriksnya dominan diagonal agar metode Gauss-Seidel bisa dipakai. Karena urutan asli tidak dominan diagonal, urutan persamaan ditukar terlebih dahulu.
3. **Kasus 3 (SPNL):** jari-jari bola yang tepat berada di dalam tabung dicari dari persamaan non-linear f(r) = (2/3)πr³ − 150 = 0, dengan nilai awal dari metode grafik dan penyelesaian memakai metode Biseksi (iterasi maksimum 20, toleransi 0,0001).

Hasil yang diperoleh:

| Kasus | Hasil |
| :---: | :--- |
| 1 | Rata-rata galat relatif 0,0296% (n = 23), 0,0120% (n = 24), dan 0,0047% (n = 25). Semuanya di bawah 1%, sehingga metode pendekatan layak digunakan. |
| 2 | Urutan persamaan baru: Briza, Dinda, Adel, Caca (ρ turun dari 21,4302 menjadi 0,2063). Gauss-Seidel konvergen di iterasi ke-14: beras Rp14.000, telur Rp24.000, tepung Rp15.000, ayam Rp30.000 per kg. |
| 3 | Interval awal [3, 5]. Biseksi berhenti di iterasi ke-15 dengan r ≈ 4,1528 cm, tinggi tabung ≈ 8,3055 cm, dan volume tabung di luar bola ≈ 150 cm³. |

## 📁 Berkas Codingan

* `responsi1_kasus1.m` : Script Kasus 1. Menghitung h(t) eksak dan tiga pendekatan deret (n = 23, 24, 25), menghitung rata-rata galat mutlak dan relatif, menentukan kelayakan terhadap toleransi 1%, serta menggambar keempat fungsi dalam satu plot pada `figure(1)`. Terdapat juga tabel tambahan pengaruh n (16 sampai 25) terhadap galat relatif.
* `responsi1_kasus2.m` : Script Kasus 2. Berisi data belanja dalam kg, pemeriksaan dominan diagonal dan jari-jari spektral, pencarian urutan persamaan yang dominan diagonal, pemanggilan `GaussSeidel`, serta verifikasi hasil terhadap data belanja.
* `GaussSeidel.m` : Fungsi metode iterasi Gauss-Seidel, `[x, iter, riwayat] = GaussSeidel(A, b, tol, max_iter)`. Tebakan awal nol, nilai terbaru langsung dipakai dalam iterasi yang sama, dan iterasi berhenti saat selisih terbesar antar-iterasi ≤ tol.
* `responsi1_kasus3.m` : Script Kasus 3. Menyusun persamaan non-linear dari perbandingan volume bola dan tabung, menggambar f(r) untuk menentukan nilai awal pada `figure(1)`, memanggil `Biseksi`, lalu memverifikasi volume dan membandingkan dengan akar analitik.
* `Biseksi.m` : Fungsi metode Biseksi, `c = Biseksi(f,a,b,n,tol)`, sama dengan berkas pada Pertemuan 07 (tidak diubah).

## 💡 Cara Menjalankan

Simpan kelima berkas `.m` dalam satu folder yang sama. Buka Octave, arahkan ke folder ini, lalu jalankan skrip tiap kasus pada Command Window. Fungsi `GaussSeidel` dan `Biseksi` dipanggil otomatis oleh skripnya, jadi tidak perlu dijalankan sendiri.

1. **Menjalankan Kasus 1 (Galat):**
   ```octave
   responsi1_kasus1
   ```

2. **Menjalankan Kasus 2 (SPL, memerlukan `GaussSeidel.m`):**
   ```octave
   responsi1_kasus2
   ```

3. **Menjalankan Kasus 3 (SPNL, memerlukan `Biseksi.m`):**
   ```octave
   responsi1_kasus3
   ```
