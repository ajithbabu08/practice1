import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice/api%20integration/api%20integration%20using_http/controller/productcontroller.dart';
import 'package:practice/api%20integration/api%20integration%20using_http/screens/widgets/productTile.dart';

void main(){
  runApp(MaterialApp(home: ProductHome(),));
}


class ProductHome extends StatelessWidget {
  final ProductController productController= Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Products"),),
      body: SizedBox(child: Obx((){
        if(productController.isLoading.value){
          return Center(child: CircularProgressIndicator(),);
        }else{
          return GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context,index){
            return ProductTile(productController.productList[index]);
              });
        }
    }),),
    );
  }
}
