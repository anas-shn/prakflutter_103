# pert10_103

Nama : Anas Sholihin <br>
NIM : H1D023103 <br>
Shift: E > F <br>

# Aplikasi Produk (Prak Flutter_103)

Deskripsi singkat
-----------------
Proyek ini adalah aplikasi mobile (Flutter) yang berfungsi sebagai front-end untuk manajemen produk dan registrasi pengguna. Backend dibuat dengan CodeIgniter 4 (PHP) dan menyediakan endpoint RESTful untuk operasi CRUD produk serta autentikasi/registrasi pengguna. Gambar / ilustrasi proyek disimpan di folder `docs/`.

Di README ini saya jelaskan cara menjalankan project, struktur file penting, konfigurasi yang sering diperlukan (CORS, pengaturan API untuk emulator), serta troubleshooting umum.

Fitur utama
-----------
- Lihat daftar produk
- Tambah / Edit / Hapus produk
- Registrasi pengguna
- Login (menyimpan token)
- Halaman detail produk dan form input

Screenshoot

### Login Page
![Login Page](https://github.com/anas-shn/prakflutter_103/blob/main/docs/login-page.png)
### Login Error
![Login Error](https://github.com/anas-shn/prakflutter_103/blob/main/docs/login-error.png)
### Register Error
![Register Error](https://github.com/anas-shn/prakflutter_103/blob/main/docs/regist-error.png)
### Product List
![Product list](https://github.com/anas-shn/prakflutter_103/blob/main/docs/product-list.png)
### Product Detail
![Product detail](https://github.com/anas-shn/prakflutter_103/blob/main/docs/product-detail.png)
###Product Edit
![Product Edit](https://github.com/anas-shn/prakflutter_103/blob/main/docs/product-edit.png)
### Product Delete
![Product Delete](https://github.com/anas-shn/prakflutter_103/blob/main/docs/product-delete.png)


Struktur proyek (ringkas)
-------------------------
- `lib/` - kode sumber Flutter
  - `lib/ui/` - halaman UI (produk, registrasi, form, dll.)
  - `lib/bloc/` - logic komunikasi dengan API (API client wrapper)
  - `lib/helpers/` - helper seperti `api.dart`, `api_url.dart`, `app_exception.dart`
  - `lib/model/` - model data (Produk, Registrasi, dst.)
  - `lib/widget/` - widget bantu (dialog sukses, warning)
- `android/` - konfigurasi Android (manifest, permission)
- `docs/` - gambar/ilustrasi untuk README (sebut path dalam markdown: `docs/namagambar.png`)
- Backend (terpisah): CodeIgniter 4 app (disajikan pada host: `http://localhost:8080` saat develop)

Persiapan & requirement
----------------------
- Flutter SDK (sesuaikan versi yang kompatibel)
- Dart SDK (biasanya sudah bundel dengan Flutter)
- Android SDK (jika ingin menjalankan di emulator / device)
- Backend: PHP + CodeIgniter 4 berjalan pada host (lokal atau server)
- Paket pub: dijalankan melalui `flutter pub get`

Konfigurasi API (client)
------------------------
File utama: `lib/helpers/api_url.dart`

- Untuk pengembangan lokal pada Linux/desktop, disarankan gunakan `http://127.0.0.1:8080` agar memaksa IPv4.
- Jika Anda menjalankan aplikasi pada Android emulator (AVD), gunakan `http://10.0.2.2:8080` agar emulator dapat mengakses host machine.
- Contoh implementasi: file menyediakan `baseUrl` berdasarkan platform (Platform.isAndroid -> `10.0.2.2`, Platform.isLinux -> `127.0.0.1`, lainnya -> `localhost`).
