import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  var firstNumber = TextEditingController();
  var secondNumber = TextEditingController();
  double result = 0;

  CalculatorBloc() : super(const CalculatorInitial()) {
    on<CalculatorEvent>((event, emit) {
      if (_checkTexboxField() == true) {
        int _first = int.parse(firstNumber.text);
        int _second = int.parse(secondNumber.text);
        if (event is Addition) {
          result = (_first + _second).toDouble();
        } else if (event is Substraction) {
          result = (_first - _second).toDouble();
        } else if (event is Multiplication) {
          result = (_first * _second).toDouble();
        } else if (event is Division) {
          result = (_first / _second).toDouble();
        } else if (event is Reset) {
          _reset();
        }
        emit(AirthmeticResult(res: result));
      } else {
        emit(ErrorState(result: 0, errorMessage: 'Both Numbers are Required'));
      }
    });
  }

  bool _checkTexboxField() {
    return (firstNumber.text.isNotEmpty && secondNumber.text.isNotEmpty)
        ? true
        : false;
  }

  _reset() {
    firstNumber.clear();
    secondNumber.clear();
    result = 0;
  }

  TextEditingController get firstNumberController {
    return firstNumber;
  }

  TextEditingController get secondNumberController {
    return secondNumber;
  }
}
