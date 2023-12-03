import 'dart:html';

import 'package:flutter/material.dart';
import 'package:practice/storages%20in%20flutter/shared%20preferences/simple%20login%20using%20shared%20pref/shared%20home.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main(){
  runApp(MaterialApp(debugShowCheckedModeBanner:false,
    home: LoginShared(),));
}


class LoginShared extends StatefulWidget {


  @override
  State<LoginShared> createState() => _LoginSharedState();
}

class _LoginSharedState extends State<LoginShared> {
  final email=TextEditingController();
  final pwd=TextEditingController();
  late SharedPreferences preferences;
  late bool newuser;


  @override
  void initState() {
    check_if_user_already_login();
    super.initState();
  }

  void check_if_user_already_login() async{
    preferences=await SharedPreferences.getInstance();

    // ?? - if the condition is null fetch the second value
    // check whether the user is already logged in, if getBool ("userlogin") is null

    newuser =preferences.getBool("userlogin")??true;

    if(newuser==false){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>SharedHome()));
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Page"),),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(decoration:InputDecoration(border: OutlineInputBorder(),
              hintText: "Email"),
                controller: email,),
            ),


            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(decoration: InputDecoration(border: OutlineInputBorder(),
              hintText: "Password"),
                controller: pwd,),
            ),
            ElevatedButton(onPressed: () async{

              preferences= await SharedPreferences.getInstance();
              
              String username= email.text;
              String password= pwd.text;
              
              if(username != ""&& password != ""){
                preferences.setString("Uname",username);
              preferences.setString("pword",password);

              //set the user logged in
              preferences.setBool("userlogin", false);

              
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SharedHome()));
              }
              email.text="";
              pwd.text="";
            },
                child: const Text("Login"))
          ],
        ),
      ),
    );
  }

}
