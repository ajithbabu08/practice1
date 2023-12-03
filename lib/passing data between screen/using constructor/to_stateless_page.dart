import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StatelessPage extends StatelessWidget {
  final String name;
  final String location;
  final int? phone;

  StatelessPage({super.key, required this.name, required this.location, required this.phone});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recieved Data"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(name,style: GoogleFonts.rubik(fontSize: 30,color: Colors.orange),),
            Text(location,style: GoogleFonts.rubik(fontSize: 20,color: Colors.black,),),
            Text('$phone', style: GoogleFonts.rubik(fontSize: 10,color: Colors.pink,),),

          ],
        ),
      ),
    );
  }
}
