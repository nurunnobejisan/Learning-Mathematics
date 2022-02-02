import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({required this.height, required this.weight});

  late int height;
  late int weight;
  late double _bmi;

  String calculateBmi() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'অতিরিক্ত ওজন';
    } else if (_bmi >= 18.5) {
      return 'স্বাভাবিক';
    } else {
      return 'কম ওজনের';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'আপনার শরীরের স্বাভাবিক ওজনের চেয়ে বেশি। আরও অনুশীলন করার চেষ্টা করুন';
    } else if (_bmi >= 18.5) {
      return 'আপনি স্বাভাবিক শরীরের ওজন আছে, ভাল কাজ';
    } else {
      return 'আপনার শরীরের স্বাভাবিক ওজনের চেয়ে কম, আরও বেশি খাওয়ার চেষ্টা করুন';
    }
  }
}
