import 'package:flutter/material.dart';

import '../../../models/api/contact_api.dart';
import '../../../models/contact_model.dart';

enum ContactViewState {
  none,
  loading,
  error,
}

class ContactViewModel with ChangeNotifier {
  ContactViewState _state = ContactViewState.none;
  ContactViewState get state => _state;

  late List<Contact> _contacts = [];
  List<Contact> get contacts => _contacts;

  changeState(ContactViewState s) {
    _state = s;
    notifyListeners();
  }

  getAllContacts() async {
    changeState(ContactViewState.loading);

    try {
      final c = await ContactApi().getContacts();
      _contacts = c;
      changeState(ContactViewState.none);
    } catch (error) {
      changeState(ContactViewState.error);
    }
  }
}
