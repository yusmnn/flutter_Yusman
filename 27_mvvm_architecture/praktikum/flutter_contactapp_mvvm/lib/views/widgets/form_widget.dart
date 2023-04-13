import 'package:flutter/material.dart';

class FormInputText extends StatelessWidget {
  const FormInputText({
    super.key,
    required TextEditingController textController,
  }) : _textController = textController;

  final TextEditingController _textController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _textController,
      decoration: InputDecoration(
        hintText: 'Input Text',
        labelStyle: const TextStyle(
          color: Colors.deepPurple,
        ),
        fillColor: Colors.deepPurple[50],
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.deepPurple,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.deepPurple,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
