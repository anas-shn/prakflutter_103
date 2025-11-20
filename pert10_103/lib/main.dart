import 'package:flutter/material.dart';
import 'package:pert10_103/ui/login_page.dart';
import 'package:pert10_103/ui/produk_page.dart';
import 'package:pert10_103/ui/registrasi_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const ProdukPage(),
    );
  }
}
