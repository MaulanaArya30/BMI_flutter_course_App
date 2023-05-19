import 'package:bmi_app/screens/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/bottom_button.dart';
import '../constant.dart';
import '../widgets/widget_card.dart';
import '../widgets/icon_card.dart';
import 'package:bmi_app/bmi_brain.dart';

enum Gender {
  male,
  female,
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Gender? selectedGender;

  int height = 170;
  int weight = 60;
  int age = 19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0A0E21),
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: WidgetCard(
                    onPressed: () => setState(() {
                      selectedGender = Gender.male;
                    }),
                    colour: selectedGender == Gender.male
                        ? kactiveColour
                        : kInactiveColour,
                    cardChild: IconCard(
                      icon: FontAwesomeIcons.mars,
                      label: "MALE",
                    ),
                  ),
                ),
                Expanded(
                  child: WidgetCard(
                    onPressed: () => setState(() {
                      selectedGender = Gender.female;
                    }),
                    colour: selectedGender == Gender.female
                        ? kactiveColour
                        : kInactiveColour,
                    cardChild: IconCard(
                      icon: FontAwesomeIcons.venus,
                      label: "FEMALE",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: WidgetCard(
              colour: kactiveColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "HEIGHT",
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(), style: kNumTextStyle),
                      Text("cm", style: kLabelTextStyle),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 25),
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 130,
                      max: 230,
                      onChanged: (double choosenHeight) {
                        setState(() {
                          height = choosenHeight.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: WidgetCard(
                    colour: kactiveColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "WEIGHT",
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MyIconButton(
                              icon: Icons.remove,
                              onPressed: () => setState(() {
                                weight--;
                              }),
                            ),
                            SizedBox(width: 10.0),
                            MyIconButton(
                              icon: Icons.add,
                              onPressed: () => setState(() {
                                weight++;
                              }),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: WidgetCard(
                    colour: kactiveColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "AGE",
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MyIconButton(
                              icon: Icons.remove,
                              onPressed: () => setState(() {
                                age--;
                              }),
                            ),
                            SizedBox(width: 10.0),
                            MyIconButton(
                              icon: Icons.add,
                              onPressed: () => setState(() {
                                age++;
                              }),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonTitle: "CALCULATE",
            onTap: () {
              BMIBrain calculator = BMIBrain(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmiResult: calculator.calculate(),
                    commentText: calculator.getResult(),
                    interpretationText: calculator.getInterpretation(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class MyIconButton extends StatelessWidget {
  const MyIconButton({super.key, required this.icon, required this.onPressed});

  final IconData? icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Icon(
        icon,
        color: Colors.white,
      ),
      shape: CircleBorder(),
      elevation: 3.0,
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
    );
  }
}
