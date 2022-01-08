import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/home/widgets/banner_button.dart';
import 'package:portfolio/utils/constants.dart';

class CreditsMobileView extends StatelessWidget {
  const CreditsMobileView(
      {Key? key,
      required this.name,
      required this.qualification,
      required this.location})
      : super(key: key);

  final String name;
  final String? qualification;
  final String? location;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          name,
          style: GoogleFonts.notoSans(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 24,
          ),
        ),
        Text(
          qualification ?? 'Unknown',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 40,
          ),
        ),
        const SizedBox(
          width: 100,
          child: Divider(
            thickness: 2,
            color: Colors.white,
          ),
        ),
        Text(
          location ?? 'Anonymous',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 12.0),
        Row(
          children: [
            BannerButton(
              title: 'Hire Me',
              color: Colors.white,
              titleColor: primaryColor,
              onTap: () {},
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
            ),
            BannerButton(
              title: 'Get CV',
              color: Colors.transparent,
              titleColor: Colors.white,
              onTap: () {},
            ),
          ],
        ),
        const SizedBox(height: 15.0),
        Image.asset(
          "assets/images/hero-img.png",
          width: 325,
        )
      ],
    );
  }
}
