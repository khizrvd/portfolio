import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/contact/bloc/contact_bloc.dart';
import 'package:portfolio/contact/repository_layer/models/contact_repository_model.dart';
import 'package:portfolio/contact/widgets/contact_form.dart';
import 'package:portfolio/contact/widgets/contact_information.dart';
import 'package:portfolio/contact/widgets/contact_mobile_view.dart';
import 'package:portfolio/contact/widgets/contact_web_view.dart';
import 'package:portfolio/utils/constants.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ContactBloc, ContactState>(
      listener: (context, state) {
        if (state.status.isSubmissionSuccess) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          showAlertDialog(context);
        }
        if (state.status.isSubmissionInProgress) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Submitting...')),
            );
        }
      },
      builder: (context, state) {
        switch (state.contactStatus) {
          case ContactStatus.loading:
            context.read<ContactBloc>().add(
                  ContactDataLoaded(),
                );
            return const _ContactLoading();
          case ContactStatus.loaded:
            return _ContactLoaded(
              contactData: state.contactData,
            );
          case ContactStatus.error:
          default:
            return const _ContactError();
        }
      },
    );
  }

  showAlertDialog(BuildContext context) {
    Widget okButton = TextButton(
      child: const Text("Ok"),
      onPressed: () {
        FormzStatus.pure;
        Navigator.pop(context);
      },
    );
    AlertDialog alert = AlertDialog(
      title: const Text(
        "Form Submitted",
      ),
      content: const Text(
        "Thanks!",
      ),
      actions: [
        okButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

class _ContactLoading extends StatelessWidget {
  const _ContactLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class _ContactLoaded extends StatelessWidget {
  const _ContactLoaded({Key? key, required this.contactData}) : super(key: key);

  final ContactRepoModel? contactData;

  @override
  Widget build(BuildContext context) {
    double mWidth = MediaQuery.of(context).size.width;
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 65),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Contact Me',
              style: TextStyle(
                fontSize: 20,
                color: primaryColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 5.0),
            Text(
              'Get in Touch',
              style: TextStyle(
                fontSize: 30,
                color: secondaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25.0),
              child: size.width > mobile
                  ? ContactWebView(contactData: contactData)
                  : ContactMobileView(contactData: contactData),
            ),
            const SizedBox(height: 10.0),
            Container(
              width: mWidth,
              height: 100,
              decoration: backgroundGradient,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Khizrfarooqui',
                      style: GoogleFonts.pacifico(
                        fontSize: 26,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      'COPYRIGHT © 2022',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  final BoxDecoration backgroundGradient = const BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Color(0xff1102C6),
        Color(0xff4275FA),
      ],
      stops: [0.0, 1.0],
      begin: FractionalOffset.bottomRight,
      end: FractionalOffset.topLeft,
      tileMode: TileMode.clamp,
    ),
  );
}

class _ContactError extends StatelessWidget {
  const _ContactError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Something Went Wrong!',
        style: TextStyle(fontSize: 64),
      ),
    );
  }
}
