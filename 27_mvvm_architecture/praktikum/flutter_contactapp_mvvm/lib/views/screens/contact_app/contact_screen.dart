
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/drawer_widget.dart';
import '../../widgets/list_contacts_widget.dart';
import 'contact_view_model.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ContactViewModel>(context, listen: false).getAllContacts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final contactViewModel = Provider.of<ContactViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact'),
        centerTitle: true,
      ),
      drawer: const RouterWidget(),
      body: Center(
        child: contactViewModel.contacts.isEmpty
            ? const CircularProgressIndicator()
            : ListContact(
                contactViewModel: contactViewModel,
              ),
      ),
    );
  }
}
