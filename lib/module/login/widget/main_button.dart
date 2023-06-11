import 'package:flutter/material.dart';
import 'package:photography_app/module/shared/colors.dart';

class MainButton extends StatefulWidget {
  final String label;
  final Function() onPressed;

  const MainButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  State<MainButton> createState() => _MainButtonState();
}

class _MainButtonState extends State<MainButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              backgroundColor: ColorsApp.mainColor),
          onPressed: () {
            widget.onPressed();
          },
          child: Text(
            widget.label,
          ),
        ),
      ),
    );
  }
}
