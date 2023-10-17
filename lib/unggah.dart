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

  Future<void> selectedImage() async {
    final imgPicker = ImagePicker();
    final XFile? pickedFile =
        await imgPicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final imageBytes = await pickedFile.readAsBytes();
      setState(() {
        _image = imageBytes;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_image !=
                null) // Hanya tampilkan gambar jika ada gambar yang dipilih
              Container(
                child: Image.memory(_image!, fit: BoxFit.cover),
                width: 200, // Sesuaikan lebar gambar
                height: 200, // Sesuaikan tinggi gambar
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: selectedImage,
              child: Text('Pilih Gambar'),
            ),
            SizedBox(height: 20),
            TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.orange),
              onPressed: (() {}),
              child: Text(
                'Uji',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
