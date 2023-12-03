import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: ListView2(),));
}

class ListView2 extends StatelessWidget {

  var name=["shoe1","shoe2","shoe3","shoe4","shoe5","shoe6","shoe7","shoe8","shoe9","shoe10"];
  var image=["assets/images/adidas1.jpg","assets/images/adidas1.jpg","assets/images/adidas1.jpg","assets/images/adidas1.jpg","assets/images/adidas1.jpg",
    "assets/images/nike.jpg","assets/images/nike.jpg","assets/images/nike.jpg","assets/images/nike.jpg","assets/images/nike.jpg"];

  var price=["\$4000","\$4000","\$4000","\$4000","\$4000","\$3000","\$3000","\$3000","\$3000","\$3000",];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("WhatsApp"),
        actions: [
          const Icon(Icons.camera_alt_outlined),
          const SizedBox(width: 20,),
          const Icon(Icons.search),
          const SizedBox(width: 20,),

          PopupMenuButton(itemBuilder: (context){
            return [
              const PopupMenuItem(child: Text("New group")),
              const PopupMenuItem(child: Text("New Broadcast")),
              const PopupMenuItem(child: Text("Linked devices")),
              const PopupMenuItem(child: Text("Starred messages")),
              const PopupMenuItem(child: Text("Payments")),
              const PopupMenuItem(child: Text("Settings")),

            ];
          })
        ],
      ),
      body: ListView(
        children: List.generate(10, (index) =>  Card(
          child: ListTile(
            title: Text(name[index]),
            subtitle: Text("\$${price[index]}"),
            trailing: const Wrap(
                direction: Axis.vertical,
                children: [
                  Text("1:30"),
                  SizedBox(width: 10),
                  CircleAvatar(minRadius: 6,maxRadius: 12,backgroundColor: Colors.teal,
                  child: Text("10"),)
                ]
            ),

            leading: CircleAvatar(
              backgroundImage: AssetImage(image[index]),
            ),
          ),
        )),
      ),
    );
  }
}
