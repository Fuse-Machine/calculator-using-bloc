part of 'calculator_bloc.dart';

@immutable
abstract class CalculatorEvent {}

class AddButtonPressed extends CalculatorEvent {
  final int firstNumber;
  final int secondNumber;

  AddButtonPressed({required this.firstNumber, required this.secondNumber});
}

class SubButtonPressed extends CalculatorEvent {
  final int firstNumber;
  final int secondNumber;

  SubButtonPressed({required this.firstNumber, required this.secondNumber});
}

class MulButtonPressed extends CalculatorEvent {
  final int firstNumber;
  final int secondNumber;

  MulButtonPressed({required this.firstNumber, required this.secondNumber});
}

class DivButtonPressed extends CalculatorEvent {
  final int firstNumber;
  final int secondNumber;

  DivButtonPressed({required this.firstNumber, required this.secondNumber});
}

class ResetButtonPressed extends CalculatorEvent {
  final TextEditingController firstNumber;
  final TextEditingController secondNumber;

  ResetButtonPressed({required this.firstNumber, required this.secondNumber});
}
