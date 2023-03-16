import 'package:flutter/material.dart';

class ListViewData extends StatelessWidget {
  ListViewData({super.key});
  final List<Map<String, String>> items = [
    {
      'title': 'Leanne Graham',
      'subtitle': ' 1-770-736-8031 x56442',
    },
    {
      'title': 'Erwin Howell',
      'subtitle': '010-692-6593-x09125',
    },
    {
      'title': 'Clementine Bauch',
      'subtitle': '1-463-123-4447',
    },
    {
      'title': 'Patricia lebsack',
      'subtitle': '493-170-9623 x156',
    },
    {
      'title': 'Chelsey Dietrich',
      'subtitle': '(254)954-1289',
    },
    {
      'title': 'MRS. Dennis Schulist',
      'subtitle': '1-477-935-8478 x6430',
    },
    {
      'title': 'Kurtis Weissnat',
      'subtitle': '210.067.6132',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  child: Text(
                    items[index]['title']![0],
                  ),
                ),
                title: Text(
                  items[index]['title']!,
                ),
                subtitle: Text(
                  items[index]['subtitle']!,
                  style: const TextStyle(color: Colors.black54),
                ),
                textColor: Colors.black,
              ),
            ],
          );
        },
      ),
    );
  }
}
