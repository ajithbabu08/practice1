import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Display_Data(),));
}

class Display_Data extends StatefulWidget {

  @override
  State<Display_Data> createState() => _Display_DataState();
}

class _Display_DataState extends State<Display_Data> {
  TextEditingController _datacontroller=TextEditingController();

  String textdata='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Data Screen"),),
      body: Column(
        children: [

          TextField(
            controller: _datacontroller,
            decoration: InputDecoration(labelText: "Enter data to be displayed"),
          ),
          ElevatedButton(onPressed: (){
          setState((){
            textdata=_datacontroller.text;
          });
    }, child: Text("Display Text"),
    ),
          Text("TExt is: $textdata"),
        ],
      ));
  }
}
