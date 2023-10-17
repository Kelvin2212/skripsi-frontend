import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Hasil extends StatefulWidget {
  const Hasil({super.key});

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
              ),
              SizedBox(height: 20),
              Container(
                color: Colors.white,
                child: DataTable(columns: [
                  DataColumn(label: Text('Kolom 1')),
                  DataColumn(label: Text('Kolom 2')),
                  DataColumn(label: Text('Kolom 3')),
                  DataColumn(label: Text('Kolom 4')),
                ], rows: [
                  DataRow(
                    cells: [
                      DataCell(Text('Data 1')),
                      DataCell(Text('Data 2')),
                      DataCell(Text('Data 3')),
                      DataCell(Text('Data 4')),
                    ],
                  ),
                  DataRow(cells: [
                    DataCell(Text('Data 5')),
                    DataCell(Text('Data 6')),
                    DataCell(Text('Data 7')),
                    DataCell(Text('Data 8')),
                  ]),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
