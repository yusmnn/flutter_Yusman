import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../bloc/contact_bloc.dart';
import 'contact_update_page.dart';
import 'contacts_form_page.dart';

class ContactListPage extends StatelessWidget {
  const ContactListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact List Page'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(_createRouteBack());
          },
          icon: const Icon(Icons.home),
        ),
      ),
      body: const ContactList(),
    );
  }
}

class ContactList extends StatelessWidget {
  const ContactList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactBloc, ContactState>(
      builder: (context, state) {
        if (state is InitialState) {
          return const Center(
            child: Text(
              'Contact Masih Kosong',
              style: TextStyle(fontSize: 18),
            ),
          );
        } else if (state is SuccessState) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(18, 18, 18, 18),
            child: ListView.separated(
              itemCount: state.contacts.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 8, 32, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            DateFormat('dd-MM-yyyy')
                                .format(state.contacts[index]['date']),
                            style: const TextStyle(
                              fontSize: 11,
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          CircleAvatar(
                            backgroundColor: state.contacts[index]['color'],
                            radius: 8,
                          ),
                        ],
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: state.contacts[index]['image'],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      title: Text(state.contacts[index]['name']),
                      subtitle: Text(state.contacts[index]['phoneNumber']),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).push(_createRouteUpdate());
                            },
                            icon: SvgPicture.asset(
                              'assets/icons/mode_edit.svg',
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              context
                                  .read<ContactBloc>()
                                  .add(DeleteContact(index));
                            },
                            icon: SvgPicture.asset(
                              'assets/icons/delete.svg',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  height: 1,
                  thickness: 1,
                );
              },
            ),
          );
        } else {
          return const Center(
            child: Text('Something went wrong'),
          );
        }
      },
    );
  }
}

Route _createRouteBack() {
  return PageRouteBuilder(
    transitionDuration: const Duration(milliseconds: 2000),
    pageBuilder: (context, animation, secondaryAnimation) =>
        const ContactFormPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.elasticOut;

      var tween = Tween(begin: begin, end: end).chain(
        CurveTween(curve: curve),
      );

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

Route _createRouteUpdate() {
  return PageRouteBuilder(
    transitionDuration: const Duration(milliseconds: 2000),
    pageBuilder: (context, animation, secondaryAnimation) =>
        const UpdateContactPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.elasticOut;

      var tween = Tween(begin: begin, end: end).chain(
        CurveTween(curve: curve),
      );

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
