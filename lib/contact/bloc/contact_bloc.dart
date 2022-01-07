import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:portfolio/contact/repository_layer/contact_repository_layer.dart';
import 'package:portfolio/contact/repository_layer/models/contact_repository_model.dart';

part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  final ContactRepoLayer contactRepository;
  ContactBloc(this.contactRepository) : super(const ContactState()) {
    on<ContactDataLoaded>(
      (event, emit) async {
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
      },
    );
  }
}
