import 'package:flutter/material.dart';

class ReuTextField extends StatefulWidget {
  final String label;
  final String? value;
  final String? hint;
  final String? Function(String?)? validator;
  final bool obscure;
  // final Icon? icon;
  // final int? maxLength;
  final Function(String) onChanged;

  const ReuTextField({
    Key? key,
    required this.label,
    this.value,
    this.validator,
    this.hint,
    // this.maxLength,
    required this.onChanged,
    this.obscure = false,
    // this.icon,
  }) : super(key: key);

  @override
  State<ReuTextField> createState() => _ReuTextFieldState();
}

class _ReuTextFieldState extends State<ReuTextField> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: widget.value,
      validator: widget.validator,
      // maxLength: widget.maxLength,
      obscureText: widget.obscure,
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: const TextStyle(
          color: Colors.blueGrey,
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blueGrey,
          ),
        ),
        suffixIcon: const Icon(
          Icons.text_format,
        ),
        helperText: widget.hint,
      ),
      onChanged: (value) {
        widget.onChanged(value);
      },
    );
  }
}
