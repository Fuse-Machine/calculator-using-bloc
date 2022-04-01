import 'package:calculator/bloc/calculator_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class WidgetNumberTextField extends StatelessWidget {
  String hintText;
  WidgetNumberTextField({Key? key, required this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller:
      (hintText=='First Number')?
          BlocProvider.of<CalculatorBloc>(context).firstNumberController:
          BlocProvider.of<CalculatorBloc>(context).secondNumberController,
      keyboardType: TextInputType.number,
      decoration:  InputDecoration(
        border: const OutlineInputBorder(),
       hintText: hintText,
      ),
    );
  }
}
