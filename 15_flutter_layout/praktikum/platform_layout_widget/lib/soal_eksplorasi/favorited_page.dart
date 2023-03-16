import 'package:flutter/material.dart';

class MyFlutterApp extends StatelessWidget {
  const MyFlutterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter App',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Color(0xff6200EE),
        ),
        scaffoldBackgroundColor: Colors.white,
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xff03DAC5),
          foregroundColor: Colors.black,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color(0xff6200EE),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
        ),
      ),
      home: FavoritedPage(),
    );
  }
}

class FavoritedPage extends StatelessWidget {
  FavoritedPage({super.key});

  final items = [
    'Learn Flutter',
    'Learn ReactJS',
    'Learn VueJS',
    'Learn Tailwind CSS',
    'Learn UI/UX',
    'Learn Figma',
    'Learn Digital Marketing',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Flutter App'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              ListTile(
                title: Text(items[index]),
              ),
              const Divider(),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Information',
          ),
        ],
      ),
    );
  }
}
