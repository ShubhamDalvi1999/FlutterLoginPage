import 'dart:ui';

import 'package:catelogeapp/utils/routes.dart';
import "package:flutter/material.dart";

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String name="";
  bool changeButton=false;
  final _formKey =GlobalKey<FormState>();

  moveToHome(BuildContext context)async{
    if(_formKey.currentState!.validate()){
    setState(() {
      changeButton=true;
    });
    await Future.delayed(Duration(seconds: 3));          
    await Navigator.pushNamed(
          context, MyRoutes.HomeRoute);
    setState(() {
      changeButton=false;
    });
    }
  }

  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      body: 
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                    "assets/images/login_image.png",
                     width: 258,
                     height: 200,
                    fit: BoxFit.cover ,),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(40.0, 0.0, 0.0, 0.0),
                      child: Text("Hello",
                      style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',              
                      color: Colors.black,
                  ),
                  ),
                    ),]
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(40.0, 0.0, 0.0, 0.0),
                      child: Text("There $name",
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                      child: Text(".",
                      style: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.0,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40.0,16.0,40.0,0.0),
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {                        
                          if (value!.isEmpty){
                            return "Username cannot be empty";
                          }
                          return null;
                        },
                        onChanged: (value){
                          name=value;
                          setState(() {
                            
                          });
                        },
                        style: TextStyle(
                          fontSize:22,
                          fontFamily: 'Montserrat',
                        ),
                        //done :circular input field
                        decoration: InputDecoration(
                          hintText:"Enter username",
                          labelText:"Username" ,
                          enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.lightBlue.shade400, width: 1.0
                            ),
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          ),
                          //done : the label text on the box of input field
                          border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                          ),
                                                                      
                          ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        validator: (value) {                        
                          if (value!.isEmpty){
                            return "Password cannot be empty";
                          }
                          else if(value.length < 6)
                          {
                            return "Password length should be >6";
                          }
                          return null;
                        },
                         decoration: InputDecoration(
                          hintText:"Enter password",
                          labelText:"Password",
                          enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.lightBlue.shade400, width: 1.0
                            ),
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          ),
                          //done : the label text on the box of input field
                          border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                          ),
                          ),
                        obscureText: true,
                        style: TextStyle(
                          fontSize:22,                       
                        ),
                       
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height:30
                ),
                InkWell(
                  onTap: () => moveToHome(context),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds:200),
                    width: changeButton ? 50:200,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: changeButton ? BoxShape.circle: BoxShape.rectangle,
                      color: Colors.blue,
                    ),
                    child :
                    changeButton ? 
                    Icon(Icons.done,color: Colors.white,):
                    Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}