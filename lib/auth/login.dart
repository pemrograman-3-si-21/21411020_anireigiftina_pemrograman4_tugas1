import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  LoginPage createState() => LoginPage();
}

class LoginPage extends State<Login> {
  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  final dio = Dio();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('PENJUALAN BUNGA'),
        ),
        body: ListView(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 100),
                  Text("Login", style: TextStyle(fontWeight: FontWeight.bold)),
                  Image.asset(
                    'assets/images/gambar.png',
                    width: 200,
                    height: 200,
                  ),
                  Padding(
                    padding: EdgeInsets.all(25),
                    child: TextField(
                      controller: txtUsername,
                      decoration: InputDecoration(hintText: "Masukan Username"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(25),
                    child: TextField(
                      controller: txtPassword,
                      decoration: InputDecoration(hintText: "Masukan Password"),
                      obscureText: true,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 6, 202, 228),
                        ),
                        onPressed: () {
                          print(txtUsername.text);
                          print(txtPassword.text);
                          doLogin(txtUsername.text, txtPassword.text);
                        },
                        child: Text('LOGIN'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            foregroundColor: Color.fromARGB(255, 11, 205, 202)),
                        onPressed: () {
                          Navigator.pushNamed(context, '/register');
                        },
                        child: Text('REGISTRASI'),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }

  void doLogin(String username, String password) async {
    try {
      Response response;
      response = await dio.post('http://192.168.46.35:3000/users/login',
          data: {'username': username, 'password': password});
      print(response);
      if (response.data['status']) {
        Fluttertoast.showToast(
            msg: "Berhasil Login",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        Fluttertoast.showToast(
            msg: response.data['msg'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } catch (e) {
      throw Exception('Eror $e');}
}
}