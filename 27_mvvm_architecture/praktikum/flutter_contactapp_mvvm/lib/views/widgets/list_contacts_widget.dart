import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/contact_app/contact_view_model.dart';

class ListContact extends StatelessWidget {
  const ListContact({
    super.key,
    required this.contactViewModel,
  });

  final ContactViewModel contactViewModel;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: contactViewModel.contacts.length,
      itemBuilder: (context, index) {
        final contact = contactViewModel.contacts[index];
        return Padding(
          padding: const EdgeInsets.only(
              bottom: 0, top: 4.0, left: 12.0, right: 12.0),
          child: Card(
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: Color(0xff6750A4)),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Consumer<ContactViewModel>(
              builder: (context, contactViewModel, child) {
                return ListTile(
                  title: Text(contact.name),
                  subtitle: Text(contact.phone),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
