import 'package:bmi_app/widgets/widget_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import '../widgets/bottom_button.dart';
import '../constant.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({
    super.key,
    required this.bmiResult,
    required this.commentText,
    required this.interpretationText,
  });

  final String bmiResult;
  final String commentText;
  final String interpretationText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0A0E21),
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Center(
              child: Text(
                "Results",
                style: kResultStyle,
              ),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            flex: 5,
            child: WidgetCard(
              colour: kactiveColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    commentText.toUpperCase(),
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF24D876),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    bmiResult,
                    style: kBMItextStyle,
                  ),
                  Text(
                    interpretationText,
                    style: kIntepretationTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            buttonTitle: "RE-CALCULATE",
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
