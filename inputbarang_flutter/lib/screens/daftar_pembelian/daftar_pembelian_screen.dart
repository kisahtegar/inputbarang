import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:inputbarang_flutter/screens/daftar_pembelian/pembelian/pembelian_screen.dart';
import 'package:inputbarang_flutter/screens/daftar_pembelian/transaksi/transaksi_screen.dart';

import '../../components/page_banner_widget.dart';
import '../../const/constants.dart';

class DaftarPembelianScreen extends StatefulWidget {
  const DaftarPembelianScreen({super.key});

  @override
  State<DaftarPembelianScreen> createState() => _DaftarPembelianScreenState();
}

class _DaftarPembelianScreenState extends State<DaftarPembelianScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            const PageBannerWidget(
              title: 'Menu Pembelian',
              icon: FontAwesomeIcons.cartShopping,
              iconColor: Color.fromARGB(255, 159, 33, 209),
            ),
            Flexible(
              child: GridView.count(
                padding: const EdgeInsets.all(8),
                crossAxisSpacing: 10,
                childAspectRatio: (1 / .3),
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PembelianScreen(),
                        ),
                      );
                    },
                    child: cardViewData(
                      title: 'Daftar Pembelian',
                      icon: FontAwesomeIcons.cartShopping,
                      iconColor: const Color.fromARGB(255, 209, 162, 33),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TransaksiScreen(),
                        ),
                      );
                    },
                    child: cardViewData(
                      title: 'Transaksi',
                      icon: FontAwesomeIcons.moneyBill,
                      iconColor: Colors.green,
                    ),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FaIcon(
            icon,
            color: iconColor,
          ),
          const SizedBox(width: 30),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
        ],
      ),
    );
  }
}
