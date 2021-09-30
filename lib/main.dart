import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parcial_movil_cristian_ladino/src/bloc/calculator/calculator_bloc.dart';
import 'package:parcial_movil_cristian_ladino/src/pages/home_page.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CalculatorBloc>(create: (_) => CalculatorBloc(),)
      ], 
      child: MyApp()
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.black,
      debugShowCheckedModeBanner: false,
      title: 'Parcial Cristian Ladino',
      home: HomePage()
    );
  }
}