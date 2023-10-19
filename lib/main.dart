import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_application_skripsi/hasil.dart';
import 'package:flutter_application_skripsi/tentangAplikasi.dart';
import 'package:flutter_application_skripsi/tutorial.dart';
import 'package:flutter_application_skripsi/unggah.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 4, // Jumlah tab (4 tab)
        child: Scaffold(
          body: Column(
            children: [
              Container(
                color: Colors.orange, // Warna latar belakang TabBar
                child: TabBar(
                  tabs: [
                    Tab(
                      child: Text(
                        'Beranda',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Hasil',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Bantuan',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Tentang Aplikasi',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Beranda(),
                    Hasil(),
                    Tutorial(),
                    Tentang(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Beranda extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/Beranda.png'),
          fit: BoxFit.none,
        )),
        child: Center(
          child: Stack(
            alignment: Alignment.bottomRight, // Posisi gambar di bawah kanan
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Selamat Datang !',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'Montserrat',
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Website sistem pendeteksi Deepfake berbasis citra',
                    style: TextStyle(
                      fontSize: 17,
                      fontFamily: 'Montserrat',
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UnggahImage()));
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.orange),
                    child: Text(
                      'Mulai Deteksi',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    padding: EdgeInsets.fromLTRB(170, 50, 0, 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Keterangan : ',
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Montserrat',
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    padding: EdgeInsets.fromLTRB(170, 0, 0, 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Website ini berfungsi membantu seseorang untuk mendeteksi sebuah\n citra gambar yang dicurigai sebagai sebuah gambar asli atau palsu',
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Montserrat',
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
