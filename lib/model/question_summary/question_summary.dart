import 'package:flutter/material.dart';

import 'package:quiz_app/model/question_summary/summary_item.dart';

class QuestionSummary extends StatelessWidget{
  const QuestionSummary(this.summaryData,{super.key});
  final List<Map<String,Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((e) => SummaryItem(e)).toList(),
        ),
      ),
    );
  }
}