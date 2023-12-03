import 'dart:js';

import 'package:flutter/material.dart';
import 'package:practice/passing%20data%20between%20screen/using%20navigator/details%20page.dart';
import 'package:practice/passing%20data%20between%20screen/using%20navigator/dummy%20data.dart';

void main(){
  runApp(MaterialApp(home: ProductHome(),
  routes: {'details': (context) => ProductDetails(),
  }
  ));
}
class ProductHome extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text("Shop Now"),),
      body: ListView(
          children:
          products.map((productonebyone) =>
              Card(
                child: ListTile(
                  leading: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.contain,
                              image: NetworkImage(productonebyone["image"])))),
                  title: Text(productonebyone["name"]),
                  subtitle: Text("${productonebyone["price"]}"),
                  onTap: () {
                    gotoNextPage(context, productonebyone['id']);
                  },
                ),
              )).toList()

      ),
    );
  }

  void gotoNextPage(BuildContext context, productId){
    Navigator.pushNamed(context, 'details',arguments: productId);
  }
}
