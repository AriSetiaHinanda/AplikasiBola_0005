import 'package:flutter/material.dart';
import 'player_detail_page.dart';

class AddPlayerPage extends StatefulWidget {
  const AddPlayerPage({super.key});

  @override
  State<AddPlayerPage> createState() => _AddPlayerPageState();
}

class _AddPlayerPageState extends State<AddPlayerPage> {
  final _formKey = GlobalKey<FormState>();
  final _namaCtr = TextEditingController();
  final _posisiCtr = TextEditingController();
  final _nomorPunggungCtr = TextEditingController();
  final _kewarganegaraanCtr = TextEditingController();
  final _usiaCtr = TextEditingController();
  final _tinggiCtr = TextEditingController();

  String _jenisKelamin = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Tambah Pemain Baru', style: TextStyle(fontSize: 20)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 2),

                // Deskripsi
                const Text(
                  'Form untuk menambahkan pemain baru akan ditampatkan di sini.',
                  style: TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 10),

                // Nama Pemain
                TextFormField(
                  controller: _namaCtr,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter player name';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Nama Pemain',
                    labelStyle: const TextStyle(fontSize: 16),
                    floatingLabelStyle: const TextStyle(
                      fontSize: 16,
                      color: Colors.lightBlue,
                    ),
                    hintText: 'Masukkan nama pemain',
                    hintStyle: const TextStyle(fontSize: 14),
                  ),
                ),
                const SizedBox(height: 7),

                // Posisi Pemain
                TextFormField(
                  controller: _posisiCtr,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter player position';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Posisi Pemain',
                    labelStyle: const TextStyle(fontSize: 16),
                    floatingLabelStyle: const TextStyle(
                      fontSize: 16,
                      color: Colors.lightBlue,
                    ),
                    hintText: 'Masukkan posisi pemain',
                    hintStyle: const TextStyle(fontSize: 14),
                  ),
                ),
                const SizedBox(height: 7),

                // Nomor Punggung
                TextFormField(
                  controller: _nomorPunggungCtr,
                  keyboardType: TextInputType.number,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter player number';
                    }
                    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                      return 'Please enter only numbers';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Nomor Punggung',
                    labelStyle: const TextStyle(fontSize: 16),
                    floatingLabelStyle: const TextStyle(
                      fontSize: 16,
                      color: Colors.lightBlue,
                    ),
                    hintText: 'Masukkan nomor punggung',
                    hintStyle: const TextStyle(fontSize: 14),
                  ),
                ),
                const SizedBox(height: 7),

                // Kewarganegaraan
                TextFormField(
                  controller: _kewarganegaraanCtr,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter player nationality';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Kewarganegaraan',
                    labelStyle: const TextStyle(fontSize: 16),
                    floatingLabelStyle: const TextStyle(
                      fontSize: 16,
                      color: Colors.lightBlue,
                    ),
                    hintText: 'Masukkan kewarganegaraan',
                    hintStyle: const TextStyle(fontSize: 14),
                  ),
                ),
                const SizedBox(height: 7),

                // Usia Pemain
                TextFormField(
                  controller: _usiaCtr,
                  keyboardType: TextInputType.number,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter player age';
                    }
                    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                      return 'Please enter only numbers';
                    }
                    int? usia = int.tryParse(value);
                    if (usia == null || usia < 10 || usia > 50) {
                      return 'Usia harus antara 10-50 tahun';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Usia Pemain',
                    labelStyle: const TextStyle(fontSize: 16),
                    floatingLabelStyle: const TextStyle(
                      fontSize: 16,
                      color: Colors.lightBlue,
                    ),
                    hintText: 'Masukkan usia pemain',
                    hintStyle: const TextStyle(fontSize: 14),
                  ),
                ),
                const SizedBox(height: 7),

                // Tinggi Pemain
                TextFormField(
                  controller: _tinggiCtr,
                  keyboardType: TextInputType.number,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter player height';
                    }
                    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                      return 'Please enter only numbers';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Tinggi Pemain (cm)',
                    labelStyle: const TextStyle(fontSize: 16),
                    floatingLabelStyle: const TextStyle(
                      fontSize: 16,
                      color: Colors.lightBlue,
                    ),
                    hintText: 'Masukkan tinggi pemain',
                    hintStyle: const TextStyle(fontSize: 14),
                  ),
                ),
                const SizedBox(height: 25),

                // Jenis Kelamin
                const Text('Jenis Kelamin', style: TextStyle(fontSize: 14)),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile<String>(
                        title: const Text('Laki-laki'),
                        value: 'Laki-laki',
                        groupValue: _jenisKelamin,
                        activeColor: Colors.lightBlue,
                        contentPadding: EdgeInsets.zero,
                        visualDensity: VisualDensity.compact,
                        onChanged: (value) {
                          setState(() {
                            _jenisKelamin = value!;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile<String>(
                        title: const Text('Perempuan'),
                        value: 'Perempuan',
                        groupValue: _jenisKelamin,
                        activeColor: Colors.lightBlue,
                        contentPadding: EdgeInsets.zero,
                        visualDensity: VisualDensity.compact,
                        onChanged: (value) {
                          setState(() {
                            _jenisKelamin = value!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Tombol Tambah Pemain
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate() &&
                          _jenisKelamin.isNotEmpty) {
                        // Navigasi ke halaman Detail Pemain
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailPlayerPage(
                              nama: _namaCtr.text,
                              posisi: _posisiCtr.text,
                              nomorPunggung: _nomorPunggungCtr.text,
                              kewarganegaraan: _kewarganegaraanCtr.text,
                              usia: _usiaCtr.text,
                              tinggi: _tinggiCtr.text,
                              jenisKelamin: _jenisKelamin,
                            ),
                          ),
                        );
                      } else if (_jenisKelamin.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Pilih jenis kelamin terlebih dahulu',
                            ),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightBlue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    child: const Text(
                      'Tambah Pemain',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _namaCtr.dispose();
    _posisiCtr.dispose();
    _nomorPunggungCtr.dispose();
    _kewarganegaraanCtr.dispose();
    _usiaCtr.dispose();
    _tinggiCtr.dispose();
    super.dispose();
  }
}