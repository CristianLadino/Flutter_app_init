import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parcial_movil_cristian_ladino/src/bloc/calculator/calculator_bloc.dart';
import 'package:parcial_movil_cristian_ladino/src/widgets/calculator_button.dart';
import 'package:parcial_movil_cristian_ladino/src/widgets/results_calculator.dart';


class CalculatorPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final calculatorBloc = BlocProvider.of<CalculatorBloc>(context);

    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric( horizontal: 10 ),
          child: Column(
            children: [
              
              Expanded(
                child: Container(),
              ),

              ResultsCalculator(),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CalculatorButton( 
                    text: 'AC',
                    big: true,
                    bgColor: Color(0xffA5A5A5 ),
                    onPressed: () => calculatorBloc.add( ResetAC() ),
                  ),
                  CalculatorButton( 
                    text: 'del',
                    big: true,
                    bgColor: Color(0xffA5A5A5 ),
                    onPressed: () => calculatorBloc.add( DeleteLastEntry() ),
                  ),
                ],
              ),

              

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CalculatorButton( 
                    text: '1',
                    big: true, 
                    onPressed: () => calculatorBloc.add(AddNumber('1')),
                  ),
                  CalculatorButton( 
                    text: '0', 
                    big: true,
                    onPressed: () => calculatorBloc.add(AddNumber('0')),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  CalculatorButton(
                    text: '+',  
                    bgColor: Color(0xffF0A23B ),
                    onPressed: () => calculatorBloc.add(OperationEntry('+')),
                  ),
                  CalculatorButton( 
                    text: '-',
                    bgColor: Color(0xffF0A23B ),
                    onPressed: () => calculatorBloc.add(OperationEntry('-')),
                  ),
                  CalculatorButton( 
                    text: '=',
                    bgColor: Color(0xffF0A23B ),
                    onPressed: () => calculatorBloc.add(CalculateResult()),
                  ),
                ],
              ),
            ],
          ),
        ),
      )
   );
  }
}
