import 'package:flutter/material.dart';
import 'package:practice/storages%20in%20flutter/shared%20preferences/login%20and%20reg%20using%20shared/registration%20storage.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main(){
  runApp(MaterialApp(debugShowCheckedModeBanner:false,home: Registration(),));
}

class Registration extends StatefulWidget {


  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {

  final username=TextEditingController();
  final email=TextEditingController();
  final password=TextEditingController();
  late SharedPreferences preferences;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign Up"),),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(decoration: InputDecoration(border: OutlineInputBorder(),hintText: "Username"),
              controller: username,),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(decoration: InputDecoration(border: OutlineInputBorder(),hintText: "Email Id"),
                controller: email,),
            ),


            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(decoration: InputDecoration(border: OutlineInputBorder(),hintText: "Password"),
                controller: password,),
            ),

            ElevatedButton(onPressed: ()
            async{
              preferences=await SharedPreferences.getInstance();

              String uname= username.text;
              String mail= email.text;
              String pass= password.text;

              if(uname !="" && mail !="" && pass !=""){
                preferences.setString("name", uname);
                preferences.setString("mailid", mail);
                preferences.setString("pwd", pass);


                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Registration_Storage()));
              }
              username.text="";
              email.text="";
              password.text="";

            }, child: Text("Sign Up"))

          ],
        ),
      ),
    );
  }
}
