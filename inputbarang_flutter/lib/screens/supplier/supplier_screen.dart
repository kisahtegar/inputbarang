import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../components/page_banner_widget.dart';

class SupplierScreen extends StatelessWidget {
  const SupplierScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            PageBannerWidget(
              title: 'Details Supplier',
              icon: FontAwesomeIcons.truckFieldUn,
              iconColor: Color.fromARGB(255, 241, 94, 35),
            ),
          ],
        ),
      ),
    );
  }
}
