import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MobileNavBar extends StatelessWidget {
  const MobileNavBar({Key? key, required this.controller}) : super(key: key);

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
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
      ),
    );
  }

  navItem(
    String title,
    int page,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: GestureDetector(
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
