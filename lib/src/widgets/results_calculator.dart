import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parcial_movil_cristian_ladino/src/bloc/calculator/calculator_bloc.dart';

import 'line_separator.dart';
import 'main_result.dart';
import 'sub_result.dart';



class ResultsCalculator extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculatorBloc, CalculatorState>(
      builder: (context, state) {
        return Column(
          children: [
            SubResult( text: state.firstNumber ),
            SubResult( text: state.operation ),
            SubResult( text: state.secondNumber ),
            LineSeparator(),
            MainResultText( text: state.mathResult ),
    
          ],
        );
      },
    );
  }
}