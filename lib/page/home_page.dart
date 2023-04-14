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
        primarySwatch: Colors.purple,
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
  late String
      _bmiKeterangan; // variable bertipe stinrg untuk menampung keterangan dari hasil  bmi

  @override
  void initState() {
    // state saat variable text editing controler dimasukan class text editing controler
    super.initState();
    _weightController = TextEditingController();
    // mamsukan class texeditingcontroler() kedalam variable
    _heightController = TextEditingController();
    _bmiResult = 0.0; // mensetup nilai default
    _bmiKeterangan = "";
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
      body: Container(
        color: Colors.purple[300],
        child: Center(
          child: Card(
            elevation: 8,
            child: Container(
              padding: const EdgeInsets.all(32.0),
              constraints: const BoxConstraints(maxWidth: 350),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center, // arah konten
                children: [
                  Text(
                    'Nama : ${User.name}',
                    style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  const SizedBox(height: 24.0),
                  TextField(
                    controller:
                        _weightController, // memasukan controler keadalam textfield
                    keyboardType:
                        TextInputType.number, // memunculkan keyboard number
                    decoration: const InputDecoration(
                      labelText: 'Weight (kg)',
                      hintText: 'Enter your Weight',
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    controller: _heightController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Height (cm)',
                      hintText: 'Enter your Height',
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)),
                      ),
                      onPressed: _calculateBMI,

                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          'Calculate',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ), // ketika button di klik maka akan menjalankan fungsi _submitForm
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 112, 33, 126),
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          // ignore: unnecessary_brace_in_string_interps
                          'Result: ${_bmiResult.toStringAsFixed(2)},  ${_bmiKeterangan}', // menampulkan hasil bmi dengan format 2 angka belakang ,
                          style: const TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _calculateBMI() {
    //Variable
    String keteranganBMI = "";
    double weight = double.tryParse(_weightController.text) ??
        0.0; // variable bertipe double yang diambil dari hasil controler yang dibuat
    double height = double.tryParse(_heightController.text) ?? 0.0;

    //Kondisi
    if (weight > 0 && height > 0) {
      // buat variable sekaligus ngisi
      double bmi = weight /
          ((height / 100) *
              (height / 100)); // rumus bmi dengan tinggi dalam satuan m

      //Kondisi untuk menentukan keterangan
      if (bmi < 18.5) {
        keteranganBMI = "Kurus";
      } else if (bmi >= 18.5 && bmi <= 24.9) {
        keteranganBMI = "Normal";
      } else if (bmi >= 25 && bmi <= 29.9) {
        keteranganBMI = "gemuk";
      } else {
        keteranganBMI = "Obesitas";
      }

      //Memasukan hasil kedalam variable
      setState(() {
        _bmiResult = bmi;
        _bmiKeterangan = keteranganBMI;
      });
    } else {
      // Tampilkan pesan
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
