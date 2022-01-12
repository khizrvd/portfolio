part of 'contact_bloc.dart';

enum ContactStatus { loading, loaded, error }

class ContactState extends Equatable {
  const ContactState({
    this.contactStatus = ContactStatus.loading,
    this.contactData,
  });
  final ContactStatus contactStatus;
  final ContactRepoModel? contactData;

  ContactState copyWith({
    ContactStatus? contactStatus,
    ContactRepoModel? contactData,
  }) {
    return ContactState(
      contactStatus: contactStatus ?? this.contactStatus,
      contactData: contactData ?? this.contactData,
    );
  }

  @override
  List<Object?> get props => [contactStatus, contactData];
}
