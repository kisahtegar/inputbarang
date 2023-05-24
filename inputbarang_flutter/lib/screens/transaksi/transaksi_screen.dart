import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../components/page_banner_widget.dart';

class TransaksiScreen extends StatelessWidget {
  const TransaksiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            PageBannerWidget(
              title: 'Details Transaksi',
              icon: FontAwesomeIcons.moneyBillTransfer,
              iconColor: Color.fromARGB(255, 48, 179, 70),
            ),
          ],
        ),
      ),
    );
  }
}
