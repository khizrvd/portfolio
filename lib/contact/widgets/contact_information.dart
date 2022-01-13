import 'package:flutter/material.dart';
import 'package:portfolio/contact/repository_layer/models/contact_repository_model.dart';
import 'package:portfolio/contact/widgets/contact_credits.dart';
import 'package:portfolio/contact/widgets/social_icons.dart';

class ContactInformation extends StatelessWidget {
  const ContactInformation({Key? key, required this.contactData})
      : super(key: key);

  final ContactRepoModel? contactData;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 50,
          left: 0,
          child: Image.asset(
            'assets/images/ellipse-4.png',
            color: const Color(0xff91A4AE).withOpacity(0.2),
            width: 250,
          ),
        ),
        Positioned(
          top: 100,
          left: 300,
          child: Image.asset(
            'assets/images/ellipse-5.png',
            color: const Color(0xff91A4AE).withOpacity(0.2),
            width: 100,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 45,
            right: 45,
            top: 20,
            bottom: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Contact Inforamation',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 30.0,
                ),
              ),
              const SizedBox(height: 10.0),
              const Text(
                "Have some project? or maybe just want to say hello? I'd love to hear from you",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(height: 15.0),
              ContactCredits(
                title: contactData?.name?.toString() ?? 'Unknown',
                icon: Icons.person,
              ),
              const SizedBox(height: 15.0),
              ContactCredits(
                title: contactData?.phone?.toString() ?? 'Unknown',
                icon: Icons.phone,
              ),
              const SizedBox(height: 15.0),
              ContactCredits(
                title: contactData?.email?.toString() ?? 'Unknown',
                icon: Icons.mail,
              ),
              const Spacer(),
              const SocialIcons(),
            ],
          ),
        ),
      ],
    );
  }
}
