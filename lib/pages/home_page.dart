import 'package:catelogeapp/widgets/drawer.dart';
import "package:flutter/material.dart";

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    int day=30;
    String name="FlutterAppDev";
    return Scaffold(
      appBar: AppBar(
        title: Text("Catelog App"),
      ),
      body: Center(
        child: Container(
          child: Text("Welcome to $day day of flutter by $name"),
        ),
      ),
      drawer: MyDrawer(),
      

    );
  }
}