import 'dart:io';
import 'class_kalkulator.dart';

void main() {
  Kalkulator kalkulator = Kalkulator();
  while (true) {
    // Meminta input angka pertama dan kedua
    double bil1 = mintaAngka("Masukkan angka pertama:");
    double bil2 = mintaAngka("Masukkan angka kedua:");

    print("Pilih operasi matematika:");
    print("1. Tambah (+)");
    print("2. Kurang (-)");
    print("3. Kali (*)");
    print("4. Bagi (/)");

    int operasi = mintaOperasi();

    double hasil;

    try {
      switch (operasi) {
        case 1:
          hasil = kalkulator.tambah(bil1, bil2);
          print("Hasil: $bil1 + $bil2 = $hasil");
          break;
        case 2:
          hasil = kalkulator.kurang(bil1, bil2);
          print("Hasil: $bil1 - $bil2 = $hasil");
          break;
        case 3:
          hasil = kalkulator.kali(bil1, bil2);
          print("Hasil: $bil1 * $bil2 = $hasil");
          break;
        case 4:
          hasil = kalkulator.bagi(bil1, bil2);
          print("Hasil: $bil1 / $bil2 = $hasil");
          break;
        default:
          print("Pilihan operasi tidak valid.");
          continue;
      }

      print("Apakah ingin menghitung lagi? (Y/T)");
      String? lanjut = stdin.readLineSync();
      if (lanjut == null || lanjut.toUpperCase() != 'Y') {
        print("Terima kasih telah menggunakan kalkulator.");
        break;
      }
    } catch (e) {
      print("Error: ${e.toString()}");
    }
  }
}

// Fungsi untuk meminta input angka dengan validasi
double mintaAngka(String pesan) {
  while (true) {
    stdout.write("$pesan ");
    String? input = stdin.readLineSync();
    if (input != null) {
      double? angka = double.tryParse(input);
      if (angka != null) {
        return angka;
      }
    }
    print("Input tidak valid, harap masukkan angka.");
  }
}

// Fungsi untuk meminta input operasi dengan validasi
int mintaOperasi() {
  while (true) {
    stdout.write("Masukkan nomor operasi (1-4): ");
    String? input = stdin.readLineSync();
    if (input != null) {
      int? pilihan = int.tryParse(input);
      if (pilihan != null && pilihan >= 1 && pilihan <= 4) {
        return pilihan;
      }
    }
    print("Pilihan tidak valid. Silakan coba lagi.");
  }
}