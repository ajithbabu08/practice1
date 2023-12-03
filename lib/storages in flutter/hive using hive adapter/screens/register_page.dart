import 'dart:js';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:practice/storages%20in%20flutter/hive%20using%20hive%20adapter/database/hivedb.dart';
import 'package:practice/storages%20in%20flutter/hive%20using%20hive%20adapter/models/user_model.dart';
import 'login_page.dart';

class RegisterHive extends StatelessWidget {


  final email=TextEditingController();
  final password=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(title: Text("Hive Registration"),),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: email,
              decoration: const InputDecoration(
                hintText: "Email"
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: password,
              decoration: const InputDecoration(
                  hintText: "Password"
              ),
            ),
          ),

          ElevatedButton(onPressed: () async{
            // fetch all the users from db
            final userlist= await HiveDb.instance.getUser();
            validateSignUp(context, userlist);
          },
              child: const Text("Sign Up")),
          TextButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Login()));
          },
              child: const Text("Already have an account? Login"))
        ],
      ),
    );
  }

  void validateSignUp(BuildContext context,List<User> userlist) async {
    final uname = email.text.trim();
    final pwd = password.text.trim();
    bool userFound = false;
    final validateEmail = EmailValidator.validate(uname);
    if (uname != "" && pwd != "") {
      if (validateEmail == true) {
        await Future.forEach(userlist, (singleUser) {
          if (singleUser.email == uname) {
            userFound = true;
          } else {
            userFound = false;
          }
        });
        if (userFound == true) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("User Already Exist!!")));
        } else {
          final validatePassword = ValidatePassword(context, pwd);
          if (validatePassword == true) {
            final user = User(email: uname, password: pwd);
            await HiveDb.instance.addUser(user);
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => Login()));
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("User Registration Success")));
          }
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Invalid Email")));
      }
    }
    else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Fields must not be empty")));
    }
  }


bool ValidatePassword (BuildContext context,String pwd){
  if(pwd.length<6) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Password length must be atleast 6")));
    return false;
  }else{
    return true;
  }
  }
}
