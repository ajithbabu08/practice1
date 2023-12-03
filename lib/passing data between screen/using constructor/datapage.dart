import 'package:flutter/material.dart';
import 'package:practice/passing%20data%20between%20screen/using%20constructor/to_stateful_page.dart';
import 'package:practice/passing%20data%20between%20screen/using%20constructor/to_stateless_page.dart';

void main(){
  runApp(MaterialApp(home: DataPage(),));
}

class DataPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Passing data between using constructor"),
      ),
      body: Container(
        alignment: Alignment.center,
        height: 250,
        child: Column(
          children: [
            ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => StatelessPage(
                      name: "Luminar",
                      location:"kakkanad",
                      phone:8979690544
              )));
            },
                child: Text("To stateless page")),
            SizedBox(height: 20,),


            ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> StatefulPage(
                name: "Hub",
                location: "Kochi",
                phone: 8790604433
              )));
            },
                child: Text("To stateful page")),
          ],
        ),
      ),
    );
  }
}
