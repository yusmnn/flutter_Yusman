import 'package:flutter/material.dart';

import '../models/models_contacts.dart';

class ContactsModel with ChangeNotifier {
  final List<Contact> _contacts = [];

  List<Contact> get contacts => _contacts;

  void addContact(Contact contact) {
    _contacts.add(contact);
    notifyListeners();
  }

  void removeContact(Contact contact) {
    _contacts.remove(contact);
    notifyListeners();
  }

  void updateContact(Contact contact, Contact newContact) {
    final index = _contacts.indexOf(contact);
    _contacts[index] = newContact;
    notifyListeners();
  }
}
