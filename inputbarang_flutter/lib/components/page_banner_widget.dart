import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../const/constants.dart';

class PageBannerWidget extends StatelessWidget {
  const PageBannerWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.iconColor,
    this.backButton = false,
  });

  final String title;
  final IconData icon;
  final Color iconColor;
  final bool backButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        color: ColorConst.secondaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                FaIcon(
                  icon,
                  size: 50,
                  color: iconColor,
                ),
                const SizedBox(width: 20),
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 45,
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                backButton
                    ? GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 50,
                        ),
                      )
                    : SizedBox()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
