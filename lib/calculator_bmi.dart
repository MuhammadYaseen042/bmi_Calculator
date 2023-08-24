import 'dart:math';

class CalculatorBMI {
  final int height;
  final int weight;
  double _bmi = 0.0;
  CalculatorBMI({required this.weight, required this.height});

  String calculateBMI() {
    double _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Underweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher then normal body weight. try to exersise more';
    } else if (_bmi > 18.5) {
      return 'You have a normal body weight! Great';
    } else {
      return 'You have a lower than normal body weight. You can eat bit more';
    }
  }
}
