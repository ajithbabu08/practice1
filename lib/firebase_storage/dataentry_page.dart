import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

  void main()async{
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    runApp(Register_data());
  }

class Register_data extends StatelessWidget {

  final namecontroller=TextEditingController();
  final emailcontroller=TextEditingController();
  final phonecontroller=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register"),),
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: namecontroller,
            decoration: InputDecoration(
              hintText: "Name"
            ),
          ),
          TextField(
            controller: emailcontroller,
            decoration: InputDecoration(
                hintText: "Name"
            ),
          ),
          TextField(
            controller: phonecontroller,
            decoration: InputDecoration(
                hintText: "Name"
            ),
          ),
          ElevatedButton(onPressed: (){
            CollectionReference userdata= FirebaseFirestore.instance.collection('userdata');
            userdata.add({
              'name': namecontroller.text,
              'email': emailcontroller.text,
              'phone': phonecontroller.text,
            });
          }, child: Text("Sign Up"))
        ],
      ),
    );
  }
}
