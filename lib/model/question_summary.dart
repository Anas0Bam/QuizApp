import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(
    this.summaryData, {
    super.key,
  });
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      height: 500,
      child: ListView(children: [
        Column(
          children: summaryData.map((results) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  minRadius: 15,
                  backgroundColor:
                      results['user_answers'] == results['correct_answer']
                          ? Colors.green
                          : Colors.red,
                  child: Text(
                    ((results['question_index'] as int) + 1).toString(),
                    style: GoogleFonts.lato(),
                    textAlign: TextAlign.left,
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 30,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          results['question'] as String,
                          style: GoogleFonts.lato(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          (results['user_answers']).toString(),
                          style: GoogleFonts.lato(
                            fontWeight: FontWeight.bold,
                            color: Colors.purple.shade300,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          (results['correct_answer']).toString(),
                          style: GoogleFonts.lato(
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ]),
    );
  }
}
