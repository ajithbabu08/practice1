import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main(){
  runApp(MaterialApp(home: Insta()));
}
class Insta extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Scaffold
      (backgroundColor : Colors.black,
      body: Center
        (child: ShaderMask
        (blendMode: BlendMode.srcIn,
        shaderCallback: (Rect bounds) =>const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomRight,

          colors: [Colors.deepPurple,Colors.pink,Colors.orange],).createShader(bounds),
        child: FaIcon(FontAwesomeIcons.instagram,size: 100,),


      ),
      ),
    );
  }
}