import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:inputbarang_client/inputbarang_client.dart';

import '../../../components/page_banner_widget.dart';
import '../../../main.dart';

class TransaksiScreen extends StatefulWidget {
  const TransaksiScreen({super.key});

  @override
  State<TransaksiScreen> createState() => _TransaksiScreenState();
}

class _TransaksiScreenState extends State<TransaksiScreen> {
  late Future<List<Transaksi>> daftarTransaksi;

  @override
  void initState() {
    super.initState();
    fetchDaftarBarangs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            const PageBannerWidget(
              title: 'Daftar Transaksi',
              icon: FontAwesomeIcons.moneyBill,
              iconColor: Colors.green,
              backButton: true,
            ),
            const SizedBox(height: 15),

            // Table
            FutureBuilder<List<Transaksi>>(
              future: daftarTransaksi,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const CircularProgressIndicator.adaptive();
                }

                final loadedDaftarTransaksi = snapshot.data!;

                if (snapshot.hasData) {
                  return Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: dataTableBody(loadedDaftarTransaksi),
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
  SingleChildScrollView dataTableBody(List<Transaksi> listDaftarTransaksi) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: DataTable(
        sortColumnIndex: 0,
        showCheckboxColumn: false,
        columns: const [
          DataColumn(
            label: Text('No.'),
            numeric: false,
            tooltip: "No.",
          ),
          DataColumn(
            label: Text('ID Transaksi'),
            numeric: false,
            tooltip: "Id Transaksi",
          ),
          DataColumn(
            label: Text('Tanggal Transaksi'),
            numeric: false,
            tooltip: "Nama Barang",
          ),
          DataColumn(
            label: Text('ID Supplier'),
            numeric: false,
            tooltip: "ID Supplier",
          ),
        ],
        rows: listDaftarTransaksi.map((daftarTransaksi) {
          // get index
          int index = listDaftarTransaksi.indexOf(daftarTransaksi);

          return DataRow(
            cells: [
              DataCell(Text('${index + 1}')),
              DataCell(Text(daftarTransaksi.id.toString())),
              DataCell(Text(daftarTransaksi.tanggal_transaksi.toString())),
              DataCell(Text(daftarTransaksi.supplierId.toString())),
            ],
          );
        }).toList(),
      ),
    );
  }

  /// Fetching aftar barangs.
  fetchDaftarBarangs() {
    try {
      daftarTransaksi = client.transaksi.getDaftarTransaksis();
      setState(() {});
    } on Exception catch (e) {
      debugPrint('$e');
    }
  }
}
