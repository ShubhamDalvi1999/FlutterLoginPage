import 'package:flutter/material.dart';

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
  
}