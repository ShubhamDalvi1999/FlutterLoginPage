import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:catelogeapp/models/catalog.dart';
import 'package:catelogeapp/widgets/drawer.dart';

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
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        // ignore: unnecessary_null_comparison
        child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
            ? 
            //ListView.builder(
            //     itemCount: CatalogModel.items.length,
            //     itemBuilder: (context, index) => ItemWidget(
            //       item: CatalogModel.items[index],
            //     ),
            //   )
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), 
              itemBuilder: (context,index){
                final item= CatalogModel.items[index];
                return Card( 
                  clipBehavior: Clip.antiAlias,
                  shape:
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                    ),
                  child: GridTile(
                    header: Container(
                      child: Text(
                        item.name,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple, 
                        ),
                      ),
                    child:Image.network(item.image),
                    footer: Container(
                      child: Text(
                        item.price.toString(),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.black, 
                        ),
                      ),
                    ),
                    );
                  
              })
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: MyDrawer(),
    );
  }
}