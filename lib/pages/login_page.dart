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

  @override
  Widget build(BuildContext context) {
    return changeButton? 
    Scaffold(
      backgroundColor: Colors.blue,
      body: 
      Column(
        children:[
        Container(
          width: MediaQuery.of(context).size.width,
          height: (MediaQuery.of(context).size.height)/2,
          child: 
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Text("Logged In",
                          style: TextStyle(
                            fontSize: 50.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                          ),
                          textAlign: TextAlign.center,
                    ),
                ),
                  ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: (MediaQuery.of(context).size.height)/2,
          child:
            Align(
              alignment: Alignment.topCenter,
              child: Icon(
                    Icons.done,
                    size: 90.0,
                    color: Colors.white,
                    ),
            ),
                  
              ),
        ]
      )
      )
  
    :Scaffold(
      body: 
      Container(
        color: Colors.white,
        child: 
        Column(
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
                      enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.lightBlue.shade400, width: 1.0
                        ),
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      
                      hintText:"Enter username",
                      labelText:"Username" ,
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
                    obscureText: true,
                    style: TextStyle(
                      fontSize:22,                       
                    ),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.lightBlue.shade400, width: 1.0
                        ),
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      hintText:"Enter password",
                      labelText:"Password",
                      //done : the label text on the box of input field
                      border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height:30
            ),
            InkWell(
              onTap: ()async{
                setState(() {
                  changeButton=true;
                });
                await Future.delayed(Duration(seconds: 1));
                Navigator.pushNamed(context, MyRoutes.HomeRoute);
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds:56),
                width: 200,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  //shape: changeButton ? BoxShape.circle :BoxShape.rectangle,
                  color: Colors.blue,
                  //borderRadius: BorderRadius.circular(8),
                ),
                //changeButton ? Icon(Icons.done,color: Colors.white,):
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            )
            // ElevatedButton(
            //   onPressed:(){ 
            //     Navigator.pushNamed(context, MyRoutes.HomeRoute);
            //     },
            //   style: TextButton.styleFrom(
            //     minimumSize: Size(200, 50),
            //     backgroundColor: Colors.green
            //   ),
            //   child:Text(
            //   "Login",
            //   style: TextStyle(
            //   fontSize: 20,
            //   color: Colors.white,
            //   ),
            //  ),
            // )
          ],
        ),
      ),
    );
  }
}