# Pertemuan 04 - Galat/Error

## 📌 Ringkasan

Pertemuan ini membahas konsep galat (*error*) dalam komputasi numerik, meliputi perbedaan komputasi analitik dan numerik, sumber-sumber kesalahan pada komputasi numerik (galat pembulatan/*round-off error* dan galat pemotongan/*truncation error*), rumus-rumus galat (galat absolut, galat relatif, galat relatif hampiran, dan persentase galat relatif), serta penerapannya dalam menghitung galat pada pendekatan deret Taylor dan operasi penjumlahan.

## 📁 Berkas Codingan

* `galat_e_taylor.m` : Skrip menghitung galat pada pendekatan e^0,3 menggunakan deret Taylor dengan variasi jumlah suku (n = 0 s.d. 4).
* `galat_deret_harmonik.m` : Skrip menghitung galat pada penjumlahan deret harmonik 1/1 + 1/2 + ... + 1/20 dengan tiga cara (perhitungan eksak, tiap suku dibulatkan, dan tanpa looping menggunakan fungsi `sum`).
* `galat_sin_taylor.m` : Skrip menghitung galat pada pendekatan sin(1) menggunakan deret Taylor dengan variasi jumlah suku (N = 1 s.d. 5).

## 💡 Cara Menjalankan

Buka Octave, arahkan ke folder ini, lalu ketikkan nama skrip yang ingin dijalankan pada Command Window:

1. **Menjalankan Perhitungan Galat e^0,3 dengan Deret Taylor:**
   ```octave
   galat_e_taylor
   ```

2. **Menjalankan Perhitungan Galat Deret Harmonik:**
   ```octave
   galat_deret_harmonik
   ```

3. **Menjalankan Perhitungan Galat sin(1) dengan Deret Taylor:**
   ```octave
   galat_sin_taylor
   ```