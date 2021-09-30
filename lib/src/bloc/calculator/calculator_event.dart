part of 'calculator_bloc.dart';

@immutable
abstract class CalculatorEvent {}

class ResetAC extends CalculatorEvent {}
class AddNumber extends CalculatorEvent {
  final String number;
  AddNumber(this.number);
}
class DeleteLastEntry extends CalculatorEvent{}
class OperationEntry extends CalculatorEvent{
  final String operation;
  OperationEntry(this.operation);
}

class CalculateResult extends CalculatorEvent{}
class ResetLogicAC extends CalculatorEvent {}
class AddNumberLogic extends CalculatorEvent {
  final String number;
  AddNumberLogic(this.number);
}
class DeleteLastEntryLogic extends CalculatorEvent{}
class LogicOperationEntry extends CalculatorEvent{
  final String operation;
  LogicOperationEntry(this.operation);
}
class CalculateLogicResult extends CalculatorEvent{}

