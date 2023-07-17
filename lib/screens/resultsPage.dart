import 'package:quizapp/data/questions.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'question_summary.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage(
      {super.key, required this.chosenAnswers, required this.restartQuiz});

  final List<String> chosenAnswers;
  final void Function() restartQuiz;
  List<Map<String, Object>> getSummaryData() {
    List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answers': chosenAnswers[i]
      });
    }
    return summary;
  }

  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final totalNumQuestions = questions.length;
    final numCorrectedAnswers = summaryData.where((data) {
      return data['user_answers'] == data['correct_answer'];
    }).length;
    // bool colorr = summaryData.where((data) {
    //   if (data['user_answers'] == data['correct_answer']) {
    //     return  false;
    //   } else {
    //     return   true;
    //   }

    // }) as bool;

    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple, Color.fromARGB(255, 126, 47, 154)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You have answerd $numCorrectedAnswers out of $totalNumQuestions correctly',
              style: GoogleFonts.lato(color: Colors.white, fontSize: 20),
            ),
            QuestionsSummary(getSummaryData()),
            OutlinedButton.icon(
              onPressed: restartQuiz,
              icon: const Icon(Icons.refresh),
              label: Text(
                'Restart quiz',
                style:
                    GoogleFonts.lato(fontSize: 19, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
