import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.blue,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child:UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                accountName: Text("Elon Musk",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                 ),
                 ), 
                accountEmail: Text("futuremail@gamil.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage(
                    "assets/images/elonmusk.jpeg"
                  ),
                ),
              ),
            ),
            ListTile(
              selectedTileColor: Colors.purple,
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,

              ),
              title: Text("Home",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  //fontWeight: FontWeight.bold,
                 ),
              ),

            ),
            ListTile(
              selectedTileColor: Colors.purple,
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,      
              ),
              title: Text("Profile",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  //fontWeight: FontWeight.bold,
                 ),
              ),

            ),
            ListTile(
              selectedTileColor: Colors.purple,
              leading: Icon(
                CupertinoIcons.shopping_cart,
                color: Colors.white,
                
              ),
              title: Text("My Cart",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                 ),
              ),

            ),
            ListTile(
              selectedTileColor: Colors.purple,
              leading: Icon(
                CupertinoIcons.bag,
                color: Colors.white,
                
              ),
              title: Text("My Wishlist",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                 ),
              ),

            )
          ],
        ),
      ),
    );
  }
}