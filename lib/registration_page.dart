import 'package:flutter/material.dart';


class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  final _namaCtr = TextEditingController();
  final _alamatCtr = TextEditingController();
  final _telpCtr = TextEditingController();
  final _emailCtr = TextEditingController();
  final _passwordCtr = TextEditingController();
  final _confirmPasswordCtr = TextEditingController();

  String _jenisKelamin = '';
  bool _isObscurePassword = true;
  bool _isObscureConfirmPassword = true;

  // Daftar domain email yang diizinkan
  final List<String> _allowedDomains = ['@gmail.com'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),

                  // judul
                  const Center(
                    child: Text(
                      'Selamat Datang Bobotoh!',
                      style: TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightBlue,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // subjudul
                  const Center(
                    child: Text(
                      'Silahkan daftar untuk melanjutkan ke aplikasi Persib\nBandung Official.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ),
                  const SizedBox(height: 35),

                  // Nama Field
                  TextFormField(
                    controller: _namaCtr,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Nama',
                      labelStyle: TextStyle(fontSize: 16, color: Colors.grey),
                      floatingLabelStyle: TextStyle(
                        fontSize: 16,
                        color: Colors.lightBlue,
                        fontWeight: FontWeight.w500,
                      ),
                      hintText: 'Masukkan nama anda',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Alamat Field
                  TextFormField(
                    controller: _alamatCtr,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your address';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Alamat',
                      labelStyle: TextStyle(fontSize: 16, color: Colors.grey),
                      floatingLabelStyle: TextStyle(
                        fontSize: 16,
                        color: Colors.lightBlue,
                        fontWeight: FontWeight.w500,
                      ),
                      hintText: 'Masukkan alamat anda',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ),
                  const SizedBox(height: 8),

                  // No. Telepon Field
                  TextFormField(
                    controller: _telpCtr,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your phone number';
                      }
                      // Validasi hanya angka
                      if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                        return 'Please enter only numbers';
                      }
                      // Validasi panjang (minimal 10, maksimal 13)
                      if (value.length < 10 || value.length > 13) {
                        return 'Phone number must be between 10 and 13 digits';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'No. Telepon',
                      labelStyle: TextStyle(fontSize: 16, color: Colors.grey),
                      floatingLabelStyle: TextStyle(
                        fontSize: 16,
                        color: Colors.lightBlue,
                        fontWeight: FontWeight.w500,
                      ),
                      hintText: 'Masukkan no. telepon Anda',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Jenis Kelamin
                  const Text(
                    'Jenis Kelamin',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
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
                  const SizedBox(height: 8),

                  // Email Field
                  TextFormField(
                    controller: _emailCtr,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email tidak boleh kosong';
                      }
                      // Validasi format email
                      final emailRegex = RegExp(
                        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                      );
                      if (!emailRegex.hasMatch(value)) {
                        return 'Format email tidak valid';
                      }
                      // Validasi domain yang diizinkan
                      bool validDomain = _allowedDomains.any(
                        (domain) => value.endsWith(domain),
                      );
                      if (!validDomain) {
                        return 'Email harus berakhiran ${_allowedDomains.join(", ")}';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(fontSize: 16, color: Colors.grey),
                      floatingLabelStyle: TextStyle(
                        fontSize: 16,
                        color: Colors.lightBlue,
                        fontWeight: FontWeight.w500,
                      ),
                      hintText: 'Masukkan email Anda',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Password Field
                  TextFormField(
                    controller: _passwordCtr,
                    obscureText: _isObscurePassword,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password tidak boleh kosong';
                      }
                      if (value.length < 6) {
                        return 'Password minimal 6 karakter';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                      floatingLabelStyle: const TextStyle(
                        fontSize: 16,
                        color: Colors.lightBlue,
                        fontWeight: FontWeight.w500,
                      ),
                      hintText: 'Masukkan password Anda',
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isObscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            _isObscurePassword = !_isObscurePassword;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Confirm Password Field
                  TextFormField(
                    controller: _confirmPasswordCtr,
                    obscureText: _isObscureConfirmPassword,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Konfirmasi password tidak boleh kosong';
                      }
                      if (value != _passwordCtr.text) {
                        return 'Password tidak cocok';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      labelStyle: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                      floatingLabelStyle: const TextStyle(
                        fontSize: 16,
                        color: Colors.lightBlue,
                        fontWeight: FontWeight.w500,
                      ),
                      hintText: 'Konfirmasi password Anda',
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isObscureConfirmPassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            _isObscureConfirmPassword =
                                !_isObscureConfirmPassword;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Tombol Daftar
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate() &&
                            _jenisKelamin.isNotEmpty) {
                          // Kembali ke halaman Login
                          Navigator.pop(context);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlue,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Daftar',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Link ke Login
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Apakah sudah punya akun?  ',
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Masuk disini',
                          style: TextStyle(
                            color: Colors.lightBlue,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _namaCtr.dispose();
    _alamatCtr.dispose();
    _telpCtr.dispose();
    _emailCtr.dispose();
    _passwordCtr.dispose();
    _confirmPasswordCtr.dispose();
    super.dispose();
  }
}