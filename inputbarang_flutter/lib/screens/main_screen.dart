import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../const/constants.dart';
import 'barang/barang_screen.dart';
import 'daftar_pembelian/daftar_pembelian_screen.dart';
import 'dashboard/dashboard_screen.dart';
import 'supplier/supplier_screen.dart';
import 'transaksi/transaksi_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    super.key,
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // ignore: unused_field
  int _currentIndex = 0;
  late PageController pageController;
  String? _timeString;
  Timer? timer;

  @override
  void initState() {
    pageController = PageController();
    _timeString = _formatDateTime(DateTime.now());
    Timer.periodic(const Duration(seconds: 1), (Timer t) => _getTime());
    super.initState();
  }

  @override
  void dispose() {
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) => _getTime());
    timer?.cancel();
    pageController.dispose();
    super.dispose();
  }

  void navigationTapped(int index) {
    pageController.jumpToPage(index);
  }

  void onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('EEEE, dd MMM yyyy\n             hh:mm:ss a')
        .format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConst.bgColor,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Center(
              child: Text(
                _timeString.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ],
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(
              Icons.menu,
              // color: Colors.black,
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: ColorConst.bgColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage('assets/images/logo3.png'),
                    width: 100,
                    height: 100,
                  ),
                  SizedBox(width: 3),
                  FaIcon(
                    FontAwesomeIcons.parachuteBox,
                    color: Color.fromARGB(255, 255, 174, 0),
                    size: 45,
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const FaIcon(FontAwesomeIcons.gauge),
              title: const Text('Dashboard'),
              onTap: () {
                Navigator.pop(context);
                navigationTapped(0);
              },
            ),
            const Divider(),
            ListTile(
              leading: const FaIcon(FontAwesomeIcons.cartShopping),
              title: const Text('Pembelian'),
              onTap: () {
                Navigator.pop(context);
                navigationTapped(1);
              },
            ),
            const Divider(),
            ListTile(
              leading: const FaIcon(FontAwesomeIcons.box),
              title: const Text('Barang'),
              onTap: () {
                Navigator.pop(context);
                navigationTapped(2);
              },
            ),
            const Divider(),
            ListTile(
              leading: const FaIcon(FontAwesomeIcons.truckFieldUn),
              title: const Text('Supllier'),
              onTap: () {
                Navigator.pop(context);
                navigationTapped(3);
              },
            ),
            const Divider(),
            ListTile(
              leading: const FaIcon(FontAwesomeIcons.moneyBillTransfer),
              title: const Text('Transaksi'),
              onTap: () {
                Navigator.pop(context);
                navigationTapped(4);
              },
            ),
            const Divider(),
          ],
        ),
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: onPageChanged,
        children: const [
          DashboardScreen(),
          DaftarPembelianScreen(),
          BarangScreen(),
          SupplierScreen(),
          TransaksiScreen(),
        ],
      ),
    );
  }
}
