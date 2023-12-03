import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:practice/listview%20separated.dart';
import 'package:practice/listview1.dart';
import 'package:practice/login.dart';
import 'package:practice/registration.dart';


void main(){
  runApp(MaterialApp(debugShowCheckedModeBanner:false,
    home: TabEx(),));
}

class TabEx extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 4,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal,
            title: Text("WhatsApp"),
            actions: [
              Icon(Icons.search),
              Icon(Icons.camera_alt),

              PopupMenuButton(itemBuilder: (context){
                return[
                  PopupMenuItem(child: Text("Settings"))

                ];
              })
            ],

            bottom: TabBar(
                indicatorSize: TabBarIndicatorSize.label,
              labelPadding: EdgeInsets.zero,
              tabs: [
                SizedBox(width: MediaQuery.of(context).size.width*.1,

                  child: FaIcon(FontAwesomeIcons.peopleGroup)),

              SizedBox(
                  width: MediaQuery.of(context).size.width*3,
                  child: Text("Chat")),

              SizedBox(
                  width: MediaQuery.of(context).size.width*3,
                  child: Text("Status")),
              SizedBox(
                  width: MediaQuery.of(context).size.width*3,
                  child: Text("Call"))
            ],),
          ),

          body: TabBarView(
            children: [
              // Center(child: Text("Community"),),
              // Center(child: Text("Chat"),),
              // Center(child: Text("Status"),),
              // Center(child: Text("Call"),),
              LoginPage(),
              Register(),
              ListView1(),
              Listview_Separated()
            ],
          ),
        ));
  }
}
