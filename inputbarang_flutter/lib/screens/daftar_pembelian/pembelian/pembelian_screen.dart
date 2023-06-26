import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:inputbarang_client/inputbarang_client.dart';
import 'package:intl/intl.dart';

import '../../../components/input_data_widget.dart';
import '../../../components/page_banner_widget.dart';
import '../../../const/constants.dart';
import '../../../main.dart';

class PembelianScreen extends StatefulWidget {
  const PembelianScreen({super.key});

  @override
  State<PembelianScreen> createState() => _PembelianScreenState();
}

class _PembelianScreenState extends State<PembelianScreen> {
  late Future<List<DaftarPembelian>> daftarPembelians;
  List<Supplier> suppliers = [];
  List<DaftarBarang> daftarBarangs = [];
  DaftarBarang? searchBarang;
  late Transaksi getNewTransaksi;

  // Initialize state.
  @override
  void initState() {
    super.initState();
    fetchDaftarPembelians();
    fetchSuppliers();
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
              title: 'Daftar Pembelian',
              icon: FontAwesomeIcons.cartShopping,
              iconColor: Color.fromARGB(255, 124, 80, 245),
              backButton: true,
            ),
            const SizedBox(height: 15),

            // Table
            FutureBuilder<List<DaftarPembelian>>(
              future: daftarPembelians,
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
        onPressed: _showDaftarPembelianDialog,
        backgroundColor: ColorConst.bgColor,
        icon: const Icon(Icons.shopify_rounded),
        label: const Text('Tambah Pembelian'),
      ),
    );
  }

  /// Widget that display dialog article.
  _showDaftarPembelianDialog({DaftarPembelian? daftarPembelian}) {
    // Daftar Pembelian Controller
    var jumlahController = TextEditingController();
    var hargaBarangController = TextEditingController();

    // Transaksi Controller
    var dateController = TextEditingController();
    DateTime? dateTimeSelected = DateTime.now();
    TimeOfDay? timeSelected = TimeOfDay.now();
    DateTime? timeSelectedToDateTime;

    // Supplier Controller
    Supplier? supplierSelected;
    var namaSupplierController = TextEditingController();

    // Barang Controller
    var namaBarangController = TextEditingController();
    var jenisBarangController = TextEditingController();
    var namaBarangTersediaController = TextEditingController();
    DaftarBarang? barangSelected;

    // Initialized state.
    // @override
    // void initState() {
    //   super.initState();
    //   dateController.text =
    //       "${dateTimeSelected!.year}-${dateTimeSelected!.month.toString().padLeft(2, '0')}-${dateTimeSelected!.day.toString().padLeft(2, '0')}";

    //   timeSelectedToDateTime = DateTime(
    //     dateTimeSelected!.year,
    //     dateTimeSelected!.month,
    //     dateTimeSelected!.day,
    //     timeSelected.hour,
    //     timeSelected.minute,
    //   );
    // }

    // Show dialog.
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return SingleChildScrollView(
          child: Dialog(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Input Data Pembelian',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  const Divider(),
                  InputDataWidget(
                    inputDataController: jumlahController,
                    namaData: 'Jumlah Barang',
                    hintText: 'Input jumlah barang',
                    maxLength: 255,
                  ),
                  const Divider(),
                  InputDataWidget(
                    inputDataController: hargaBarangController,
                    namaData: 'Harga Barang',
                    hintText: 'Input harga barang',
                    maxLength: 255,
                  ),
                  const Divider(),

                  // DROP DOWN BUTTON SUPPLIER
                  Row(
                    children: [
                      const SizedBox(
                        width: 90,
                        child: Text(
                          'Nama Supplier',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(width: 30),
                      // FutureBuilder<List<Supplier>>(
                      //   future: suppliers,
                      //   builder: (context, snapshot) {
                      //     if (!snapshot.hasData) {
                      //       return const CircularProgressIndicator.adaptive();
                      //     }

                      //     final loadedSuppliers = snapshot.data!;

                      //     if (snapshot.hasData) {
                      //       return Expanded(
                      //         child: DropdownButton<Supplier>(
                      //           value: supplierSelected,
                      //           items: loadedSuppliers
                      //               .map<DropdownMenuItem<Supplier>>(
                      //             (Supplier supplier) {
                      //               return DropdownMenuItem<Supplier>(
                      //                 value: supplier,
                      //                 child:
                      //                     Text(supplier.nama_supplier.toString()),
                      //               );
                      //             },
                      //           ).toList(),
                      //           onChanged: (supplier) {
                      //             setState(() {
                      //               supplierSelected = supplier;
                      //               supplierIndex = supplier?.id ?? 1;
                      //             });
                      //             debugPrint(supplierSelected.toString());
                      //           },
                      //         ),
                      //       );
                      //     }
                      //     return const CircularProgressIndicator.adaptive();
                      //   },
                      // ),

                      Expanded(
                        child: TextField(
                          controller: namaSupplierController,
                          readOnly: true,
                        ),
                      ),
                      DropdownButton<Supplier>(
                        value: supplierSelected,
                        items: suppliers.map<DropdownMenuItem<Supplier>>(
                          (Supplier supplier) {
                            return DropdownMenuItem<Supplier>(
                              value: supplier,
                              child: Text(supplier.nama_supplier.toString()),
                            );
                          },
                        ).toList(),
                        onChanged: (supplier) {
                          setState(() {
                            supplierSelected = supplier;

                            if (supplier != null) {
                              String newSupplierName = supplier.nama_supplier;
                              namaSupplierController.text = newSupplierName;
                            }
                          });
                        },
                      ),
                    ],
                  ),
                  const Divider(),

                  // Date Picker
                  Row(
                    children: [
                      const SizedBox(
                        width: 90,
                        child: Text(
                          'Tanggal Transaksi',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(width: 30),
                      Expanded(
                        child: TextField(
                          controller: dateController,
                          readOnly: true,
                          decoration: const InputDecoration(
                            icon: Icon(Icons.calendar_today),
                            hintText: 'Input tanggal',
                            counterStyle: TextStyle(
                              height: double.minPositive,
                            ),
                          ),
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2023),
                              lastDate: DateTime(2100),
                            );

                            if (pickedDate != null) {
                              String formattedDate =
                                  DateFormat('yyyy-MM-dd').format(pickedDate);
                              setState(() {
                                dateController.text = formattedDate;
                                dateTimeSelected = pickedDate;

                                // Convert TimeOfDay to DateTime
                                timeSelectedToDateTime = DateTime(
                                  pickedDate.year,
                                  pickedDate.month,
                                  pickedDate.day,
                                  timeSelected.hour,
                                  timeSelected.minute,
                                );
                              });
                            } else {}
                          },
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),
                  const Text(
                    'Input Data Barang Tersedia',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),

                  Row(
                    children: [
                      const SizedBox(
                        width: 90,
                        child: Text(
                          'Nama Barang Tersedia',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(width: 30),
                      Expanded(
                        child: TextField(
                          controller: namaBarangTersediaController,
                          readOnly: true,
                        ),
                      ),
                      DropdownButton<DaftarBarang>(
                        value: barangSelected,
                        items:
                            daftarBarangs.map<DropdownMenuItem<DaftarBarang>>(
                          (DaftarBarang daftarBarang) {
                            return DropdownMenuItem<DaftarBarang>(
                              value: daftarBarang,
                              child: Text(daftarBarang.nama_barang.toString()),
                            );
                          },
                        ).toList(),
                        onChanged: (daftarBarang) {
                          setState(() {
                            barangSelected = daftarBarang;

                            if (daftarBarang != null) {
                              String newBarangTersedia =
                                  daftarBarang.nama_barang;
                              namaBarangTersediaController.text =
                                  newBarangTersedia;
                            }
                          });
                          debugPrint(barangSelected.toString());
                        },
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),
                  const Text(
                    'Input Data Barang Baru',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  const Divider(),
                  const Divider(),
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

                  // Row of buttons save and exit.
                  Row(
                    children: [
                      // Button: Save button.
                      Expanded(
                        child: TextButton(
                          onPressed: () async {
                            // ADD TRANSAKSI
                            var newTransaksi = Transaksi(
                              supplierId: supplierSelected?.id ?? 0,
                              tanggal_transaksi: timeSelectedToDateTime!,
                            );
                            var resultTransaksi = await client.transaksi
                                .addTransaksi(newTransaksi);
                            debugPrint(resultTransaksi.toString());

                            // ADD BARANG
                            if (barangSelected != null) {
                              // ADD DAFTAR PEMBELIAN
                              var newDaftarPembelian = DaftarPembelian(
                                transaksiId: resultTransaksi.id!,
                                daftarBarangId: barangSelected?.id ?? 0,
                                jumlah: int.parse(jumlahController.text),
                                harga_barang:
                                    int.parse(hargaBarangController.text),
                              );
                              addDaftarPembelian(newDaftarPembelian);
                            } else {
                              var newDaftarBarang = DaftarBarang(
                                nama_barang: namaBarangController.text,
                                jenis_barang: jenisBarangController.text,
                              );
                              var resultDaftarBarang = await client.daftarBarang
                                  .addDaftarBarang(newDaftarBarang);
                              debugPrint(resultDaftarBarang.toString());

                              // ADD DAFTAR PEMBELIAN
                              var newDaftarPembelian = DaftarPembelian(
                                transaksiId: resultTransaksi.id!,
                                daftarBarangId: resultDaftarBarang.id!,
                                jumlah: int.parse(jumlahController.text),
                                harga_barang:
                                    int.parse(hargaBarangController.text),
                              );
                              addDaftarPembelian(newDaftarPembelian);
                            }
                            // var newDaftarBarang = DaftarBarang(
                            //   kode_barang: kodeBarangController.text,
                            //   nama_barang: namaBarangController.text,
                            //   jenis_barang: jenisBarangController.text,
                            // );
                            // var resultDaftarBarang = await client.daftarBarang
                            //     .addDaftarBarang(newDaftarBarang);
                            // debugPrint(resultDaftarBarang.toString());

                            // // ADD DAFTAR PEMBELIAN
                            // var newDaftarPembelian = DaftarPembelian(
                            //   transaksiId: resultTransaksi.id!,
                            //   daftarBarangId:
                            //       barangSelected?.id ?? resultDaftarBarang.id!,
                            //   kode_pembelian: kodePembelianController.text,
                            //   jumlah: int.parse(jumlahController.text),
                            //   harga_barang:
                            //       int.parse(hargaBarangController.text),
                            // );
                            // addDaftarPembelian(newDaftarPembelian);

                            // Close Dialog
                            Navigator.of(context).pop();
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
          ),
        );
      },
    );
  }

  /// Widget DataTable.
  SingleChildScrollView dataTableBody(
    List<DaftarPembelian> listDaftarPembelian,
  ) {
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
            label: Text('Kode Pembelian'),
            numeric: false,
            tooltip: "Id Pembelian",
          ),
          DataColumn(
            label: Text('Jumlah'),
            numeric: false,
            tooltip: "Jumlah",
          ),
          DataColumn(
            label: Text('Total Harga'),
            numeric: false,
            tooltip: "Total Harga",
          ),
          DataColumn(
            label: Text('Kode Transaksi'),
            numeric: false,
            tooltip: "Transaksi ID",
          ),
          DataColumn(
            label: Text('Kode Barang'),
            numeric: false,
            tooltip: "Daftar Barang ID",
          ),
        ],
        rows: listDaftarPembelian.map((daftarPembelian) {
          // get index
          int index = listDaftarPembelian.indexOf(daftarPembelian);

          return DataRow(
            cells: [
              DataCell(Text('${index + 1}')),
              DataCell(Text(daftarPembelian.id.toString())),
              DataCell(Text(daftarPembelian.jumlah.toString())),
              DataCell(Text(daftarPembelian.harga_barang.toString())),
              DataCell(Text(daftarPembelian.transaksiId.toString())),
              DataCell(Text(daftarPembelian.daftarBarangId.toString())),
            ],
          );
        }).toList(),
      ),
    );
  }

  //  ========================== [FUNCTION] ====================================
  /// Fetch suppliers.
  fetchSuppliers() async {
    try {
      suppliers = await client.supplier.getSuppliers();
      setState(() {});
    } on Exception catch (e) {
      debugPrint('$e');
    }
  }

  /// Fetching daftar barangs.
  fetchDaftarBarangs() async {
    try {
      daftarBarangs = await client.daftarBarang.getDaftarBarangs();
      setState(() {});
    } on Exception catch (e) {
      debugPrint('$e');
    }
  }

  /// Find daftar barang
  findDaftarBarang({required int daftarBarangId}) async {
    try {
      searchBarang = await client.daftarBarang.findDaftarBarang(daftarBarangId);
      setState(() {});
    } on Exception catch (e) {
      debugPrint('$e');
    }
  }

  /// Fetching daftar pembelian.
  fetchDaftarPembelians() {
    try {
      daftarPembelians = client.daftarPembelian.getDaftarPembelians();
      setState(() {});
    } on Exception catch (e) {
      debugPrint('$e');
    }
  }

  /// Fetching aftar barangs.
  // searchDaftarBarang({String? keyword}) {
  //   try {
  //     searchBarang = client.daftarBarang.getDaftarBarangs(keyword: keyword);
  //     setState(() {});
  //   } on Exception catch (e) {
  //     debugPrint('$e');
  //   }
  // }

  /// Adding a new daftar barang
  // addDaftarBarang(DaftarBarang daftarBarang) async {
  //   try {
  //     var result = await client.daftarBarang.addDaftarBarang(daftarBarang);
  //     debugPrint('Add daftar barang status : $result');

  //     // Navigator.of(context).pop();
  //     fetchDaftarBarangs();
  //   } on Exception catch (e) {
  //     debugPrint('$e');
  //   }
  // }

  /// Adding a new daftar pembelian
  addDaftarPembelian(DaftarPembelian daftarPembelian) async {
    try {
      var result =
          await client.daftarPembelian.addDaftarPembelian(daftarPembelian);
      debugPrint('Add daftar barang status : $result');

      // Navigator.of(context).pop();
      fetchDaftarPembelians();
    } on Exception catch (e) {
      debugPrint('$e');
    }
  }
}
