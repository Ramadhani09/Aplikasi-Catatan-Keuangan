import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // hilangkan tulisan "debug"
      title: 'Aplikasi Saya',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Beranda', style: TextStyle(color: Colors.white)),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              color: Colors.blue, // Warna biru solid, tanpa gradient
            ),
          ),
        ),
        body: Center(
          child: Builder(
            builder: (context) {
              return Column(
                children: [
                  const SizedBox(height: 50),
                  const Text(
                    "Analisis Penerapan Aplikasi Pencatatan Keuangan Berbasis Mobile pada UMKM Kerupuk ",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 50),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: () {
                      print("click");
                    },
                    child: const Text(
                      "Tombol",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    width: 200,
                    height: 200,
                    margin: const EdgeInsets.only(top: 50),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.blue,
                    ),
                    child: const Center(
                      child: Text(
                        "cobaa",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white), // Opsional
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
