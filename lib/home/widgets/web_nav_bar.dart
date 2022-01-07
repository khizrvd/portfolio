import 'package:flutter/material.dart';

class WebNavBar extends StatelessWidget {
  const WebNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: [
        navItem('About'),
        navItem('Skills'),
        navItem('Portfolio'),
        navItem('Contact'),
      ],
    );
  }

  navItem(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
    );
  }
}
