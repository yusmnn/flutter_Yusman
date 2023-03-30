import 'package:flutter/material.dart';

class Contact {
  late String name;
  late String numberPhone;
  late FileImage? image;
  late Color? color;
  late String? date;

  Contact({
    required this.name,
    required this.numberPhone,
    this.image,
    this.color,
    this.date,
    // this.date,
  });
}
