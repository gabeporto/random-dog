import 'package:flutter/material.dart';

ElevatedButton mainButton(
    {String buttonText = '',
    Color buttonColor = const Color.fromARGB(255, 108, 76, 122),
    double horizontalPadding = 40,
    double verticalPadding = 10,
    double fontSize = 20,
    Function()? buttonFunction}) {
  return ElevatedButton(
    onPressed: buttonFunction,
    style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(buttonColor),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ))),
    child: Text(
      buttonText,
      style: TextStyle(
        fontSize: fontSize,
        color: Colors.white,
      ),
    ),
  );
}