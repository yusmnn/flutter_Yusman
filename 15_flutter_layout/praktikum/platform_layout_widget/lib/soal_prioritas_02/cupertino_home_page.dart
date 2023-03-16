import 'package:flutter/cupertino.dart';

class MyCupertinoApp extends StatelessWidget {
  const MyCupertinoApp({super.key});
  final _themeDark = const CupertinoThemeData.raw(
    Brightness.dark,
    null,
    null,
    null,
    null,
    null,
  );

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Cupertino App',
      theme: _themeDark,
      home: const CupertinoHomePage(),
    );
  }
}

class CupertinoHomePage extends StatefulWidget {
  const CupertinoHomePage({super.key});

  @override
  State<CupertinoHomePage> createState() => _CupertinoHomePageState();
}

class _CupertinoHomePageState extends State<CupertinoHomePage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        leading: Icon(CupertinoIcons.back),
        middle: Text('CupertinoApp'),
        trailing: Icon(CupertinoIcons.person_add),
      ),
      // child: const Text('This is Cupertino App'),
      child: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (_, index) => Image.network('https://picsum.photos/150'),
        itemCount: 18,
      ),
    );
  }
}
