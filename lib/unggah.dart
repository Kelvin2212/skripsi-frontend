import 'dart:typed_data'; // Untuk Uint8List
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UnggahImage extends StatefulWidget {
  const UnggahImage({Key? key}) : super(key: key);

  @override
  _UnggahImageState createState() => _UnggahImageState();
}

class _UnggahImageState extends State<UnggahImage> {
  Uint8List? _image;
  bool _imageDeleted = false;

  String getFileSize(int bytes) {
    double kb = (bytes / 1024).toDouble();
    if (kb > 1024) {
      return (kb / 1024).toStringAsFixed(2) + " MB";
    } else {
      return kb.toStringAsFixed(2) + " KB";
    }
  }

  Future<void> selectedImage() async {
    final imgPicker = ImagePicker();
    final XFile? pickedFile =
        await imgPicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final imageBytes = await pickedFile.readAsBytes();
      setState(() {
        _image = imageBytes;
        _imageDeleted = false; // Setel kembali _imageDeleted menjadi false
      });
    }
  }

  void _deleteImage() {
    setState(() {
      _image = null;
      _imageDeleted = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange, // Warna latar belakang
        title: Text(
          'Sistem Pendeteksi Deepfake', // Teks di Navbar
          style: TextStyle(color: Colors.white), // Warna teks
        ),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Silahkan Upload File Gambar Yang Ingin Diuji",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Container(
              width: 200, // Lebar kotak container
              height: 200, // Tinggi kotak container
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10), // Membuat bentuk bulat
                child: Container(
                  color: Colors.grey[300], // Warna abu-abu
                  child: Center(
                    child: _image != null
                        ? Image.memory(_image!, fit: BoxFit.cover)
                        : Text("Gambar belum dipilih"),
                  ),
                ),
              ),
            ),
            if (_image != null &&
                !_imageDeleted) // Tampilkan tombol Hapus jika gambar ada dan belum dihapus
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  "Ukuran File: ${getFileSize(_image!.length)}",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: selectedImage,
                  child: Text('Input Gambar'),
                ),
                SizedBox(width: 10), // Tambahkan jarak sebesar 10
                if (_image != null &&
                    !_imageDeleted) // Tampilkan tombol Hapus jika gambar ada dan belum dihapus
                  ElevatedButton(
                    onPressed: _deleteImage,
                    child: Text('Hapus'),
                    style: ElevatedButton.styleFrom(primary: Colors.red),
                  ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: (() {}),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.orange, // Warna latar belakang
                    primary: Colors.white, // Warna teks
                  ),
                  child: Text(
                    'Uji',
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
