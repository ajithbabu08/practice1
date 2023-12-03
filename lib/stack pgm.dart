import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(home: StackEx(),));
}
class StackEx extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Stack Example"),),
      body: Stack(
        children: [
          Center(
            child: Container(
              height: 200,
                width: 300,
              // color: Colors.yellow,


              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/images/yellowbackgroundapp.jpg")
                )
              ),
            ),
          ),

          Positioned(

            bottom: 350,
            left: 270,
            child: Text("Ajith Babu",style: TextStyle(fontWeight: FontWeight.bold),),


            // child: Container(
            //   height: 70,
            //   width: 70,
            //   color: Colors.blue,
            // ),
          ),

          Positioned(
           bottom: 350,
            left: 80,
            // child: Container(
            //   height: 60,
            //   width: 60,
            //   color: Colors.green,
              child: Text("Valid Till: 2035",style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

