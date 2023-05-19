import 'dart:math';

class BMIBrain {
  BMIBrain({this.height, this.weight});

  final int? height;
  final int? weight;
  late double _bmi;

  String calculate() {
    _bmi = weight! / pow(height! / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return "Overweight";
    } else if (_bmi > 18.5) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return "You should really go on a diet and exercise more!";
    } else if (_bmi > 18.5) {
      return "Great job on taking care of your body!";
    } else {
      return "You can eat and exrecise more!";
    }
  }
}
