import 'package:catelogeapp/pages/home_page.dart';
import 'package:catelogeapp/pages/login_page.dart';
import 'package:catelogeapp/utils/routes.dart';
import 'package:catelogeapp/widgets/themes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      routes:{
        "/":(context)=> HomePage(),
        MyRoutes.HomeRoute:(context)=> HomePage(),
        MyRoutes.LoginRoute:(context)=> LoginPage(),
      },
    );
  }
}


