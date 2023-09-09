import 'package:flutter/material.dart';

class EditText extends StatelessWidget {
  final String title;

  const EditText({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, left: 24.0, right: 24.0),
      child: TextField(
        textAlign: TextAlign.left,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          fillColor: Theme.of(context).dividerColor,
          hintText: title,
          hintStyle: Theme.of(context).textTheme.headlineSmall,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          filled: true,
          contentPadding: const EdgeInsets.all(16),
        ),
      ),
    );
  }
}
