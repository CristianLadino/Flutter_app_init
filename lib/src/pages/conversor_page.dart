import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:parcial_movil_cristian_ladino/src/widgets/drop_down.dart';

class ConversorPage extends StatefulWidget {
  const ConversorPage({ Key? key }) : super(key: key);

  @override
  _ConversorPageState createState() => _ConversorPageState();
}

class _ConversorPageState extends State<ConversorPage> {

  late String from;
  late String to;

  late int rate;
  String result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(),
              Expanded(child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: "Valor a Convertir",
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 18.0,
                        )
                      ),

                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly]
                    ),
                    SizedBox(
                      height: 20.0,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomDropDown(),
                        FloatingActionButton(
                          onPressed: (){
                            
                          },
                          child: Icon(Icons.arrow_forward),
                          elevation: 0.0,
                          backgroundColor: Colors.blue,
                          ),
                        CustomDropDown(),
                      ],
                      
                    ),
                    SizedBox(height: 50.0,),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(16.0)
                      ),
                      child: Column(
                        children: [
                          Text("Result", 
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(result,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 36.0,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ))
            ],
          ),
        ) 
        
      ),
    );
  }
}



