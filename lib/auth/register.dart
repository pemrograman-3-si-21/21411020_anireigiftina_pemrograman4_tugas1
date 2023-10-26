import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Register extends StatefulWidget {
  const Register({super.key});
  @override
  RegisterPage createState() => RegisterPage();
}

class RegisterPage extends State<Register> {
  TextEditingController txtUserName = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  TextEditingController txtNamaLengkap = TextEditingController();
  TextEditingController txtNoTelpon = TextEditingController();
  final dio = Dio();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Register Form'),
        ),
        body: ListView(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 100),
                  Text("Registrasi",
                      style:
                          TextStyle(fontWeight: FontWeight.bold)), // jadi bold
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: TextField(
                      controller: txtUserName,
                      decoration: InputDecoration(hintText: "Username"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: TextField(
                      controller: txtPassword,
                      decoration: InputDecoration(hintText: "Password"),
                      obscureText: true,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: TextField(
                      controller: txtNamaLengkap,
                      decoration: InputDecoration(hintText: "NamaLengkap"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: TextField(
                      controller: txtNoTelpon,
                      decoration: InputDecoration(hintText: "NoTelpon"),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue.shade400,
                        ),
                        onPressed: () {
                          doRegister(txtUserName.text, txtPassword.text, txtNamaLengkap.text, txtNoTelpon.text);
                        },
                        child: Text('Register!'),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
  void doRegister(String username, String password, String namalengkap, String notelp) async {
    try {
      Response response;
      response = 
        await dio.post('http://localhost:3000/users/registrasi', data: {
      'username': username, 
      'password': password, 
      'nama_lengkap': namalengkap, 
      'no_telp': notelp,
      });
      if(response.data['status']) {
        Fluttertoast.showToast(
          msg: "Registrasi Berhasil cuy real",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Color.fromARGB(255, 244, 163, 1),
          textColor: Colors.white,
          fontSize: 16.0
    );
      } else{
        print("----");
        Fluttertoast.showToast(
          msg: response.data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0   
    );
    }
    } catch (e) {
      throw Exception('Error $e');
    }
  }
}

