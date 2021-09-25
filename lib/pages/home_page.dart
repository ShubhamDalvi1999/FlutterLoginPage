import "package:flutter/material.dart";

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    int day=30;
    String name="FlutterAppDev";
    return Scaffold(
        body: Center(
          child: Container(
            child: Text("Welcome to $day day of flutter by $name"),
          ),
        ),
      );
  }
}