import 'package:flutter/material.dart';


class MyTheme {

  static ThemeData lightTheme(BuildContext context)  => ThemeData(
        appBarTheme: AppBarTheme(
         color: Colors.purple.shade400,
         elevation: 30.0,
        ),
        fontFamily: 'Montserrat',
        );
  
  static ThemeData darkTheme(BuildContext context)  => ThemeData(
        brightness: Brightness.dark,
        );

  //Colors
  static Color creamColor = Color(0xfff5f5f5);
  static Color darkBluishColor=Color(0xff403b58);
}