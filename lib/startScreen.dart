import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.changePage, {super.key});
  final void Function() changePage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Image.asset(
          'assets/quiz-logo.png',
          width: 300,
        ),
        const SizedBox(
          height: 80,
        ),
        OutlinedButton(
            onPressed: changePage,
            child: Text(
              'Let\'s start the quiz',
              style: GoogleFonts.lato(),
            )),
      ]),
    );
  }
}
