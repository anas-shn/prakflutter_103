import 'package:belajarflutter/ui/produk_detail.dart';
import 'package:flutter/material.dart';

class ProdukForm extends StatefulWidget {
  const ProdukForm({super.key});
  @override
  _ProdukFormState createState() => _ProdukFormState();
}

class _ProdukFormState extends State<ProdukForm> {
  final _kodeProdukController = TextEditingController();
  final _namaProdukController = TextEditingController();
  final _hargaProdukController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Form Produk')),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            _textboxKodeProduk(),
            _textboxNamaProduk(),
            _textboxHarga(),
            _tombolSimpan(),
          ],
        ),
      ),
    );
  }

  _textboxKodeProduk() {
    return TextField(
      decoration: InputDecoration(labelText: 'Kode Produk'),
      controller: _kodeProdukController,
    );
  }

  _textboxNamaProduk() {
    return TextField(
      decoration: const InputDecoration(labelText: 'Nama Produk'),
      controller: _namaProdukController,
    );
  }

  _textboxHarga() {
    return TextField(
      decoration: const InputDecoration(labelText: 'Harga Produk'),
      controller: _hargaProdukController,
    );
  }

  _tombolSimpan() {
    return ElevatedButton(
      onPressed: () {
        String kodeProduk = _kodeProdukController.text;
        String namaProduk = _namaProdukController.text;
        int harga = int.parse(_hargaProdukController.text);
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProdukDetail(
              kodeProduk: kodeProduk,
              namaProduk: namaProduk,
              hargaProduk: harga,
            ),
          ),
        );
      },
      child: const Text('Simpan'),
    );
  }
}
