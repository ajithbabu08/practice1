import 'package:flutter/material.dart';
import 'package:practice/listview2.dart';
import 'package:practice/login.dart';
import 'package:practice/registration.dart';


void main(){
  runApp(MaterialApp(debugShowCheckedModeBanner: false,
  home: BottomNavBar(),));
}

class BottomNavBar extends StatefulWidget {

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  int index=0;
  var screens=[
    LoginPage(),
    Register(),
    ListView(),
    ListView2(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bottom Nav Bar"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.green,

        currentIndex: index,
        onTap: (tappedindex){
          setState(() {
            index=tappedindex;
          });
        },
        items: const [
        BottomNavigationBarItem(
          // backgroundColor: Colors.yellow,
            icon: Icon(Icons.home),label: "Home"),
        BottomNavigationBarItem(
          backgroundColor: Colors.green,
            icon: Icon(Icons.search),label: "Search"),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded),label: "Profile"),
        BottomNavigationBarItem(
            icon: Icon(Icons.add_box_rounded),label: "Create")

      ],),

      body: Center(
        child: screens[index],
      ),
    );
  }
}
