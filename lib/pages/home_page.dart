import 'package:catelogeapp/pages/home_page_details.dart';
import 'package:catelogeapp/utils/routes.dart';
import 'package:catelogeapp/widgets/home_widgets/catalog_header.dart';
import 'package:catelogeapp/widgets/home_widgets/catalog_list.dart';
import 'package:catelogeapp/widgets/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:catelogeapp/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:catelogeapp/widgets/themes.dart';




class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String name = "Codepur";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override     
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      floatingActionButton: FloatingActionButton(
        onPressed: ()=> Navigator.pushNamed(context, MyRoutes.CartRoute),
        child: Icon(CupertinoIcons.cart),
        ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              CatalogeHeader(),
              if(CatalogModel.items!=null && CatalogModel.items.isNotEmpty)
                CatalogList().py16().expand()
              else
                CircularProgressIndicator().centered().expand(),
            ]
          ),
        ),
      ),
    );
  }
}








