import 'package:flutter/material.dart';

class CustomTextButton extends StatefulWidget {
  final String text;
  final VoidCallback? onTap;
  bool isLoading;
  CustomTextButton(
      {Key? key, required this.text, this.onTap, this.isLoading = false})
      : super(key: key);

  @override
  State<CustomTextButton> createState() => _CustomTextButtonState();
}

class _CustomTextButtonState extends State<CustomTextButton> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      child: ElevatedButton(
        onPressed: widget.isLoading ? null : widget.onTap,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          minimumSize: const Size(double.infinity, 50),
        ),
        child: widget.isLoading
            ? const SizedBox(
                height: 24,
                width: 24,
                child: Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                ),
              )
            : Text(
                widget.text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
      ),
    );
  }
}
