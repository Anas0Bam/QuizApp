// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'answersButton.dart';
import 'data/questions.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({
    super.key,
    required this.onselectedAnswer,
  });
  final void Function(String answer) onselectedAnswer;

  @override
  // final void Function(String answer) selectedanswer;
  State<QuizPage> createState() => _QuizPage();
}

class _QuizPage extends State<QuizPage> {
  int indexQuestion = 0;
  int indexstart = 0;
  void nextQuestion(String selectedanswer) {
    // widget.selectedanswer(selectedanswer);
    widget.onselectedAnswer(selectedanswer);
    setState(() {
      indexQuestion++;
    });
  }

  @override
  Widget build(context) {
    var currentQuestion = questions[indexQuestion];
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: [Colors.deepPurple, Color.fromARGB(255, 126, 47, 154)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    questions[indexQuestion].text,
                    style: GoogleFonts.lato(
                        fontSize: 18, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ...currentQuestion.getShuffledAnswers().map(
                        (answer) => Button(() {
                          nextQuestion(answer);
                        }, answer),
                      ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
