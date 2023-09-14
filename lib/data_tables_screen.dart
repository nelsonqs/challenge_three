import 'package:flutter/material.dart';

class DataTablesScreen extends StatefulWidget {
  DataTablesScreen({Key? key}) : super(key: key);

  @override
  State<DataTablesScreen> createState() => _DataTablesScreenState();
}

class _DataTablesScreenState extends State<DataTablesScreen> {
  int numColumnas = 3;

  int numFilas = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Tables'),
        centerTitle: true,
        backgroundColor: Colors.indigoAccent,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            sortAscending: _sortAscending,
            sortColumnIndex: _sortColumnIndex,
            headingRowColor:
                MaterialStateColor.resolveWith((states) => Colors.yellowAccent),
            dataRowColor:
                MaterialStateColor.resolveWith((states) => Colors.greenAccent),
            columns: addHeaders(),
            rows: _dataRows,
          ),
        ),
      ),
    );
  }

  List<DataColumn> addHeaders() {
    List<DataColumn> list = [];
    for (int i = 1; i <= numColumnas; i++) {
      list.add(DataColumn(
        label: i == 1
            ? const Text("Nombre")
            : i == 2
                ? const Text("Edad")
                : const Text("Profesión"),
        onSort: (columnIndex, ascending) {
          _sortData(columnIndex, ascending);
        },
      ));
    }
    return list;
  }

  final List<DataRow> _dataRows = [
    const DataRow(cells: [
      DataCell(Text('Pedro')),
      DataCell(Text('25')),
      DataCell(Text('Ingeniero')),
    ]),
    const DataRow(cells: [
      DataCell(Text('Sonia')),
      DataCell(Text('30')),
      DataCell(Text('Dentista')),
    ]),
    const DataRow(cells: [
      DataCell(Text('Ana')),
      DataCell(Text('30')),
      DataCell(Text('Secretaria')),
    ]),
    const DataRow(cells: [
      DataCell(Text('Carlos')),
      DataCell(Text('28')),
      DataCell(Text('Desarrollador')),
    ]),
    const DataRow(cells: [
      DataCell(Text('Mario')),
      DataCell(Text('25')),
      DataCell(Text('Físico')),
    ]),
    const DataRow(cells: [
      DataCell(Text('Freddy')),
      DataCell(Text('30')),
      DataCell(Text('Sereno')),
    ]),
    const DataRow(cells: [
      DataCell(Text('Rodrigo')),
      DataCell(Text('28')),
      DataCell(Text('Zapatero')),
    ]),
  ];

  // Indicador de columna ordenada
  int _sortColumnIndex = 0;

  bool _sortAscending = true;

  // Función para ordenar las filas del DataTable
  void _sortData(int columnIndex, bool ascending) {
    _dataRows.sort((a, b) {
      final aValue = a.cells[columnIndex].child.toString();
      final bValue = b.cells[columnIndex].child.toString();
      return ascending ? aValue.compareTo(bValue) : bValue.compareTo(aValue);
    });
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
  }
}
