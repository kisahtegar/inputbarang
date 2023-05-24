import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:inputbarang_client/inputbarang_client.dart';

import '../../components/page_banner_widget.dart';
import '../../main.dart';

class BarangScreen extends StatefulWidget {
  const BarangScreen({super.key});

  @override
  State<BarangScreen> createState() => _BarangScreenState();
}

class _BarangScreenState extends State<BarangScreen> {
  late Future<List<DaftarBarang>> daftarBarangs;

  // Initialize state.
  @override
  void initState() {
    super.initState();
    fetchDaftarBarangs();
  }

  // Build a widget.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            const PageBannerWidget(
              title: 'Data Barang',
              icon: FontAwesomeIcons.box,
              iconColor: Color.fromARGB(255, 209, 162, 33),
            ),
            const SizedBox(height: 15),

            // Table
            FutureBuilder<List<DaftarBarang>>(
              future: daftarBarangs,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const CircularProgressIndicator.adaptive();
                }

                final loadedDaftarBarangs = snapshot.data!;

                if (snapshot.hasData) {
                  return Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: dataTableBody(loadedDaftarBarangs),
                    ),
                  );
                }
                return const CircularProgressIndicator.adaptive();
              },
            ),
          ],
        ),
      ),
    );
  }

  /// Widget DataTable.
  SingleChildScrollView dataTableBody(List<DaftarBarang> listDaftarBarang) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: DataTable(
        sortColumnIndex: 0,
        showCheckboxColumn: false,
        columns: const [
          DataColumn(
            label: Text('ID'),
            numeric: false,
            tooltip: "ID",
          ),
          DataColumn(
            label: Text('Nama Barang'),
            numeric: false,
            tooltip: "Nama Barang",
          ),
          DataColumn(
            label: Text('Jenis Barang'),
            numeric: false,
            tooltip: "Jenis Barang",
          ),
        ],
        rows: listDaftarBarang
            .map(
              (daftarBarang) => DataRow(
                cells: [
                  DataCell(Text(daftarBarang.id.toString())),
                  DataCell(Text(daftarBarang.nama_barang)),
                  DataCell(Text(daftarBarang.jenis_barang)),
                ],
              ),
            )
            .toList(),
      ),
    );
  }

  /// Fetching DaftarBarangs.
  fetchDaftarBarangs() {
    try {
      daftarBarangs = client.daftarBarang.getDaftarBarangs();
      setState(() {});
    } on Exception catch (e) {
      debugPrint('$e');
    }
  }
}
