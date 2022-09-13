import 'package:flutter/material.dart';

class TextBoxField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  const TextBoxField({Key? key, required this.controller, this.hintText = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: BorderSide(color: Colors.black38),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: BorderSide(color: Colors.black38),
          ),
        ),
        validator: (value) {},
      ),
    );
  }
}
