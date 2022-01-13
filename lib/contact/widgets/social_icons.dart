import 'package:flutter/material.dart';

class SocialIcons extends StatelessWidget {
  const SocialIcons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          onTap: () {},
          child: Image.asset('assets/images/dribbble.png'),
        ),
        InkWell(
          onTap: () {},
          child: Image.asset('assets/images/facebook.png'),
        ),
        InkWell(
          onTap: () {},
          child: Image.asset('assets/images/twitter.png'),
        ),
        InkWell(
          onTap: () {},
          child: Image.asset('assets/images/instagram.png'),
        ),
      ],
    );
  }
}
