import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/contact/bloc/contact_bloc.dart';
import 'package:portfolio/contact/widgets/contact_textfield.dart';
import 'package:portfolio/contact/widgets/submit_button.dart';

class ContactForm extends StatelessWidget {
  const ContactForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactBloc, ContactState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ContactTextField(
                title: 'Name',
                hint: 'Your Name',
                initialValue: state.name.value,
                error: state.name.invalid ? 'Name can not be empty!' : null,
                onChanged: (value) {
                  context.read<ContactBloc>().add(NameChanged(name: value));
                },
              ),
              ContactTextField(
                title: 'Email',
                hint: 'Your Email',
                initialValue: state.email.value,
                error: state.email.invalid ? 'Invalid Email!' : null,
                onChanged: (value) {
                  context.read<ContactBloc>().add(EmailChanged(email: value));
                },
              ),
              ContactTextField(
                title: 'Message',
                hint: 'Your Message',
                initialValue: state.message.value,
                error:
                    state.message.invalid ? 'Message can not be empty!' : null,
                onChanged: (value) {
                  context
                      .read<ContactBloc>()
                      .add(MessageChanged(message: value));
                },
              ),
              const SizedBox(height: 10),
              const SubmitButton(),
            ],
          ),
        );
      },
    );
  }
}
