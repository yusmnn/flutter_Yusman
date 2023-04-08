import 'package:flutter/material.dart';

class ContactModel {
  late int? id;
  late String name;
  late String phoneNumber;
  late DateTime? date;
  late Color? color;
  late FileImage? image;

  ContactModel({
    this.id,
    required this.name,
    required this.phoneNumber,
    this.date,
    this.color,
    this.image,
  });

  get contacts => null;

  set currentContact(currentContact) {}

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'phoneNumber': phoneNumber,
      'date': date,
      'color': color,
      'image': image,
    };
  }

  ContactModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    phoneNumber = map['phoneNumber'];
    date = map['date'];
    color = map['color'];
    image = map['image'];
  }
}
