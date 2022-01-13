import 'package:flutter/material.dart';
import 'package:portfolio/contact/repository_layer/models/contact_repository_model.dart';
import 'package:portfolio/contact/widgets/contact_form.dart';
import 'package:portfolio/contact/widgets/contact_information.dart';

class ContactMobileView extends StatelessWidget {
  const ContactMobileView({Key? key, required this.contactData})
      : super(key: key);

  final ContactRepoModel? contactData;

  @override
  Widget build(BuildContext context) {
    double mWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          height: 400,
          width: mWidth,
          color: const Color(0xff294BA1),
          child: ContactInformation(contactData: contactData),
        ),
        SizedBox(
          width: mWidth,
          child: const ContactForm(),
        ),
      ],
    );
  }
}
