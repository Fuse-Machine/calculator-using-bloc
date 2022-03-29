import 'dart:developer';

import 'package:calculator/bloc/calculator_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late final TextEditingController _firstNumber = TextEditingController();
    late final TextEditingController _secondNumber = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator Using Bloc'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextField(
            controller: _firstNumber,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'First Number',
            ),
          ),
          const SizedBox(height: 15),
          TextField(
            controller: _secondNumber,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Second Number',
            ),
          ),
          const SizedBox(height: 15),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _WidgetButton(
                    lable: 'ADD',
                    firstNumber: _firstNumber,
                    secondNumber: _secondNumber,
                  ),
                  _WidgetButton(
                    lable: 'SUB',
                    firstNumber: _firstNumber,
                    secondNumber: _secondNumber,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _WidgetButton(
                    lable: 'MUL',
                    firstNumber: _firstNumber,
                    secondNumber: _secondNumber,
                  ),
                  _WidgetButton(
                    lable: 'DIV',
                    firstNumber: _firstNumber,
                    secondNumber: _secondNumber,
                  ),
                ],
              ),
              _WidgetButton(
                lable: 'RESET',
                firstNumber: _firstNumber,
                secondNumber: _secondNumber,
              ),
              const SizedBox(height: 35),
              BlocBuilder<CalculatorBloc, CalculatorState>(
                builder: (context, state) {
                  if (state is AirthmeticState) {
                    return Text('Result : ${state.result}');
                  }
                  return const Text('Result :0');
                },
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

class _WidgetButton extends StatelessWidget {
  final String lable;
  final TextEditingController firstNumber;
  final TextEditingController secondNumber;
  //final VoidCallback eventCall;
  const _WidgetButton({
    Key? key,
    required this.lable,
    required this.firstNumber,
    required this.secondNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        log(_validation(firstNumber, secondNumber).toString());
        if (_validation(firstNumber, secondNumber)) {
          if (lable == 'ADD') {
            BlocProvider.of<CalculatorBloc>(context).add(AddButtonPressed(
                firstNumber: int.parse(firstNumber.text),
                secondNumber: int.parse(secondNumber.text)));
          } else if (lable == 'SUB') {
            BlocProvider.of<CalculatorBloc>(context).add(SubButtonPressed(
                firstNumber: int.parse(firstNumber.text),
                secondNumber: int.parse(secondNumber.text)));
          } else if (lable == 'MUL') {
            BlocProvider.of<CalculatorBloc>(context).add(MulButtonPressed(
                firstNumber: int.parse(firstNumber.text),
                secondNumber: int.parse(secondNumber.text)));
          } else if (lable == 'DIV') {
            BlocProvider.of<CalculatorBloc>(context).add(DivButtonPressed(
                firstNumber: int.parse(firstNumber.text),
                secondNumber: int.parse(secondNumber.text)));
          } else if (lable == 'RESET') {
            BlocProvider.of<CalculatorBloc>(context).add(ResetButtonPressed(
              firstNumber: firstNumber,
              secondNumber: secondNumber,
            ));
          }
        } else {
          showDialog(
            context: context,
            builder: (context) => const AlertDialog(
              title: Text('Error'),
              content: Text('Both field shouldn\'t be empty'),
            ),
          );
        }
      },
      child: Text(
        lable,
        style: const TextStyle(fontSize: 25, color: Colors.black),
      ),
    );
  }

  bool _validation(
      TextEditingController firstNumber, TextEditingController secondNumber) {
    if (firstNumber.text.isNotEmpty && secondNumber.text.isNotEmpty) {
      return true;
    }
    return false;
  }
}
