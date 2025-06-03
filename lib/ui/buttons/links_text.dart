import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LinksText extends StatefulWidget {
  final String text;
  final Function? onPressed;

  const LinksText({super.key, required this.text, this.onPressed});

  @override
  State<LinksText> createState() => _LinksTextState();
}

class _LinksTextState extends State<LinksText> {
  bool isOver = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.onPressed != null) widget.onPressed!();
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter:
            (_) => setState(() {
              isOver = true;
            }),
        onExit:
            (_) => setState(() {
              isOver = false;
            }),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Text(
            widget.text,
            style: GoogleFonts.montserratAlternates(
              fontSize: 14,
              color: isOver ? Colors.amber : Colors.grey[600],
            ),
          ),
        ),
      ),
    );
  }
}
