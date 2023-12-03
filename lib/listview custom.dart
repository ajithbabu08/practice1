import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(home: Listview_Custom(),));
}
class Listview_Custom extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Listview Custom"),
      ),
      body: ListView.custom(childrenDelegate: SliverChildListDelegate(
        //[] or
        List.generate(10, (index) => Card(child:  Text("Hi")))
      )),
    );
  }
}
