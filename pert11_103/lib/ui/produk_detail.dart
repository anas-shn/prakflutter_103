import 'package:flutter/material.dart';
import 'package:pert10_103/model/produk.dart';
import 'package:pert10_103/ui/produk_form.dart';
import 'package:pert10_103/bloc/produk_bloc.dart';
import 'package:pert10_103/ui/produk_page.dart';
import 'package:pert10_103/ui/warning_dialog.dart';

class ProdukDetail extends StatefulWidget {
  final Produk? produk;
  const ProdukDetail({super.key, this.produk});

  @override
  _ProdukDetailState createState() => _ProdukDetailState();
}

class _ProdukDetailState extends State<ProdukDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Produk Anasshn')),
      body: Center(
        child: Column(
          children: [
            Text(
              "Kode : ${widget.produk!.kodeProduk}",
              style: const TextStyle(fontSize: 20.0),
            ),
            Text(
              "Nama : ${widget.produk!.namaProduk}",
              style: const TextStyle(fontSize: 18.0),
            ),
            Text(
              "Harga : Rp. ${widget.produk!.hargaProduk.toString()}",
              style: const TextStyle(fontSize: 18.0),
            ),
            _tombolHapusEdit(),
          ],
        ),
      ),
    );
  }

  Widget _tombolHapusEdit() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Tombol Edit
        OutlinedButton(
          style: OutlinedButton.styleFrom(foregroundColor: Colors.green),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProdukForm(produk: widget.produk!),
              ),
            );
          },
          child: const Text("EDIT"),
        ),
        // Tombol Hapus
        OutlinedButton(
          onPressed: () => confirmHapus(),
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
          ),
          child: const Text("DELETE"),
        ),
      ],
    );
  }

  void confirmHapus() {
    AlertDialog alertDialog = AlertDialog(
      content: const Text("Yakin ingin menghapus data ini?"),
      actions: [
        //tombol hapus
        OutlinedButton(
          child: const Text("Ya"),
          onPressed: () {
            // produk.id is now int?, pass directly
            ProdukBloc.deleteProduk(id: widget.produk!.id).then(
              (value) => {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const ProdukPage()),
                ),
              },
              onError: (error) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => const WarningDialog(
                    description: "Hapus gagal, silahkan coba lagi",
                  ),
                );
              },
            );
          },
        ),
        //tombol batal
        OutlinedButton(
          child: const Text("Batal"),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
    showDialog(builder: (context) => alertDialog, context: context);
  }
}
