import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main(){
  runApp(MaterialApp(home: ListView1(),));
}
class ListView1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text("ListView"),
    ),
      body: ListView(
       children: [
         Center(child: Text("Premium Shoes",style: GoogleFonts.rubik(
           fontSize: 30,color: Colors.red,fontWeight: FontWeight.bold),
    ),
    ),
        Card(
          child: ListTile(
            title: Text("Adidas"),
            subtitle: Text("\$4000"),
            trailing: Icon(Icons.shopping_cart),
            leading: Image.asset("assets/images/adidas1.jpg"),
          ),
        ),
         Card(
        child: ListTile(
        title: Text("Nike"),
    subtitle: Text("\$3800"),
    trailing: Icon(Icons.shopping_cart),
    leading: Image.asset("assets/images/nike.jpg"),
    ),
    ),
        const Card(
           child: ListTile(
             title: Text("Puma"),
             subtitle: Text("\$3500"),
             trailing: Icon(Icons.shopping_cart),
             leading: CircleAvatar(backgroundImage: NetworkImage("https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_2000,h_2000/global/195234/01/sv01/fnd/EEA/fmt/png/Softride-Enzo-NXT-Running-Shoes-Men")),
           ),
         ),
         const Card(
           child: ListTile(
             title: Text("Woodland"),
             subtitle: Text("\$4000"),
             trailing: Icon(Icons.shopping_cart),
             leading: CircleAvatar(backgroundImage: NetworkImage("https://tiimg.tistatic.com/fp/1/007/840/brown-casual-wear-lace-up-plain-stylish-woodland-shoes-for-mens--599.jpg")),
           ),
         ),
         // Text("Item 1"),
         // Text("Item 2"),
         // Text("Item 3"),
         // Text("Item 4"),
         // Text("Item 5"),
       ],
      ),
    );
  }
}
