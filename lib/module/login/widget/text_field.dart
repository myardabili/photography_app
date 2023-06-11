import 'package:flutter/material.dart';

class RTextField extends StatefulWidget {
  final String label;
  final Function(String) onChanged;
  final bool? obscureText;
  final String Function(String?)? validator;

  const RTextField({
    super.key,
    required this.label,
    required this.onChanged,
    this.obscureText = false,
    this.validator,
  });

  @override
  State<RTextField> createState() => _RTextFieldState();
}

class _RTextFieldState extends State<RTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: TextFormField(
            obscureText: widget.obscureText!,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: widget.label,
            ),
            onChanged: (value) {
              widget.onChanged(value);
            },
            validator: widget.validator,
          ),
        ),
      ),
    );
  }
}
