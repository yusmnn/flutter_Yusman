import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../contact_model.dart';

class ContactApi {
  static Future<List<Contact>> getContacts() async {
    try {
      final response = await Dio().get(
          'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts');

      List<Contact> contacts = (response.data as List)
          .map(
            (e) => Contact(
              id: e['id'],
              name: e['name'],
              phone: e['phone'],
            ),
          )
          .toList();

      return contacts;
    } catch (error) {
      debugPrint('Terjadi kesalahan: $error');
      rethrow;
    }
  }
}
