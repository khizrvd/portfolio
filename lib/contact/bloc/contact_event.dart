part of 'contact_bloc.dart';

abstract class ContactEvent extends Equatable {}

class ContactDataLoaded extends ContactEvent {
  @override
  List<Object?> get props => [];
}