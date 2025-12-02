class Produk {
  int? id;
  String? kodeProduk;
  String? namaProduk;
  var hargaProduk;
  Produk({this.id, this.kodeProduk, this.namaProduk, this.hargaProduk});
  factory Produk.fromJson(Map<String, dynamic> obj) {
    // Support id as int or string from JSON
    final dynamic rawId = obj['id'];
    int? parsedId;
    if (rawId is int) {
      parsedId = rawId;
    } else if (rawId is String) {
      parsedId = int.tryParse(rawId);
    } else {
      parsedId = null;
    }

    return Produk(
      id: parsedId,
      kodeProduk: obj['kode_produk'],
      namaProduk: obj['nama_produk'],
      hargaProduk: obj['harga'],
    );
  }
}
