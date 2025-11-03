import 'package:flutter/material.dart';


class DetailPlayerPage extends StatelessWidget {
  final String nama;
  final String posisi;
  final String nomorPunggung;
  final String kewarganegaraan;
  final String usia;
  final String tinggi;
  final String jenisKelamin;

  const DetailPlayerPage({
    super.key,
    required this.nama,
    required this.posisi,
    required this.nomorPunggung,
    required this.kewarganegaraan,
    required this.usia,
    required this.tinggi,
    required this.jenisKelamin,
  });

  @override
  Widget build(BuildContext context) {
    // Konversi tinggi dari cm ke meter
    double tinggiMeter = int.parse(tinggi) / 100;
    String tinggiFormatted = tinggiMeter.toStringAsFixed(2);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Detail Pemain', style: TextStyle(fontSize: 20)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),

            // Data Pemain
            _buildDetailRow('Nama: ', nama),
            const SizedBox(height: 10),
            _buildDetailRow('Posisi: ', posisi),
            const SizedBox(height: 10),
            _buildDetailRow('Nomor: ', nomorPunggung),
            const SizedBox(height: 10),
            _buildDetailRow('Kebangsaan: ', kewarganegaraan),
            const SizedBox(height: 10),
            _buildDetailRow('Usia: ', usia),
            const SizedBox(height: 10),
            _buildDetailRow('Tinggi: ', '$tinggiFormatted m'),
            const SizedBox(height: 10),
            _buildDetailRow('Jenis Kelamin: ', jenisKelamin),

            const SizedBox(height: 30),

            // Tombol Cancel
            SizedBox(
              width: double.infinity,
              height: 35,
              child: ElevatedButton(
                onPressed: () {
                  // Kembali ke halaman Tambah Pemain
                  Navigator.pop(context);
                },
                child: const Text(
                  'Cancel',
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
              ),
            ),

            const SizedBox(height: 15),

            // Tombol Save
            SizedBox(
              width: double.infinity,
              height: 35,
              child: ElevatedButton(
                onPressed: () {
                  // Kembali ke Home (menutup semua halaman di atas Home)
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                child: const Text(
                  'Save',
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          child: Text(label + value, style: const TextStyle(fontSize: 16)),
        ),
      ],
    );
  }
}