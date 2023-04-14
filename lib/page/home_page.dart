import 'package:flutter/material.dart';
import 'package:tugas_pbm_pertemuan_6/page/login_page.dart';

void main() => runApp(const HomePage());

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BMICalculator(),
    );
  }
}

class BMICalculator extends StatefulWidget {
  const BMICalculator({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  late TextEditingController
      _weightController; // variable bertipe controler yang digunakan untuk mengakses filed bagian weight
  late TextEditingController
      _heightController; // varibale bertipe controler yang digunakan untuk mengakses filed bagian height
  late double
      _bmiResult; // variable bertipe double untuk menampung hasil dari bmi

  @override
  void initState() {
    // state saat variable text editing controler dimasukan class text editing controler
    super.initState();
    _weightController =
        TextEditingController(); // mamsukan class texeditingcontroler() kedalam variable
    _heightController = TextEditingController();
    _bmiResult = 0.0;
  }

  @override
  void dispose() {
    // mengulang kembali state
    _weightController.dispose();
    _heightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, // arah konten
          children: [
            TextField(
              controller:
                  _weightController, // memasukan controler keadalam textfield
              keyboardType: TextInputType.number, // memunculkan keyboard number
              decoration: const InputDecoration(
                labelText: 'Berat (kg)',
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Tinggi (cm)',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed:
                  _calculateBMI, // ketika button diklik maka akan menjalankan fungsi _calculateBMI
              child: const Text('Hitung BMI'),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Nama : ${User.name}',
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w300,
                  color: Colors.black),
            ),
            Text(
              'BMI: ${_bmiResult.toStringAsFixed(2)}', // menampulkan hasil bmi dengan format 2 angka belakang ,
              style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w300,
                  color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  void _calculateBMI() {
    double weight = double.tryParse(_weightController.text) ??
        0.0; // variable bertipe double yang diambil dari hasil controler yang dibuat
    double height = double.tryParse(_heightController.text) ?? 0.0;
    if (weight > 0 && height > 0) {
      double bmi = weight /
          ((height / 100) *
              (height / 100)); // rumus bmi dengan tinggi dalam satuan m
      setState(() {
        _bmiResult = bmi;
      });
    } else {
      // Tampilkan pesan error jika username atau password salah
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Perhitungan Gagal'),
          content: const Text('Mohon Memasukan angka lebih dari 0'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(
                  context), // navigasi untuk kembali ke state sebelumnya
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }
}
