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
                  ElevatedButton(
                  onPressed: (){},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black54,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 15),
                  ),
                  child: "Buy".text.make(),
                  ),
                ],
              )
            ],
          ))
        ],
      )
    ).white.roundedLg.square(150).make().py16();
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