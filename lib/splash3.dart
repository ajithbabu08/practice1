import 'dart:async';

import 'package:flutter/material.dart';
import 'package:practice/registration.dart';
import 'package:practice/stateful%20login%20with%20validation.dart';

import 'login.dart';


void main(){
  runApp(MaterialApp(home: Splash3(),));
}

class Splash3 extends StatefulWidget{
  @override
  State<Splash3> createState() => Splash3State();   //creating a mutable state for spalsh3
}

class Splash3State extends State<Splash3>{
  @override
  void initState(){
    Timer(Duration(seconds: 2),(){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Login2()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage ("assets/images/yellowbackgroundapp.jpg"))),

          // child: Image.asset("asset/images/yellowbackgroundapp.jpg")),
        ),

      ),
    );
  }
}

