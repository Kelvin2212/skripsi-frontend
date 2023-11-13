import 'dart:convert';
import 'dart:html';
import 'dart:typed_data';
// import 'package:dio/dio.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_skripsi/hasil.dart';
import 'package:flutter_application_skripsi/utils/api.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http_parser/http_parser.dart';

class UnggahImage extends StatefulWidget {
  Function? onResultChange;
  UnggahImage({Key? key, required this.onResultChange}) : super(key: key);

  @override
  _UnggahImageState createState() => _UnggahImageState();
}

class _UnggahImageState extends State<UnggahImage> {
  Uint8List? _image;
  String? result;
  bool _imageDeleted = false;
  FormData? _body;
  bool is_loading = false;

  String getFileSize(int bytes) {
    double kb = (bytes / 1024).toDouble();
    if (kb > 1024) {
      return (kb / 1024).toStringAsFixed(2) + " MB";
    } else {
      return kb.toStringAsFixed(2) + " KB";
    }
  }

  void onUjiClickHandler() async {
    try {
      setState(() {
        is_loading = true;
      });
      Dio dio = Dio();
      dio.options.headers['Content-Type'] = 'multipart/form-data';
      final mimeType = MediaType.parse('image/jpeg');
      FormData formData = FormData.fromMap({
        "uploaded_file": MultipartFile.fromBytes(
          _image!,
          filename: "image.jpg",
          contentType: mimeType,
        ),
      });

      var response = await dio.post(
        'http://localhost:8080/predict_image',
        data: formData,
        options: Options(headers: {
          'Content-Type': 'multipart/form-data',
        }),
      );

      Navigator.pop(context);

      if (response.statusCode == 200) {
        setState(() {
          is_loading = false;
        });
        widget.onResultChange!(List<Map<String, dynamic>>.from(response.data));

        List<Map<String, dynamic>> results =
            List<Map<String, dynamic>>.from(response.data);
        if (results.isNotEmpty) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Hasil(results: [results])));
        } else {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text('Error'),
                    content: Text('Anda belum memasukkan gambar!'),
                    actions: [
                      TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text("OK"))
                    ],
                  ));
        }
      } else {
        print('Error: ${response.statusMessage}');
      }
    } catch (error) {
      print('Error: $error');
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
        _imageDeleted = false;
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
        backgroundColor: Colors.orange,
        title: Text(
          'Sistem Pendeteksi Deepfake',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
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
                  width: 200,
                  height: 200,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      color: Colors.grey[300],
                      child: Center(
                        child: _image != null
                            ? Image.memory(_image!, fit: BoxFit.cover)
                            : Text("Gambar belum dipilih"),
                      ),
                    ),
                  ),
                ),
                if (_image != null && !_imageDeleted)
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
                    SizedBox(width: 10),
                    if (_image != null && !_imageDeleted)
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
                      onPressed: onUjiClickHandler,
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.orange,
                        primary: Colors.white,
                      ),
                      child: Text(
                        'Uji',
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20),
                if (result != null) Text(result!),
              ],
            ),
          ),
          if (is_loading)
            Stack(
              children: [
                ModalBarrier(
                  color:
                      Colors.black.withOpacity(0.6), // Black background color
                  dismissible: false,
                ),
                Center(
                  child: CircularProgressIndicator(),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
