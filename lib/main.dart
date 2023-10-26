import 'package:flutter/material.dart';
import 'package:latihan_flitter_1/auth/login.dart';
import 'package:latihan_flitter_1/auth/register.dart';

void main() {
  runApp(MaterialApp(
    title: "Kopi Shop",
    debugShowCheckedModeBanner: false,
    initialRoute: '/login',
    routes: {
      '/login': (context) => Login(),
      '/register': (context) => Register()
    },
  ));
}