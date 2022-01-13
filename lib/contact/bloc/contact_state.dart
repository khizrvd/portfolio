part of 'contact_bloc.dart';

enum ContactStatus { loading, loaded, error }

class ContactState extends Equatable {
  const ContactState({
    this.contactStatus = ContactStatus.loading,
    this.contactData,
    this.status = FormzStatus.pure,
    this.name = const Name.pure(),
    this.email = const Email.pure(),
    this.message = const Message.pure(),
  });
  final ContactStatus contactStatus;
  final ContactRepoModel? contactData;
  final FormzStatus status;
  final Name name;
  final Email email;
  final Message message;

  ContactState copyWith({
    ContactStatus? contactStatus,
    ContactRepoModel? contactData,
    FormzStatus? status,
    Name? name,
    Email? email,
    Message? message,
  }) {
    return ContactState(
      contactStatus: contactStatus ?? this.contactStatus,
      contactData: contactData ?? this.contactData,
      name: name ?? this.name,
      email: email ?? this.email,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [contactStatus, contactData, name, email, message];
}
