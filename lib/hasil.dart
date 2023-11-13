import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Hasil extends StatefulWidget {
  List<List<Map<String, dynamic>>> results;
  Hasil({super.key, required this.results});

  @override
  State<Hasil> createState() => _HasilState();
}

class _HasilState extends State<Hasil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Center(
          child: Text(
            'Hasil Pendeteksi Deepfake',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
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
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
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
                          Text(
                              widget.results[widget.results.length - 1][0]
                                  ['metode'],
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        DataCell(
                          Text(
                              widget.results[widget.results.length - 1][0]
                                  ['result'],
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        DataCell(
                          Text(
                              widget.results[widget.results.length - 1][0]
                                  ['akurasi'],
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        DataCell(
                          Text(
                              widget.results[widget.results.length - 1][0]
                                  ['waktu'],
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
                          Text(
                              widget.results[widget.results.length - 1][1]
                                  ['metode'],
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        DataCell(
                          Text(
                              widget.results[widget.results.length - 1][1]
                                  ['result'],
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        DataCell(
                          Text(
                              widget.results[widget.results.length - 1][1]
                                  ['akurasi'],
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        DataCell(
                          Text(
                              widget.results[widget.results.length - 1][1]
                                  ['waktu'],
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ],
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
