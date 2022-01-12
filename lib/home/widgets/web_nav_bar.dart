import 'package:flutter/material.dart';

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
          () => controller.animateToPage(
            1,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeIn,
          ),
        ),
        navItem(
          'Skills',
          () => controller.animateToPage(
            2,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeIn,
          ),
        ),
        navItem(
          'Portfolio',
          () => controller.animateToPage(
            3,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeIn,
          ),
        ),
        navItem(
          'Contact',
          () => controller.animateToPage(
            4,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeIn,
          ),
        ),
      ],
    );
  }

  navItem(
    String title,
    Function() onTap,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: InkWell(
        onTap: onTap,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
