import 'package:flutter/material.dart';
import 'package:practice/firebase_examplepgm/email_pass_auth/firebase_db.dart';
import 'package:practice/firebase_examplepgm/email_pass_auth/login_fir.dart';

class Home_Fire extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: (){
          FirebaseHelper().signOut().then((result)=>
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Login_fire())));
        },
        child: Text("Sign Out"),),
      ),
    );
  }
}

