part of 'calculator_bloc.dart';

@immutable
abstract class CalculatorState {
  final double result;
  const CalculatorState({required this.result});
}

class CalculatorInitial extends CalculatorState {
  const CalculatorInitial() : super(result: 0);
}

// ignore: must_be_immutable
class AirthmeticResult extends CalculatorState {
  double res = 0;
  AirthmeticResult({required double res}) : super(result: res);
}

class ResetState extends CalculatorState {
  const ResetState({required double result}) : super(result: 0);
}

// ignore: must_be_immutable
class ErrorState extends CalculatorState {
  String errorMessage;
  ErrorState({required double result, required this.errorMessage})
      : super(result: 0);
}
