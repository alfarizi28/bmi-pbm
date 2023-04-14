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
      body: Container(
        color: Colors.purple[300],
        child: Form(
          key: _formKey,
          child: Center(
            child: Card(
              elevation: 8,
              child: Container(
                padding: const EdgeInsets.all(32.0),
                constraints: const BoxConstraints(maxWidth: 350),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Image(
                        image: AssetImage('assets/images/gambar.png'),
                      ),
                    ),
                    // const FlutterLogo(size: 100),
                    const SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Text(
                        "Welcome to MandaPage",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Username',
                        hintText: 'Enter your username',
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(),
                      ),
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
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        hintText: 'Enter your password',
                        prefixIcon: Icon(Icons.lock_outline_rounded),
                        border: OutlineInputBorder(),
                      ),
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
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                        ),
                        onPressed: _submitForm,

                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            'Registrasi',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ), // ketika button di klik maka akan menjalankan fungsi _submitForm
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment
                          .center, // supaya konten berada ditengah
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
          ),
        ),
      ),
    );
  }
}
