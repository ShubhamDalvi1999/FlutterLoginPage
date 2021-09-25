import "package:flutter/material.dart";

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                "assets/images/login_image.png",
                 width: 300,
                 height: 289,
                fit: BoxFit.cover ,),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40.0, 10.0, 0.0, 0.0),
              child: Text("Hello",
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat',              
                color: Colors.black,
              ),
              ),
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(40.0, 0.0, 0.0, 0.0),
                  child: Text("There",
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
          ],
        ),
      ),
    );
  }
}