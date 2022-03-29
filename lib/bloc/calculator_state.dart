part of 'calculator_bloc.dart';

@immutable
abstract class CalculatorState {}

class CalculatorInitial extends CalculatorState {}

class AirthmeticState extends CalculatorState {
  final double result;

  AirthmeticState({required this.result});
}
class ResetState extends CalculatorState{
  
}
