import 'package:flutter/material.dart';
import 'package:tugas_pbm_pertemuan_6/page/home_page.dart';
import 'package:tugas_pbm_pertemuan_6/page/login_page.dart';
import 'package:tugas_pbm_pertemuan_6/page/register_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:
          false, //untuk menghilangkan debug pada pojok kanan atas
      // map route untung navigasi yang diperlukan
      routes: {
        "/register": (context) =>
            const RegisterPage(), // route untuk ke halaman register
        "/login": (context) =>
            const LoginPage(), // route untuk ke halaman login
        "/home": (context) => const HomePage(), // route untuk ke halaman home
      },
      initialRoute: "/register", // route awal saat dijalankan aplikasinya
    );
  }
}
