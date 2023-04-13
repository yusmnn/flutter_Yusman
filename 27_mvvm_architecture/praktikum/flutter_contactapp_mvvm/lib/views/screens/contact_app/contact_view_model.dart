

import 'package:flutter/material.dart';

import '../../../models/api/contact_api.dart';
import '../../../models/contact_model.dart';

class ContactViewModel with ChangeNotifier {
  late List<Contact> _contacts = [];
  List<Contact> get contacts => _contacts;

  getAllContacts() async {
    final dataContact = await ContactApi.getContacts();
    _contacts = dataContact;
    notifyListeners();
  }
}
