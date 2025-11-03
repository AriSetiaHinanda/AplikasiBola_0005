import 'package:aplikasibola_0005/login_page.dart';
import 'package:flutter/material.dart';
import 'add_player_page.dart';

class HomePage extends StatefulWidget {
  final String email;
  const HomePage({super.key, required this.email});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Logo Persib
            Image.network(
              'https://upload.wikimedia.org/wikipedia/id/thumb/0/0d/Logo_Persib_Bandung.png/520px-Logo_Persib_Bandung.png',
              height: 40,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(
                  Icons.sports_soccer,
                  size: 40,
                  color: Colors.white,
                );
              },
            ),
            const Text(
              'Persib App',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.logout, color: Colors.white),
              onPressed: () {
                // Logout
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              // Section Jadwal Pertandingan
              const Text(
                'Jadwal Pertandingan Persib Bandung',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),

              // Card Jadwal Pertandingan
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  color: Colors.lightBlue.shade50,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    // Tim vs Tim
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          'Persib Bandung',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          'VS',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          'Arema FC',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    // Detail Jadwal
                    const Text(
                      'Tanggal: 25 Desember 2024',
                      style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'Waktu: 19:00 WIB',
                      style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'Lokasi: Stadion Gelora Bandung Lautan Api',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // Menu Section
              const Text(
                'Menu',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),

              // Menu Grid
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddPlayerPage(),
                        ),
                      );
                    },
                    child: _buildMenuIcon(Icons.person, 'Player'),
                  ),
                  _buildMenuIcon(Icons.access_time, 'Jadwal'),
                  _buildMenuIcon(Icons.bar_chart, 'Klasemen'),
                  _buildMenuIcon(Icons.shopping_bag, 'Merchandise'),
                ],
              ),
              const SizedBox(height: 30),

              // Berita Terbaru Section
              const Text(
                'Berita Terbaru Persib Bandung',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),

              // Berita Cards - Horizontal Scroll
              SizedBox(
                height: 300,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildNewsCard(
                      'Persib Bandung Resmi Rekrut Pemain Baru',
                      'Persib Bandung telah resmi merekrut pemain baru untuk memperkuat skuad mereka di musim depan. Pemain tersebut diharapkan dapat memberikan kontribusi besar bagi tim.',
                    ),
                    const SizedBox(width: 40),
                    _buildNewsCard(
                      'Persib Bandung Resmi Rekrut Pemain Baru',
                      'Persib Bandung telah resmi merekrut pemain baru untuk memperkuat skuad mereka di musim depan. Pemain tersebut diharapkan dapat memberikan kontribusi besar bagi tim.',
                    ),
                    const SizedBox(width: 40),
                    _buildNewsCard(
                      'Persib Bandung Juara Liga',
                      'Persib Bandung berhasil menjuarai liga musim ini dengan performa yang konsisten sepanjang kompetisi.',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // Widget Menu Icon
  Widget _buildMenuIcon(IconData icon, String label) {
    return Column(
      children: [
        Container(child: Icon(icon, size: 35, color: Colors.lightBlue)),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  // Widget News Card
  Widget _buildNewsCard(String title, String description) {
    return Container(
      width: 220, // Fixed width untuk horizontal scroll
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.tealAccent.shade200,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          // buat teks rata kanan kiri
          Text(
            description,
            textAlign: TextAlign.justify,
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}