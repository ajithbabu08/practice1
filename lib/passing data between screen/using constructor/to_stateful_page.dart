import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StatefulPage extends StatefulWidget {

  final String name;
  final String location;
  int? phone;

  StatefulPage({super.key, required this.name, required this.location, this.phone});

  @override
  State<StatefulPage> createState() => _StatefulPageState();
}

class _StatefulPageState extends State<StatefulPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Text(widget.name,style: GoogleFonts.rubik(fontSize: 30,color: Colors.orange),),
            Text(widget.location,style: GoogleFonts.rubik(fontSize: 30,color: Colors.yellow),),
            Text("${widget.phone}",style: GoogleFonts.rubik(fontSize: 30,color: Colors.red),),
          ],
        ),
      ),
    );
  }
}
