% BAGIAN 1: Struktur if-elseif-else (Berat Badan)
fprintf('--- BAGIAN 1: ELEMEN IF-ELSEIF-ELSE (BERAT BADAN) ---\n');
berat = input('Masukkan berat badan Anda (kg): ');

if berat < 45
    status_bb = 'Kurang (Underweight)';
elseif berat >= 45 && berat <= 65
    status_bb = 'Ideal / Normal';
elseif berat > 65 && berat <= 85
    status_bb = 'Berlebih (Overweight)';
else
    status_bb = 'Sangat Berlebih (Obesitas)';
end

fprintf('Dengan berat %g kg, kategori Anda adalah: %s\n\n', berat, status_bb);


% BAGIAN 2: Struktur switch-case dengan Gabungan if-elseif di dalamnya (Prodi)
fprintf('--- BAGIAN 2: SWITCH-CASE BESERTA IF-ELSEIF ---\n');
fprintf('Pilih Kode Prodi:\n 1. Informatika\n 2. Matematika\n 3. PGSD\n');
pilihan_prodi = input('Masukkan pilihan prodi Anda (1, 2, atau 3): ');

switch pilihan_prodi
    case 1
        fprintf('Anda memilih Program Studi Informatika.\n');
        tahun_masuk = input('Masukkan tahun angkatan kuliah Anda(Misal 2026): ');

        if tahun_masuk == 2024
            disp('Status: Mahasiswa Informatika Angkatan 2024.');
        elseif tahun_masuk == 2025
            disp('Status: Mahasiswa Informatika Angkatan 2025.');
        elseif tahun_masuk == 2026
            disp('Status: Mahasiswa Baru Informatika.');
        else
            disp('Status: Angkatan tidak valid untuk prodi baru ini.');
        end

    case 2
        fprintf('Anda memilih Program Studi Matematika.\n');
        tahun_masuk = input('Masukkan tahun angkatan kuliah Anda(Misal 2026): ');

        if tahun_masuk == 2024
            disp('Status: Mahasiswa Matematika Angkatan 2024.');
        elseif tahun_masuk == 2025
            disp('Status: Mahasiswa Matematika Angkatan 2025.');
        elseif tahun_masuk == 2026
            disp('Status: Mahasiswa Baru Matematika.');
        else
            disp('Status: Angkatan tidak valid untuk prodi baru ini.');
        end

    case 3
        fprintf('Anda memilih Program Studi PGSD.\n');
        tahun_masuk = input('Masukkan tahun angkatan kuliah Anda(Misal 2026): ');

        if tahun_masuk < 2023
            disp('Status: Mahasiswa PGSD Tingkat akhir.');
        elseif tahun_masuk == 2023
            disp('Status: Mahasiswa PGSD Angkatan 2024.');
        elseif tahun_masuk == 2024
            disp('Status: Mahasiswa PGSD Angkatan 2024.');
        elseif tahun_masuk == 2025
            disp('Status: Mahasiswa PGSD Angkatan 2025.');
        elseif tahun_masuk == 2026
            disp('Status: Mahasiswa PGSD Angkatan 2026.');
        else
            disp('Status: Tahun angkatan tidak valid.');
        end

    otherwise
        disp('Pilihan prodi tidak valid!');
end
