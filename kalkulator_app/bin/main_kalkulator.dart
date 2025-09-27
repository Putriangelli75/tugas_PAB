import 'dart:io';
import 'class_kalkulator.dart';

void main() {
  Kalkulator kalkulator = Kalkulator();
  while (true) {
    double angka1 = inputAngka("Masukkan Angka Pertama :");
    double angka2 = inputAngka("Masukkan Angka Kedua :");

    print("Pilih Operasi Matematika:");
    print("1. Tambah (+)");
    print("2. Kurang (-)");
    print("3. Kali (*)");
    print("4. Bagi (/)");

    double operasi = inputAngka('Masukkan Pilihan Anda (1-4) : ');
    double hasil;

    try {
      switch (operasi) {
        case 1:
          hasil = kalkulator.tambah(angka1, angka2);
          print("Hasil: $angka1 + $angka2 = $hasil");
          break;
        case 2:
          hasil = kalkulator.kurang(angka1, angka2);
          print("Hasil: $angka1 - $angka2 = $hasil");
          break;
        case 3:
          hasil = kalkulator.kali(angka1, angka2);
          print("Hasil: $angka1 * $angka2 = $hasil");
          break;
        case 4:
          hasil = kalkulator.bagi(angka1, angka2);
          print("Hasil: $angka1 / $angka2 = $hasil");
          break;
        default:
          print("Pilihan operasi tidak valid.");
          continue;
      }

      print("Apakah Anda ingin mengulang operasi ini? (Y/T)");
      String lanjut = stdin.readLineSync() ?? '';
      if (lanjut.toUpperCase() != 'Y') {
        print("Terima kasih telah menggunakan kalkulator.");
        break;
      }
    } catch (e) {
      print("Error: ${e.toString()}");
    }
  }
}
double inputAngka(String pesan) {
  while (true) {
    stdout.write("$pesan ");
    String input = stdin.readLineSync() ?? '';
    double angka = double.tryParse(input) ?? -1;
    if (angka != -1) {
      return angka;
    }
    print("Hasil tidak valid, silahkan masukkan kembali.");
  }
}
