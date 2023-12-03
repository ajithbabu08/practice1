import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(home: Listview_Separated(),));
}
class Listview_Separated extends StatelessWidget {

  var months=["January","February","March","April","May","June","July","August","September","October","November","December"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Listview Separated"),),
      body: ListView.separated(itemBuilder: (context,index){
        return SizedBox(
          height: 30,
          child: Card(
          child: Text(months[index]),
        )
        );
      },
          separatorBuilder: (context,index){
        if(index %4 ==0){
          return Card(child: Text("Advertisment"),color: Colors.red,);
        }else
          {
            return const SizedBox();
          }
          }, itemCount: 12),
    );
  }
}
