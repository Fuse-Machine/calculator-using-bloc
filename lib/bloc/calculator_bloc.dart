import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(CalculatorInitial()) {
    on<CalculatorEvent>((event, emit) {
      double result = 0;
      if (event is AddButtonPressed) {
        result = (event.firstNumber + event.secondNumber).toDouble();
      } else if (event is SubButtonPressed) {
        result = (event.firstNumber - event.secondNumber).toDouble();
      } else if (event is MulButtonPressed) {
        result = (event.firstNumber * event.secondNumber).toDouble();
      } else if (event is DivButtonPressed) {
        result = (event.firstNumber / event.secondNumber).toDouble();
      } else if (event is ResetButtonPressed) {
        event.firstNumber.clear();
        event.secondNumber.clear();
        result = 0;
      }
      emit(AirthmeticState(result: result));
    });
  }
}
