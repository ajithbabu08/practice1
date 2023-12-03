import 'package:flutter/material.dart';


void main(){
  runApp(MaterialApp(home: Drawer_Example(),));
}
class  Drawer_Example extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My profile"),),

      drawer: Drawer(
        child: ListView(
          children: const [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                    "assets/images/yellowbackgroundapp.jpg")),
              ),

                accountName: Text("Ajith Babu"),
                accountEmail: Text("ajith@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://assets.architecturaldigest.in/photos/63806da6d2c4a1a597b273fd/16:9/w_2560%2Cc_limit/1442809583"),
            ),
              otherAccountsPictures: [
                CircleAvatar(backgroundImage: NetworkImage(
                    "https://assets.architecturaldigest.in/photos/63806da6d2c4a1a597b273fd/16:9/w_2560%2Cc_limit/1442809583"),),
              CircleAvatar(backgroundImage: AssetImage("assets/icons/flashicon.png"),)],
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text("About"),
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text("help"),
            ),
          ],
        ),
      ),
    );
  }
}
