import 'package:catelogeapp/models/cart.dart';
import 'package:catelogeapp/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: "Cart".text.make(),
      ),
      body: Column(
        children:[
          _CartList().p32().expand(),
          Divider(),
          _CartTotal(),
        ]
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {

  final _cart =CartModel();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children:[
          "\$${_cart.totalPrice}".text.xl5.make(),
          10.widthBox,
          ElevatedButton(
            onPressed: (){
              ScaffoldMessenger.of(context).
              showSnackBar(SnackBar(
                  content :"Buying not supported yet.".text.make()
                )
              );
            }, 
            style: ButtonStyle(

              backgroundColor: MaterialStateProperty.all(
                Colors.green
              ),
              shape: MaterialStateProperty.all(
                StadiumBorder(),
              ),
            ),
            child: "BUY".text.xl3.white.make(),
          ).w32(context)
        ]
      ),  
    );
  }
}

class _CartList extends StatefulWidget {
  @override
  __CartListState createState() => __CartListState();
}

class __CartListState extends State<_CartList> {

  final _cart =CartModel();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _cart.items?.length,
      itemBuilder:(context,index)=>
      ListTile(
        leading: Icon(Icons.done),
        trailing: IconButton(
          onPressed: (){}, 
          icon: Icon(Icons.remove_circle_outline)
        ),
        title: _cart.items[index].name.text.make(),
      )
    );
  }
}