import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'side_menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var namauser;

  _loadUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    namauser = prefs.getString('username');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    _loadUsername();
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: Center(child: Text('Selamat Datang $namauser')),
      drawer: const SideMenu(),
    );
  }
}
