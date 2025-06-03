import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final Color color;
  final bool isFilled;

  const CustomOutlinedButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.color = const Color.fromARGB(255, 206, 3, 155),
    this.isFilled = false,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        side: WidgetStatePropertyAll(BorderSide(color: color)),
        backgroundColor: WidgetStatePropertyAll(
          isFilled ? color.withAlpha(50) : Colors.transparent,
        ),
      ),
      onPressed: () => onPressed(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Text(text, style: TextStyle(fontSize: 16, color: color)),
      ),
    );
  }
}
