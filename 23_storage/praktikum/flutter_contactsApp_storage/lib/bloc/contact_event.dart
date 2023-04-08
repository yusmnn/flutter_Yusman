part of 'contact_bloc.dart';

@immutable
abstract class ContactEvent {}

class AddContact extends ContactEvent {
  final String name;
  final String phoneNumber;
  final Color color;
  final FileImage image;
  final DateTime date;

  AddContact({
    required this.name,
    required this.phoneNumber,
    required this.color,
    required this.image,
    required this.date,
  });
}
