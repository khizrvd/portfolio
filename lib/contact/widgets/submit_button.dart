import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:portfolio/contact/bloc/contact_bloc.dart';
import 'package:portfolio/utils/constants.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactBloc, ContactState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            fixedSize: MaterialStateProperty.all<Size>(
              const Size(200, 45),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(
              primaryColor,
            ),
          ),
          child: const Text(
            'Send Message',
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
          onPressed: state.status.isValidated
              ? () => context.read<ContactBloc>().add(FormSubmitted())
              : null,
        );
      },
    );
  }
}
