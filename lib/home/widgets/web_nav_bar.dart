import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WebNavBar extends StatelessWidget {
  const WebNavBar({Key? key, required this.controller}) : super(key: key);

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: [
        navItem(
          'About',
          1,
        ),
        navItem(
          'Skills',
          2,
        ),
        navItem(
          'Portfolio',
          3,
        ),
        navItem(
          'Contact',
          4,
        ),
      ],
    );
  }

  navItem(
    String title,
    int page,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: InkWell(
        onTap: () => controller.animateToPage(
          page,
          duration: const Duration(milliseconds: 300),
          curve: Curves.bounceInOut,
        ),
        child: Text(
          title,
          style: controller.hasClients && controller.page == page
              ? GoogleFonts.pacifico(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                )
              : const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
        ),
      ),
    );
  }
}
