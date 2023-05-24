import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:inputbarang_flutter/screens/daftar_pembelian/daftar_pembelian_screen.dart';
import 'package:inputbarang_flutter/screens/input/input_screen.dart';
import 'package:inputbarang_flutter/screens/transaksi/transaksi_screen.dart';

import '../const/constants.dart';
import 'barang/barang_screen.dart';
import 'supplier/supplier_screen.dart';

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

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConst.bgColor,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(
              FontAwesomeIcons.bolt,
              color: Colors.yellow,
              size: 20,
            ),
            SizedBox(width: 10),
            Text(
              'Stock Items',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
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
                  FaIcon(
                    FontAwesomeIcons.bolt,
                    color: Colors.yellow,
                    size: 20,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Stock Items',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const FaIcon(FontAwesomeIcons.penClip),
              title: const Text('Input'),
              onTap: () {
                Navigator.pop(context);
                navigationTapped(0);
              },
            ),
            const Divider(),
            ListTile(
              leading: const FaIcon(FontAwesomeIcons.box),
              title: const Text('Barang'),
              onTap: () {
                Navigator.pop(context);
                navigationTapped(1);
              },
            ),
            const Divider(),
            ListTile(
              leading: const FaIcon(FontAwesomeIcons.truckFieldUn),
              title: const Text('Supllier'),
              onTap: () {
                Navigator.pop(context);
                navigationTapped(2);
              },
            ),
            const Divider(),
            ListTile(
              leading: const FaIcon(FontAwesomeIcons.moneyBillTransfer),
              title: const Text('Transaksi'),
              onTap: () {
                Navigator.pop(context);
                navigationTapped(3);
              },
            ),
            const Divider(),
            ListTile(
              leading: const FaIcon(FontAwesomeIcons.cartShopping),
              title: const Text('Daftar Pembelian'),
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
          InputScreen(),
          BarangScreen(),
          SupplierScreen(),
          TransaksiScreen(),
          DaftarPembelianScreen(),
        ],
      ),
    );
  }
}
