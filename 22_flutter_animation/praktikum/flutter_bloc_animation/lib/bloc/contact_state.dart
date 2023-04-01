part of 'contact_bloc.dart';

@immutable
abstract class ContactState {}

class InitialState extends ContactState {}

class SuccessState extends ContactState {
  final List<Map<String, dynamic>> contacts;

  SuccessState(this.contacts);
}

class DeleteContact extends ContactEvent {
  final int index;

  DeleteContact(this.index);
}
