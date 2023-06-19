import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:inputbarang_client/inputbarang_client.dart';

import '../../const/constants.dart';
import '../../components/input_data_widget.dart';
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _showDaftarBarangDialog,
        backgroundColor: ColorConst.bgColor,
        icon: const Icon(Icons.add_box),
        label: const Text('Tambah Barang'),
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
            label: Text('No.'),
            numeric: false,
            tooltip: "No.",
          ),
          DataColumn(
            label: Text('Kode Barang'),
            numeric: false,
            tooltip: "Kode Barang",
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
          DataColumn(
            label: Text('Aksi'),
            numeric: false,
            tooltip: "Aksi",
          ),
        ],
        rows: listDaftarBarang.map((daftarBarang) {
          // get index
          int index = listDaftarBarang.indexOf(daftarBarang);

          return DataRow(
            cells: [
              DataCell(Text('${index + 1}')),
              DataCell(Text(daftarBarang.kode_barang)),
              DataCell(Text(daftarBarang.nama_barang)),
              DataCell(Text(daftarBarang.jenis_barang)),
              DataCell(
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        _showDaftarBarangDialog(daftarBarang: daftarBarang);
                      },
                      style:
                          TextButton.styleFrom(backgroundColor: Colors.green),
                      child: const Row(
                        children: [
                          FaIcon(
                            FontAwesomeIcons.pen,
                            color: Colors.white,
                            size: 13,
                          ),
                          SizedBox(width: 5),
                          Text(
                            'Update',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    TextButton(
                      onPressed: () {
                        deleteDaftarBarang(daftarBarang.id!);
                      },
                      style: TextButton.styleFrom(backgroundColor: Colors.red),
                      child: const Row(
                        children: [
                          FaIcon(
                            FontAwesomeIcons.trash,
                            color: Colors.white,
                            size: 13,
                          ),
                          SizedBox(width: 5),
                          Text(
                            'Delete',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }

  /// Widget that display dialog article.
  _showDaftarBarangDialog({DaftarBarang? daftarBarang}) {
    var kodeBarangController = TextEditingController();
    var namaBarangController = TextEditingController();
    var jenisBarangController = TextEditingController();

    // Checking article.
    if (daftarBarang != null) {
      kodeBarangController.text = daftarBarang.kode_barang;
      namaBarangController.text = daftarBarang.nama_barang;
      jenisBarangController.text = daftarBarang.jenis_barang;
    }

    // Show dialog.
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  daftarBarang != null
                      ? 'Update Data Barang'
                      : 'Input Data Barang',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                InputDataWidget(
                  inputDataController: kodeBarangController,
                  namaData: 'Kode Barang',
                  hintText: 'Input kode barang',
                  maxLength: 6,
                ),
                InputDataWidget(
                  inputDataController: namaBarangController,
                  namaData: 'Nama Barang',
                  hintText: 'Input nama barang',
                  maxLength: 255,
                ),
                const Divider(),
                InputDataWidget(
                  inputDataController: jenisBarangController,
                  namaData: 'Jenis Barang',
                  hintText: 'Input jenis barang',
                  maxLength: 10,
                ),
                const Divider(),
                const SizedBox(height: 50),
                Row(
                  children: [
                    // Button: Save button.
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          if (daftarBarang != null) {
                            daftarBarang.nama_barang =
                                namaBarangController.text;
                            daftarBarang.jenis_barang =
                                jenisBarangController.text;
                            updateDaftarBarang(daftarBarang);
                            Navigator.of(context).pop();
                          } else {
                            var newDaftarBarang = DaftarBarang(
                              kode_barang: kodeBarangController.text,
                              nama_barang: namaBarangController.text,
                              jenis_barang: jenisBarangController.text,
                            );
                            addDaftarBarang(newDaftarBarang);
                            Navigator.of(context).pop();
                          }
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.save_alt_outlined,
                              color: Colors.white,
                            ),
                            Text(
                              'Save',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),

                    // Button: Cancel button.
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style:
                            TextButton.styleFrom(backgroundColor: Colors.red),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.exit_to_app,
                              color: Colors.white,
                            ),
                            Text(
                              'Exit',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  /// Fetching aftar barangs.
  fetchDaftarBarangs() {
    try {
      daftarBarangs = client.daftarBarang.getDaftarBarangs();
      setState(() {});
    } on Exception catch (e) {
      debugPrint('$e');
    }
  }

  /// Adding a new daftar barang
  addDaftarBarang(DaftarBarang daftarBarang) async {
    try {
      var result = await client.daftarBarang.addDaftarBarang(daftarBarang);
      debugPrint('Add daftar barang status : $result');

      // Navigator.of(context).pop();
      fetchDaftarBarangs();
    } on Exception catch (e) {
      debugPrint('$e');
    }
  }

  /// Updating an daftar barang.
  updateDaftarBarang(DaftarBarang daftarBarang) async {
    try {
      var result = await client.daftarBarang.updateDaftarBarang(daftarBarang);
      debugPrint('Update daftar barang status : $result');

      // Navigator.of(context).pop();
      fetchDaftarBarangs();
    } on Exception catch (e) {
      debugPrint('$e');
    }
  }

  /// Deleting an daftar barang.
  deleteDaftarBarang(int id) async {
    try {
      var result = await client.daftarBarang.deleteDaftarBarang(id);
      debugPrint('Delete daftar barang status : $result');

      fetchDaftarBarangs();
    } on Exception catch (e) {
      debugPrint('$e');
    }
  }
}
