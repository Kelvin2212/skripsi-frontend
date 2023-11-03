import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Hasil extends StatefulWidget {
  List<Map<String,dynamic>> results;
  Hasil({super.key, required this.results});

  @override
  State<Hasil> createState() => _HasilState();
}

class _HasilState extends State<Hasil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Hasil Scanning',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign
                    .center, // Tambahkan properti ini untuk membuat teks berada di tengah
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: DataTable(
                  columnSpacing: 20.0,
                  dataRowHeight: 50.0,
                  headingRowHeight: 60.0,
                  columns: [
                    DataColumn(
                      label: Container(
                        child: Center(
                          child: Text(
                            'Metode',
                            style: TextStyle(
                              fontWeight: FontWeight.bold, // Tambahkan bold
                            ),
                          ),
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Container(
                        child: Center(
                          child: Text(
                            'Hasil',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Container(
                        child: Center(
                          child: Text(
                            'Tingkat Akurasi',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Container(
                        child: Center(
                          child: Text(
                            'Waktu',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                  rows: [
                    DataRow(
                      cells: [
                        DataCell(
                          Text('Autoencoder',
                              style: TextStyle(
                                  fontWeight:
                                      FontWeight.bold)), // Tambahkan bold
                        ),
                        DataCell(
                          Text('Real',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        DataCell(
                          Text('70%',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        DataCell(
                          Text('9 Detik',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ],
                      color: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.selected)) {
                            return Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.08);
                          }
                          return null;
                        },
                      ),
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          Text('Generative Adversarial Network',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        DataCell(
                          Text('Real',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        DataCell(
                          Text('70%',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        DataCell(
                          Text('6 Detik',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ],
                      color: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.selected)) {
                            return Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.08);
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
