import 'package:flutter/material.dart';
import '../helper/database_helper.dart';
import 'contact_model.dart';

class DbManager extends ChangeNotifier {
  List<ContactModel> _contactModels = [];
  late DatabaseHelper _dbHelper;

  List<ContactModel> get contactModels => _contactModels;

  DbManager() {
    _dbHelper = DatabaseHelper();
    _getAllContacts();
  }

  void _getAllContacts() async {
    _contactModels = await _dbHelper.getContact();
    notifyListeners();
  }

  Future<void> addContact(ContactModel taskModel) async {
    await _dbHelper.insertContact(taskModel);
    _getAllContacts();
  }

  //! tidak mirip di alta jadi kemungkinan error: 1.00.49
  Future<void> getContactByID(int id) async {
    await _dbHelper.getContactById(id);
    _getAllContacts();
  }

  Future<void> updateTask(ContactModel taskModel) async {
    await _dbHelper.updateContact(taskModel);
    _getAllContacts();
  }

  Future<void> deleteTask(int id) async {
    await _dbHelper.deleteContact(id);
    _getAllContacts();
  }
}
