import 'package:catelogeapp/models/catalog.dart';
import 'package:catelogeapp/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailsPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailsPage({Key? key, required this.catalog}) :
   assert(catalog != null ), super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: MyTheme.creamColor,
      bottomNavigationBar: ButtonBar(
        alignment: MainAxisAlignment.spaceBetween,
                //buttonPadding: Vx.mH8,
                children: [
                  "\$${catalog.price}".text.bold.xl.make(),
                  ElevatedButton(
                  onPressed: (){},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green.shade700,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15),
                  ),
                  child: "Buy".text.make(),
                  ).wh(100,50),
                ],
      ).p32(),
      body: SafeArea(
        bottom: false,
        child: Column(
          children:[
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image)
            ).p16(),
            Expanded(
              child:VxArc(
                height: 30.0,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                  width: context.screenWidth,
                  child: Column(
                    children:[
                    catalog.name.text.xl5.bold.make(),
                    catalog.desc.text.xl.textStyle(context.captionStyle).make(),
                    ],
                  ).py64(),
                  color: Colors.white,),
              ))
          ]
        ),
      ),
    );
  }
}