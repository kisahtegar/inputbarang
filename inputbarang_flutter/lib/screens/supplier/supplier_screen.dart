import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:inputbarang_client/inputbarang_client.dart';
import 'package:inputbarang_flutter/main.dart';

import '../../components/input_data_widget.dart';
import '../../components/page_banner_widget.dart';
import '../../const/constants.dart';

class SupplierScreen extends StatefulWidget {
  const SupplierScreen({super.key});

  @override
  State<SupplierScreen> createState() => _SupplierScreenState();
}

class _SupplierScreenState extends State<SupplierScreen> {
  late Future<List<Supplier>> suppliers;
  // Initialize the state
  @override
  void initState() {
    super.initState();
    fetchSuppliers();
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
              title: 'Data Supplier',
              icon: FontAwesomeIcons.truckFieldUn,
              iconColor: Color.fromARGB(255, 241, 94, 35),
            ),
            const SizedBox(height: 15),

            // Table
            FutureBuilder<List<Supplier>>(
              future: suppliers,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const CircularProgressIndicator.adaptive();
                }

                final loadedSuppliers = snapshot.data!;

                if (snapshot.hasData) {
                  return Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: dataTableBody(loadedSuppliers),
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
        onPressed: _showSupplierDialog,
        backgroundColor: ColorConst.bgColor,
        icon: const FaIcon(FontAwesomeIcons.user),
        label: const Text('Tambah Supplier'),
      ),
    );
  }

  //  ==========================  [WIDGET] =====================================
  /// Widget DataTable.
  SingleChildScrollView dataTableBody(List<Supplier> listSupplier) {
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
            label: Text('Nama Supplier'),
            numeric: false,
            tooltip: "Nama Supplier",
          ),
          DataColumn(
            label: Text('Alamat Supplier'),
            numeric: false,
            tooltip: "Alamat Supplier",
          ),
          DataColumn(
            label: Text('Telepon Supplier'),
            numeric: false,
            tooltip: "Telepon Supplier",
          ),
          DataColumn(
            label: Text('Aksi'),
            numeric: false,
            tooltip: "Aksi",
          ),
        ],
        rows: listSupplier
            .map(
              (supplier) => DataRow(
                cells: [
                  DataCell(Text(supplier.id.toString())),
                  DataCell(Text(supplier.nama_supplier)),
                  DataCell(Text(supplier.alamat_supplier)),
                  DataCell(Text(supplier.telepon_supplier)),
                  DataCell(
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            _showSupplierDialog(supplier: supplier);
                          },
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.green),
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
                            deleteSupplier(supplier.id!);
                          },
                          style:
                              TextButton.styleFrom(backgroundColor: Colors.red),
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
              ),
            )
            .toList(),
      ),
    );
  }

  /// Widget that display dialog article.
  _showSupplierDialog({Supplier? supplier}) {
    var namaSupplierController = TextEditingController();
    var alamatSupplierController = TextEditingController();
    var teleponSupplierController = TextEditingController();

    // Checking article.
    if (supplier != null) {
      namaSupplierController.text = supplier.nama_supplier;
      alamatSupplierController.text = supplier.alamat_supplier;
      teleponSupplierController.text = supplier.telepon_supplier;
    }

    // Show dialog.
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Input Data Supplier',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                InputDataWidget(
                  inputDataController: namaSupplierController,
                  namaData: 'Nama Supplier',
                  hintText: 'Input nama supplier',
                  maxLength: 40,
                ),
                const Divider(),
                InputDataWidget(
                  inputDataController: alamatSupplierController,
                  namaData: 'Alamat Supplier',
                  hintText: 'Input alamat supplier',
                  maxLength: 100,
                ),
                const Divider(),
                InputDataWidget(
                  inputDataController: teleponSupplierController,
                  namaData: 'Telepon Supplier',
                  hintText: 'Input telepon supplier',
                  maxLength: 15,
                ),
                const Divider(),
                const SizedBox(height: 50),
                TextButton(
                  onPressed: () {
                    if (supplier != null) {
                      supplier.nama_supplier = namaSupplierController.text;
                      supplier.alamat_supplier = alamatSupplierController.text;
                      supplier.telepon_supplier =
                          teleponSupplierController.text;
                      updateSupplier(supplier);
                      Navigator.of(context).pop();
                    } else {
                      var newSupplier = Supplier(
                        nama_supplier: namaSupplierController.text,
                        alamat_supplier: alamatSupplierController.text,
                        telepon_supplier: teleponSupplierController.text,
                      );
                      addSupplier(newSupplier);
                      Navigator.of(context).pop();
                    }
                  },
                  style: TextButton.styleFrom(backgroundColor: Colors.green),
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
              ],
            ),
          ),
        );
      },
    );
  }

  //  ========================== [FUNCTION] ====================================
  /// Fetch suppliers.
  fetchSuppliers() {
    try {
      suppliers = client.supplier.getSuppliers();
      setState(() {});
    } on Exception catch (e) {
      debugPrint('$e');
    }
  }

  /// Add supplier.
  addSupplier(Supplier supplier) async {
    try {
      var result = await client.supplier.addSupplier(supplier);
      debugPrint('Add supplier status : $result');
      fetchSuppliers();
    } on Exception catch (e) {
      debugPrint('$e');
    }
  }

  /// Update supplier.
  updateSupplier(Supplier supplier) async {
    try {
      var result = await client.supplier.updateSupplier(supplier);
      debugPrint('Update supplier status : $result');
      fetchSuppliers();
    } on Exception catch (e) {
      debugPrint('$e');
    }
  }

  /// Delete supplier.
  deleteSupplier(int id) async {
    try {
      var result = await client.supplier.deleteSupplier(id);
      debugPrint('Delete supplier status : $result');
      fetchSuppliers();
    } on Exception catch (e) {
      debugPrint('$e');
    }
  }
}
