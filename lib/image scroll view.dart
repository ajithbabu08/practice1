import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(home: Image_Scroll(),));
}
class Image_Scroll extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (AppBar(title: Text("Image Scroll View"),)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Image.asset("assets/images/adidas1.jpg"),
         ),
         Expanded(child: Image.asset("assets/images/nike.jpg")),
          Expanded(child: Image.asset("assets/images/nike.jpg")),
        ],
      )
    );
  }
}
