import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:inputbarang_client/inputbarang_client.dart';
import 'package:inputbarang_flutter/const/constants.dart';

import '../../components/page_banner_widget.dart';
import '../../main.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<Supplier> _suppliers = [];
  List<DaftarBarang> _daftarBarangs = [];
  List<DaftarPembelian> _daftarPembelians = [];

  @override
  void initState() {
    super.initState();
    fetchSuppliers();
    fetchDaftarBarangs();
    fetchDaftarPembelians();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            const PageBannerWidget(
              title: 'Overview',
              icon: FontAwesomeIcons.mountainSun,
              iconColor: Color.fromARGB(255, 35, 141, 241),
            ),
            const SizedBox(height: 15),
            Flexible(
              child: GridView.count(
                padding: const EdgeInsets.all(8),
                crossAxisSpacing: 10,
                childAspectRatio: (1 / .4),
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                children: <Widget>[
                  cardViewData(
                    title: 'Total Barang',
                    total: _daftarBarangs.length.toString(),
                    icon: FontAwesomeIcons.box,
                    iconColor: const Color.fromARGB(255, 209, 162, 33),
                  ),
                  cardViewData(
                    title: 'Total Supplier',
                    icon: FontAwesomeIcons.truckFieldUn,
                    total: _suppliers.length.toString(),
                    iconColor: const Color.fromARGB(255, 241, 94, 35),
                  ),
                  cardViewData(
                    title: 'Total Pembelian',
                    icon: FontAwesomeIcons.cartShopping,
                    total: _daftarPembelians.length.toString(),
                    iconColor: const Color.fromARGB(255, 159, 33, 209),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  //  ==========================  [WIDGET] =====================================
  Container cardViewData({
    required String title,
    required String total,
    required IconData icon,
    required Color iconColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: const Offset(5, 10),
            blurRadius: 10,
            color: ColorConst.gradientSecond.withOpacity(0.3),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            left: 10,
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Positioned(
            right: 10,
            child: FaIcon(
              icon,
              color: iconColor,
            ),
          ),
          Positioned(
            left: 10,
            bottom: 40,
            child: Text(
              total,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 50,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Fetch suppliers.
  fetchSuppliers() async {
    try {
      _suppliers = await client.supplier.getSuppliers();
      setState(() {});
    } on Exception catch (e) {
      debugPrint('$e');
    }
  }

  /// Fetch daftar barangs.
  fetchDaftarBarangs() async {
    try {
      _daftarBarangs = await client.daftarBarang.getDaftarBarangs();
      setState(() {});
    } on Exception catch (e) {
      debugPrint('$e');
    }
  }

  /// Fetch daftar pembelian.
  fetchDaftarPembelians() async {
    try {
      _daftarPembelians = await client.daftarPembelian.getDaftarPembelians();
      setState(() {});
    } on Exception catch (e) {
      debugPrint('$e');
    }
  }
}
