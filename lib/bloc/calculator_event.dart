part of 'calculator_bloc.dart';

@immutable
abstract class CalculatorEvent {}

class Addition extends CalculatorEvent {}

class Substraction extends CalculatorEvent {}

class Multiplication extends CalculatorEvent {}

class Division extends CalculatorEvent {}

class Reset extends CalculatorEvent {}
