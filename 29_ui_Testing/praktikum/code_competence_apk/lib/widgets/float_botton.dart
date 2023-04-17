import 'package:flutter/material.dart';

class FloatButton extends StatelessWidget {
  const FloatButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
      child: FloatingActionButton(
        backgroundColor: Colors.black87,
        child: const Icon(
          Icons.search_rounded,
          color: Color.fromARGB(255, 147, 222, 244),
        ),
        onPressed: () {},
      ),
    );
  }
}
