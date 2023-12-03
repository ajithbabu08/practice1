import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:practice/home.dart';

void main(){
  runApp(MaterialApp(debugShowCheckedModeBanner:false, home: LoginPage(),));
}

class LoginPage extends StatelessWidget{

  String uname="admin";
  String password="123";

  TextEditingController usercontroller=TextEditingController();
  TextEditingController passcontroller=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Login Page"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
               Padding(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  controller: usercontroller,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.people),
                      hintText: "Username",
                      helperText: "Username must be an email",
                      labelText: "Username"),
                ),
              ),
               Padding(
                padding: EdgeInsets.only(left: 20,right: 20,bottom: 50),

                child: TextField(
                  controller: passcontroller,
                  obscureText: true,
                  obscuringCharacter: "*",
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.visibility_off_sharp),
                      hintText: "Password",
                      helperText: "Password must contain atleast 6 characters",
                      labelText: "Password"),
                ),
              ),
              ElevatedButton(onPressed: (){

                if(uname== usercontroller.text && password==passcontroller.text) {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HomePage()));

                  usercontroller.text="";
                  passcontroller.text="";
                }else {
                  //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Invalid username or password"),
                  //   backgroundColor: Colors.blue,));
                  // }

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
              }, child:const Text("Login"))
            ],
          ),
        )
    );
  }

}