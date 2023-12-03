import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(debugShowCheckedModeBanner:false,home: Cslider(),));
}

class Cslider extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CarouselSlider(items: [
        Container(decoration:BoxDecoration(image: DecorationImage(fit: BoxFit.cover, image: NetworkImage("https://images.unsplash.com/photo-1691084126270-bd85224539ba?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1926&q=80")))),
        Container(decoration:BoxDecoration(image: DecorationImage(fit: BoxFit.cover,image: NetworkImage("https://images.unsplash.com/photo-1690398252262-6359056cf1b7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80")))),
        Container(decoration:BoxDecoration(image: DecorationImage(fit: BoxFit.cover,image: NetworkImage("https://images.unsplash.com/photo-1689776529879-8b4772234449?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80")))),
      ],
          options: CarouselOptions(
            initialPage: 0,
            height: 500,
            aspectRatio: 16/9,
            viewportFraction: .6,
            enableInfiniteScroll: true,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayCurve: Curves.linear,
            enlargeCenterPage: true,
            enlargeFactor: .5,
            scrollDirection: Axis.horizontal
           ),
      ),
    );
  }
}
