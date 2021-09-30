import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(CalculatorState()) {
    on<CalculatorEvent>((event, emit) {
      // TODO: implement event handler
      if (event is ResetAC){
        _resetAC();
      } else if (event is AddNumber) {
         _addNumber(event);
      } else if (event is DeleteLastEntry) {
        _deleteLastEntry();
      } else if (event is OperationEntry) {
        _addOperation(event);
      }else if (event is CalculateResult) {
        _calculateResult();
      }
    });
  }

  _resetAC(){
    print('is event reset AC');
    return emit(
      CalculatorState(
        firstNumber: '0',
        secondNumber: '0',
        mathResult: '0',
        operation: ''
      )
    );
  }

  _addNumber(event) {
    return emit(
      state.copyWith(
        mathResult: (state.mathResult == '0') 
                  ? event.number
                  : state.mathResult + event.number,
      )
    );
  }

  _deleteLastEntry(){
    return emit(
      state.copyWith(
        mathResult: state.mathResult.length > 1
                  ? state.mathResult.substring(0, state.mathResult.length - 1)
                  : '0'
      )
    );
  }

  _addOperation(event) {
    return emit(
      state.copyWith(
        firstNumber: state.mathResult,
        mathResult: '0',
        operation: event.operation,
        secondNumber: '0'
      )
    );
  }

  _calculateResult() {
    String num1 = state.firstNumber;
    String num2 = state.mathResult;

    if (num1.length < num2.length) {
      String temp = num2.substring(0, num2.length - num1.length);
      temp = temp.replaceAll('1', '0');
      num1 = temp = temp+num1;
    }else {
      String temp = num1.substring(0 , num1.length-num2.length);
			temp 		= temp.replaceAll('1','0');
			num2 	= temp = temp+num2;
    }

     switch( state.operation ) {
       case '+':
        _sumar(num1, num2);
       break;

       case '-':
        _restar(num1, num2);
       break;

       case 'AND':
        _and(num1, num2);
       break;

       case 'OR':
        _or(num1, num2);
       break;

       case 'XOR':
        _xor(num1, num2);
       break;
     }

  }

  _sumar(String num1, String num2) {
    String resultado = "";
		String acarreo = '0';

    for(int i = num1.length-1; i>= 0; i--){
      if (num1[i] == '0' && num2[i] == '0') {
        if(acarreo == '0'){
					resultado = "0"+resultado;
				}else {
					resultado = "1"+resultado;
          acarreo = '0';
				}
      }else if((num1[i] == '0' && num2[i]  == '1' ) || (num1[i] == '1' && num2[i]  == '0')) {
             if(acarreo == '0'){
					      resultado = "1"+resultado;
				      }else {
					      acarreo = '1';
					      resultado = "0"+resultado;
				    }
      }else if((num1[i] == '1' && num2[i] == '1' )){
				if(acarreo == '0'){
					acarreo = '1';
					resultado = "0"+resultado;
				}else {
					resultado = "1"+resultado;
				}
			}
    }

    if(acarreo =='1'){
			resultado = acarreo + resultado;
		}

    return emit(
      state.copyWith(
        secondNumber: state.mathResult,
        mathResult: resultado
      )
    );
  }

  _restar(String num1, String num2) {
    String resultado = "";
		String debo = '0';
		
		for(int i = num1.length-1; i>= 0; i--){
      
			if(num1[i] == '0' && num2[i] == '0'){
        resultado = "0"+resultado;
        
      }else if (num1[i] == '1' && num2[i] == '1') {
        resultado = "0"+resultado;
        
      }else if(num1[i] == '0' && debo == '0')  {
        if(num2[i] == '1'){
          resultado = "1"+resultado;
          debo = '1';
        }
        
      }else if(num1[i] == '1' && num2[i] == '0') {
         resultado = "1"+resultado;
      }else if(num1[i] == '0' && num2[i] == '1'){
        if(debo == '1'){
          resultado = "0"+resultado;
        }
      }
		}
		if(debo == '1'){
      resultado = "-"+resultado;
    }

		return emit(
      state.copyWith(
        secondNumber: state.mathResult,
        mathResult: resultado
      )
    );
  }

  _and(String num1, String num2) {
    String resultado = "";
		String acarreo = '0';

    for(int i = num1.length-1; i>= 0; i--){
      if (num1[i] == '1' && num2[i] == '1') {
        resultado = "1"+resultado;
      }else {
        resultado = "0"+resultado;
      }
		}

    return emit(
      state.copyWith(
        secondNumber: state.mathResult,
        mathResult: resultado
      )
    );
  }

  _or(String num1, String num2) {
    String resultado = "";
		String debo = '0';
		
		for(int i = num1.length-1; i>= 0; i--){
      if (num1[i] == '0' && num2[i] == '0') {
        resultado = "0"+resultado;
      }else {
        resultado = "1"+resultado;
      }
		}

		return emit(
      state.copyWith(
        secondNumber: state.mathResult,
        mathResult: resultado
      )
    );
  }

  _xor(String num1, String num2) {
    String resultado = "";
		String debo = '0';
		
		for(int i = num1.length-1; i>= 0; i--){
      if ((num1[i] == '0' && num2[i] == '0') || (num1[i] == '1' && num2[i] == '1')) {
        resultado = "0"+resultado;
      }else {
        resultado = "1"+resultado;
      }
		}

		if(debo == '1'){
      resultado = "-"+resultado;
    }

		return emit(
      state.copyWith(
        secondNumber: state.mathResult,
        mathResult: resultado
      )
    );
  }
}
