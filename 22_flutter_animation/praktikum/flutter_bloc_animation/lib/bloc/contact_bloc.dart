import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactBloc() : super(InitialState()) {
    final List<Map<String, dynamic>> contacts = [];

    on<AddContact>(
      (event, emit) {
        contacts.add(
          {
            'name': event.name,
            'phoneNumber': event.phoneNumber,
            'color': event.color,
            'image': event.image,
            'date': event.date,
          },
        );
        emit(SuccessState(contacts));
      },
    );
    on<DeleteContact>(
      (event, emit) {
        contacts.removeAt(event.index);
        emit(SuccessState(contacts));
      },
    );
  }
}
