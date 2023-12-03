import 'package:flutter/material.dart';
import 'package:practice/passing%20data%20between%20screen/using%20navigator/dummy%20data.dart';

class ProductDetails extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    final productId= ModalRoute.of(context)?.settings.arguments;


    final productfromlist= products.firstWhere((element) => element["id"]==productId);

    return Scaffold(
      appBar: AppBar(
      ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(productfromlist["image"]))),
              ),
              Text(productfromlist['name'],
                style: TextStyle(fontSize: 40),),
              Text(productfromlist['Description'],
                style: TextStyle(fontSize: 20),),

              Text('${productfromlist['price']}',
                style: TextStyle(fontSize: 20),),

              Text('${productfromlist['rating']}',
                style: TextStyle(fontSize: 20),),
            ],
          ),

      ),
    );
  }
}
