import 'package:calculator/bloc/calculator_bloc.dart';
import 'package:calculator/widgets/widget_airthmetic_button.dart';
import 'package:calculator/widgets/widget_number_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator Using Bloc'),
      ),
      body: Container(
        color: const Color.fromRGBO(218, 222, 225, 1),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            WidgetNumberTextField(hintText: 'First Number'),
            const SizedBox(height: 15),
            WidgetNumberTextField(hintText: 'Second Number'),
            const SizedBox(height: 15),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    WidgetAirthmeticButton(label: 'Add'),
                    WidgetAirthmeticButton(label: 'Sub'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    WidgetAirthmeticButton(label: 'Mul'),
                    WidgetAirthmeticButton(label: 'Div'),
                  ],
                ),
                WidgetAirthmeticButton(label: 'Reset'),
                const SizedBox(height: 35),
                BlocListener<CalculatorBloc, CalculatorState>(
                  listener: ((context, state) {
                    if (state is ErrorState) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text("New movie came!!!"),
                          content: Text(state.errorMessage),
                        ),
                      );
                    }
                  }),
                  child: BlocBuilder<CalculatorBloc, CalculatorState>(
                      builder: ((context, state) {
                    return Text('Result: ${state.result.toString()}');
                  })),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
