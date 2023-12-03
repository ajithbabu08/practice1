import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main(){
  runApp(MaterialApp(home: BottomSheett(),));
}

class BottomSheett extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bottom sheet with image on tap"),),
      body: Center(
        child: GestureDetector(   // or use InkWell also for performing events
            onDoubleTap: () => showsheet(context),
            child: Image.asset("assets/images/yellowbackgroundapp.jpg")),
      ),
    );
  }

  void showsheet(BuildContext context) {
    showModalBottomSheet(context: context,
        builder: (context){
      return Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: FaIcon(FontAwesomeIcons.whatsapp,color: Colors.green,),
              title: Text("WhatsApp"),
            ),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.facebook,color: Colors.blue,),
              title: Text("WhatsApp"),
            ),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.instagram,color: Colors.purple,),
              title: Text("WhatsApp"),
            ),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.message,color: Colors.black,),
              title: Text("WhatsApp"),
            ),
          ],
        ),
      );
    });
  }
}
