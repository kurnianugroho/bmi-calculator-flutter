import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/bottom_button.dart';

class ResultPage extends StatelessWidget {
  final CalculatorBrain calcBrain;

  ResultPage({@required this.calcBrain});

  @override
  Widget build(BuildContext context) {
    calcBrain.calculateBMI();

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: kLargeLabelTextStyle.copyWith(
                    color: Theme.of(context).textTheme.bodyText1.color),
              ),
            ),
            Expanded(
              child: ReusableCard(
                color: kActiveCardColor,
                child: Container(
                  padding: EdgeInsets.only(left: 5.0, right: 5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        calcBrain.getResult(),
                        style: kResultTextStyle,
                      ),
                      Text(
                        calcBrain.calculateBMI(),
                        style: kLargeNumberTextStyle,
                      ),
                      Text(
                        calcBrain.getInterpretation(),
                        style: kMediumLabelTextStyle,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            BottomButton(
              buttonTitle: 'RE-CALCULATE',
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
