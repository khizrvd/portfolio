import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:portfolio/contact/repository_layer/contact_repository_layer.dart';
import 'package:portfolio/contact/repository_layer/models/contact_repository_model.dart';
import 'package:portfolio/contact/validator/models/models.dart';

part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  final ContactRepoLayer contactRepository;
  ContactBloc(this.contactRepository) : super(const ContactState()) {
    on<ContactDataLoaded>(_onContactDataLoaded);
    on<NameChanged>(_onNameChanged);
    on<EmailChanged>(_onEmailChanged);
    on<MessageChanged>(_onMessageChanged);
    on<FormSubmitted>(_onFormSubmitted);
  }

  void _onContactDataLoaded(
      ContactDataLoaded event, Emitter<ContactState> emit) async {
    emit(
      state.copyWith(
        contactStatus: ContactStatus.loading,
      ),
    );
    final _contactData = await contactRepository.getContactData();
    emit(
      state.copyWith(
        contactStatus: ContactStatus.loaded,
        contactData: _contactData,
      ),
    );
  }

  void _onNameChanged(NameChanged event, Emitter<ContactState> emit) {
    final name = Name.dirty(event.name);
    emit(
      state.copyWith(
        name: name,
        status: Formz.validate(
          [
            name,
            state.email,
            state.message,
          ],
        ),
      ),
    );
  }

  void _onEmailChanged(EmailChanged event, Emitter<ContactState> emit) {
    final email = Email.dirty(event.email);
    emit(
      state.copyWith(
        email: email,
        status: Formz.validate(
          [
            state.name,
            email,
            state.message,
          ],
        ),
      ),
    );
  }

  void _onMessageChanged(MessageChanged event, Emitter<ContactState> emit) {
    final message = Message.dirty(event.message);
    emit(
      state.copyWith(
        message: message,
        status: Formz.validate(
          [
            state.name,
            state.email,
            message,
          ],
        ),
      ),
    );
    print('name${state.name.valid}');
    print('email${state.email.valid}');
    print('message${state.message.valid}');
    print(state.status.isValidated);
  }

  void _onFormSubmitted(FormSubmitted event, Emitter<ContactState> emit) async {
    final name = Name.dirty(state.name.value);
    final email = Email.dirty(state.email.value);
    final message = Message.dirty(state.message.value);
    emit(state.copyWith(
      name: name,
      email: email,
      message: message,
      status: Formz.validate([name, email, message]),
    ));

    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    }
  }
}
