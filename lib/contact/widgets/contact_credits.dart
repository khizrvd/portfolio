import 'package:flutter/material.dart';

class ContactCredits extends StatelessWidget {
  const ContactCredits({Key? key, required this.title, required this.icon})
      : super(key: key);

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 20,
          color: const Color(0xff3FA3FF),
        ),
        const SizedBox(width: 8.0),
        Flexible(
          child: Text(
            title,
            style: const TextStyle(
              letterSpacing: 1,
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 16.0,
            ),
          ),
        ),
      ],
    );
  }
}
