import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Button extends StatelessWidget {
  const Button(
    this.answers,
    this.text, {
    super.key,
  });
  final void Function() answers;
  final String text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            backgroundColor: const Color.fromARGB(255, 55, 27, 105)),
        onPressed: answers,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: GoogleFonts.lato(fontSize: 20, fontWeight: FontWeight.bold),
        ));
  }
}
