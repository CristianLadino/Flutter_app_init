import 'package:flutter/material.dart';

class ConversorButton extends StatelessWidget {

  final Color bgColor;
  final bool big;
  final String text;

  final Function onPressed;

  ConversorButton({
    Key? key, 
    bgColor,
    this.big = false, 
    required this.text, 
    required this.onPressed,
  }): this.bgColor = bgColor ?? Color(0xff333333),
      super(key: key);
      

  @override
  Widget build(BuildContext context) {
    // Button
    final buttonStyle = TextButton.styleFrom(
        backgroundColor: this.bgColor,
        primary: Colors.white,
        shape: StadiumBorder(),
    );

    return Container(
      margin: EdgeInsets.only( bottom: 10, right: 5, left: 5 ),
      child: TextButton(
        style: buttonStyle,
        child: Container(
          width: this.big ? 150 : 100,
          height: 40,
          child: Center(
            child: Text( this.text , style: TextStyle( fontSize: 15, fontWeight: FontWeight.w300 ),)
          ),
        ),
        onPressed: () => this.onPressed(),
      ),
    );
  }
}