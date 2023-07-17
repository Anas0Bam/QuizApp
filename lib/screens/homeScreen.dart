// ignore_for_file: file_names

import 'package:quizapp/data/questions.dart';
import 'package:quizapp/quizPage.dart';

import 'package:quizapp/startScreen.dart';
import 'package:flutter/material.dart';

import 'resultsPage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> seelectedAnswers = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void restartQuestion() {
    setState(() {
      seelectedAnswers = [];
      activeScreen = 'questions-screen';
    });
  }

  void chosenAnswer(String ansswer) {
    seelectedAnswers.add(ansswer);

    if (seelectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreen == 'questions-screen') {
      screenWidget = QuizPage(
        onselectedAnswer: chosenAnswer,
      );
    } else if (activeScreen == 'result-screen') {
      screenWidget = ResultsPage(
        chosenAnswers: seelectedAnswers,
        restartQuiz: restartQuestion,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Color.fromARGB(255, 126, 47, 154)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
