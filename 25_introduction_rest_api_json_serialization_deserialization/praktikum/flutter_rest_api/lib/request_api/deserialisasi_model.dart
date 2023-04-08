class Contact {
  late int? id;
  late String? name;
  late String? phone;

  Contact({
    this.id,
    this.name,
    this.phone,
  });

  factory Contact.jsonDecode(Map<String, dynamic> json) {
    return Contact(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
    );
  }
}
