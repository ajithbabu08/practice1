import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice/firebase_examplepgm/email_pass_auth/firebase_db.dart';
import 'package:practice/firebase_examplepgm/email_pass_auth/register_fir.dart';

import 'home_fir.dart';



void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyCpuW8QvRwU0--OuXiCgwemiZ7E_1ne25k",
        appId: "1:905081215074:android:925d61a8a8c83db3b5993b",
        messagingSenderId: "",
        projectId: "fir-first-d8286")
  );
  User? user=FirebaseAuth.instance.currentUser;
  runApp(MaterialApp(home: user==null? Login_fire() : Home_Fire(),));
}


class Login_fire extends StatefulWidget {


  @override
  State<Login_fire> createState() => _Login_fireState();
}

class _Login_fireState extends State<Login_fire> {

  final username_controller=TextEditingController();
  final passsword_controller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login"),),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              decoration: const InputDecoration(border: OutlineInputBorder(),
                  hintText: "Username"),
              controller: username_controller,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              decoration: const InputDecoration(border: OutlineInputBorder(),
                  hintText: "Password"),
              controller: passsword_controller,
            ),
          ),
          ElevatedButton(onPressed: (){
            String email=username_controller.text.trim();
            String pass=passsword_controller.text.trim();
            FirebaseHelper().login(email:email, password:pass).then((result){
              if(result==null){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Home_Fire()));
              }else{
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(result)));
              }
            });
          },
              child: const Text("Login")),
          SizedBox(height: 15,),
          TextButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Reg_fire()));
          }, child: const Text("Not a User? Register Here !!"))
        ],
      ),
    );
  }
}
