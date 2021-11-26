import 'package:catelogeapp/models/cart.dart';
import 'package:catelogeapp/models/catalog.dart';
import 'package:catelogeapp/pages/home_page_details.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';



class CatalogList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context,index){
        final catalog =CatalogModel.items[index];
        return InkWell(
          onTap: ()=> Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (context)=> HomeDetailsPage(
                catalog: catalog,
              )
            )
          ),
          child: CatalogItem(catalog: catalog),
        );
      });
  }
}


class CatalogItem extends StatelessWidget {

  final Item catalog;

  const CatalogItem({Key? key, required this.catalog}) : assert(catalog!=null),
  super(key: key);
    
  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
            tag: Key(catalog.id.toString()),
            child: CatalogImage(image: catalog.image)),
          Expanded(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.lg.bold.make(),
              catalog.desc.text.textStyle(context.captionStyle).make(),
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                //buttonPadding: Vx.mH8,
                children: [
                  "\$${catalog.price}".text.bold.xl.make(),
                  _AddToCart(catalog: catalog),
                ],
              )
            ],
          ))
        ],
      )
    ).white.roundedLg.square(153).make().py16();
  }
}

class _AddToCart extends StatefulWidget {
  final Item catalog;
  const _AddToCart({
    Key? key, required this.catalog,
  }) : super(key: key);

  @override
  __AddToCartState createState() => __AddToCartState();
}

class __AddToCartState extends State<_AddToCart> {


  bool isAdded= false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
    onPressed: (){
      isAdded = isAdded.toggle();
      final catalog =CatalogModel();
      final _cart = CartModel();
      _cart.catalog=catalog;
      _cart.add(widget.catalog);
      setState(() {
        
      });
    },
    style: ElevatedButton.styleFrom(
      primary: Colors.blue.shade500,
      padding: const EdgeInsets.symmetric(
        horizontal: 50,
        vertical: 17),
    ),
    child: isAdded ? Icon(Icons.done) : "Buy".text.make(),
    );
  }
}


class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(image).box.make().p12().w32(context);
  }
}