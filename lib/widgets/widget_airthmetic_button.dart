import 'package:calculator/bloc/calculator_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class WidgetAirthmeticButton extends StatelessWidget {
  String label;
  WidgetAirthmeticButton({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(label.toUpperCase()),
      onPressed: () {
        switch (label.toLowerCase()) {
          case 'add':
            BlocProvider.of<CalculatorBloc>(context).add(Addition());
            break;
          case 'sub':
            BlocProvider.of<CalculatorBloc>(context).add(Substraction());
            break;
          case 'mul':
            BlocProvider.of<CalculatorBloc>(context).add(Multiplication());
            break;
          case 'div':
            BlocProvider.of<CalculatorBloc>(context).add(Division());
            break;
          case 'reset':
            BlocProvider.of<CalculatorBloc>(context).add(Reset());
            break;
          default:
        }
      },
    );
  }
}
