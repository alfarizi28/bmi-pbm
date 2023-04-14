import 'package:flutter/material.dart';
import 'package:tugas_pbm_pertemuan_6/page/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // variable state untuk form pada text field
  final _formKey = GlobalKey<FormState>();
  // variable yang digunakann untuk menampung inputan nama, defaulnya string kosong
  String _name = "";
  // variable yang digunakann untuk menampung inputan password, defaulnya string kosong
  String _password = "";

  void _submitForm() {
    final form = _formKey
        .currentState; // variable untuk mengambil state dalam form state
    if (form!.validate()) {
      // ketika fomr tidak null maka akan disave dan akan melakukan perintah dibawah
      form.save();
      // memasukan value _name kedalam class user di variable name
      User.name = _name;
      // memasukan value _npassword kedalam class user di variable name
      User.password = _password;

      // print(User.name);
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          // alert ketika submit
          title: const Text('Registrasi Berhasil'), // judul alert
          content: Text(
              'User dengan nama ${User.name} berhasil terdaftar.'), // isi alert dengan menampilkan nama yang telah dibuat
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pushNamed(
                  context, "/login"), //  navigasi untuk ke halaman login
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrasi'),
        automaticallyImplyLeading: false, // untuk menghilangkan tombol back
      ),
      body: Container(
        // color: Colors.amber,
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Username'),
                validator: (value) {
                  //pengecekan berdasarkan value dari textfield
                  if (value!.isEmpty) {
                    // apabila value kosong
                    return 'Username tidak boleh kosong'; // hasil yang ditampilkan apabila kondisi terpenuhi
                  }
                  return null;
                },
                onSaved: (value) => _name =
                    value!, // memasukan isi dari textfield form kedalam variable _name
              ),
              const SizedBox(height: 16),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Password'),
                validator: (value) {
                  //pengecekan berdasarkan value dari textfield
                  if (value!.isEmpty) {
                    // apabila value kosong
                    return 'Password tidak boleh kosong'; // hasil yang ditampilkan apabila kondisi terpenuhi
                  }
                  return null;
                },
                onSaved: (value) => _password =
                    value!, //memasukan isi dari textfield form kedalam variable _password
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed:
                    _submitForm, // ketika button di klik maka akan menjalankan fungsi _submitForm
                child: const Text('Registrasi'), // isi tulisan dari buttonnya
              ),
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.center, // supaya konten berada ditengah
                children: [
                  const Text(
                    "Sudah Memiliki Akun?",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context,
                          '/login'); // navigasi yang ditujukan ke halaman login
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        color: Color(0xffEC008D),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
