part of 'contact_bloc.dart';

abstract class ContactEvent extends Equatable {
  const ContactEvent();

  @override
  List<Object> get props => [];
}

class ContactDataLoaded extends ContactEvent {
  @override
  List<Object> get props => [];
}

class NameChanged extends ContactEvent {
  const NameChanged({required this.name});

  final String name;

  @override
  List<Object> get props => [name];
}

class EmailChanged extends ContactEvent {
  const EmailChanged({required this.email});

  final String email;

  @override
  List<Object> get props => [email];
}

class MessageChanged extends ContactEvent {
  const MessageChanged({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}

class FormSubmitted extends ContactEvent {}
