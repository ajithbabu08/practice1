import 'package:flutter/material.dart';
import 'package:practice/firebase_examplepgm/email_pass_auth/firebase_db.dart';
import 'package:practice/firebase_examplepgm/email_pass_auth/login_fir.dart';

class Reg_fire extends StatefulWidget {


  @override
  State<Reg_fire> createState() => _Reg_fireState();
}

class _Reg_fireState extends State<Reg_fire> {
  final username_controller=TextEditingController();
  final passsword_controller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Registration"),),
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
            FirebaseHelper().register(useremail:email,password:pass).then((result) {
              if (result == null) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Login_fire()));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(result)));
              }
            });
            },
              child: const Text("Register Here"))
        ],
      ),
    );
  }
}
