import 'package:catelogeapp/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogeHeader extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Column(
            children: [
              "Catalog App".text.xl5.bold.color(MyTheme.darkBluishColor).make(),
              "Trending Products".text.xl2.make(),
            ],);
  }
}