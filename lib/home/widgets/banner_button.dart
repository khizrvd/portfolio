import 'package:flutter/material.dart';

class BannerButton extends StatelessWidget {
  const BannerButton(
      {Key? key,
      required this.title,
      required this.color,
      required this.titleColor,
      required this.onTap})
      : super(key: key);

  final String title;
  final Color color;
  final Color titleColor;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
    onPressed: onTap,
    style: ButtonStyle(
      side: MaterialStateProperty.all<BorderSide>(
        const BorderSide(color: Colors.white),
      ),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      fixedSize: MaterialStateProperty.all<Size>(
        const Size(120, 40),
      ),
      backgroundColor: MaterialStateProperty.all<Color>(
        color,
      ),
    ),
    child: Text(
      title,
      style: TextStyle(
        color: titleColor,
        fontWeight: FontWeight.w500,
        fontSize: 18,
      ),
    ),
  );
  }
}
