import 'package:flutter/material.dart';

class TextBoxField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;
  final bool isPassword;
  final int maxLines;

  const TextBoxField({
    Key? key,
    required this.controller,
    this.hintText = '',
    this.isPassword = false,
    this.validator,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        child: TextFormField(
          controller: controller,
          maxLines: maxLines,
          obscureText: isPassword,
          style: const TextStyle(fontSize: 14),
          decoration: InputDecoration(
            hintText: hintText,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Colors.black38),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Colors.black38),
            ),
          ),
          validator: validator ??
              (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter your $hintText';
                } else {
                  return null;
                }
              },
        ),
      ),
    );
  }
}
