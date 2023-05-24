import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../components/page_banner_widget.dart';

class DaftarPembelianScreen extends StatelessWidget {
  const DaftarPembelianScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            PageBannerWidget(
              title: 'Daftar Pembelian',
              icon: FontAwesomeIcons.cartShopping,
              iconColor: Color.fromARGB(255, 209, 162, 33),
            ),
          ],
        ),
      ),
    );
  }
}
