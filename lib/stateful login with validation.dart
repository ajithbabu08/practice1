import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:practice/home.dart';
import 'package:practice/registration.dart';


void main(){
  runApp(MaterialApp(debugShowCheckedModeBanner:false, home: Login2(),));
}

class Login2 extends StatefulWidget{
  @override
  State<Login2> createState()=> _Login2State();

}

class _Login2State extends State<Login2>{

  var formkey=GlobalKey<FormState>();
  bool passvisibility=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login with validation"),
      ),
      body: Form(
        key: formkey,
          child: Column(
            children: [
              Image.asset("assets/icons/flashicon.png",height: 30,width: 30),
              const Text("Login",style: TextStyle(fontSize: 20),),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                    decoration: InputDecoration(
                        hintText: "Username",
                        border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50))),
                    validator: (uname) {
                      if (uname!.isEmpty || !uname.contains("@")) {
                        return "Fields are empty or Invalid";
                      } else {
                        return null;
                      }
                    }
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(

                  obscuringCharacter: "*",
                    obscureText: passvisibility, //showpass=true initially
                    decoration: InputDecoration(

                      suffixIcon: IconButton(
                        onPressed: (){
                          setState(() {
                            if(passvisibility==true){
                              passvisibility=false;
                              }else{
                              passvisibility=true;
                            }
                          });
                        },
                        icon: Icon(passvisibility==true
                        ? Icons.visibility_off_sharp
                        : Icons.visibility)
                      ),
                        hintText: "Password",
                        border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50))),
                    validator: (password) {
                      if (password!.isEmpty || password.length<6) {
                        return "Fields are empty or Password length must be greaterthan 6";
                      } else {
                        return null;
                      }
                    }
                ),
              ),
              ElevatedButton(onPressed: () {
                final valid=formkey.currentState!.validate();
                if(valid){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomePage()));
                }
                else{
                  Fluttertoast.showToast(
                      msg: "Invalid Username or Password",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.TOP,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );
                }
              }, child: Text("Login")),
              TextButton(onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Register()));
              }, child: Text("Not a User ? Register Here"))

            ],
          )),


    );
  }


  }

