import 'package:flutter/material.dart';
import 'package:portfolio/contact/repository_layer/models/contact_repository_model.dart';
import 'package:portfolio/contact/widgets/contact_form.dart';
import 'package:portfolio/contact/widgets/contact_information.dart';

class ContactWebView extends StatelessWidget {
  const ContactWebView({Key? key, required this.contactData}) : super(key: key);

  final ContactRepoModel? contactData;

  @override
  Widget build(BuildContext context) {
    double mHeight = MediaQuery.of(context).size.height;
    double mWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          height: 400,
          width: mWidth * 0.5,
          decoration: const BoxDecoration(
            color: Color(0xff294BA1),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            ),
          ),
          child: ContactInformation(contactData: contactData),
        ),
        SizedBox(
          width: mWidth * 0.5,
          height: 400,
          child: const ContactForm(),
        ),
      ],
    );
  }
}
