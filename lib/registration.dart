import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:practice/stateful%20login%20with%20validation.dart';

class Register extends StatefulWidget {


  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  var formkey=GlobalKey<FormState>();
  bool passvisibility1=true;
  bool passvisibility2=true;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Registration Page"),
      ),

      body: Form(
        key: formkey,
        child: Column(
         children: [
           Image.asset("assets/icons/flashicon.png",height: 30,width: 30),
           const Text("Sign Up",style: TextStyle(fontSize: 20),),

           Padding(
             padding: const EdgeInsets.all(8.0),
             child: TextFormField(
                 decoration: InputDecoration(
                     hintText: "Name",
                     border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(50))),
                 validator: (name){
                   if(name!.isEmpty ){
                     return "Fields are empty or Invalid";
                   }else{
                     return null;
                   }
                 }
             ),
           ),

           Padding(
             padding: const EdgeInsets.all(8.0),
             child: TextFormField(
               decoration: InputDecoration(
                   hintText: "Mobile",
                   border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(50))),

                 validator: (mobile){
                   if(mobile!.isEmpty ){
                     return "Fields are empty or Invalid";
                   }else{
                     return null;
                   }
                 }
             ),
           ),

           Padding(
             padding: const EdgeInsets.all(8.0),
             child: TextFormField(
               decoration: InputDecoration(
                   hintText: "Userame",
                   border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(50))),
               validator: (username){
                 if(username!.isEmpty || !username.contains("@")){
                   return "Fields are empty or Invalid";
                 }else{
                   return null;
                 }
               }
             ),
           ),

           Padding(
             padding: const EdgeInsets.all(8.0),
             child: TextFormField(
               obscuringCharacter: "*",
               obscureText: passvisibility1,

               decoration: InputDecoration(

                   suffixIcon: IconButton(
                       onPressed: (){
                         setState(() {
                           if(passvisibility1==true){
                             passvisibility1=false;
                           }else{
                             passvisibility1=true;
                           }
                         });
                       },
                       icon: Icon(passvisibility1==true
                           ? Icons.visibility_off_sharp
                           : Icons.visibility)
                   ),

                   hintText: "Password",
                   border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(50))),
               validator: (pass){
                 password=pass;

                 if(pass!.isEmpty || pass.length<6){
                   return "Fields are empty or Password length must be greaterthan 6";
                 }else{
                   return null;
                 }
               },
             ),
           ),

           Padding(
             padding: const EdgeInsets.all(8.0),
             child: TextFormField(

               obscuringCharacter: "*",
               obscureText: passvisibility2,

               decoration: InputDecoration(

                   suffixIcon: IconButton(
                       onPressed: (){
                         setState(() {
                           if(passvisibility2==true){
                             passvisibility2=false;
                           }else{
                             passvisibility2=true;
                           }
                         });
                       },
                       icon: Icon(passvisibility2==true
                           ? Icons.visibility_off_sharp
                           : Icons.visibility)
                   ),

                   hintText: "Confirm Password",
                   border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(50))),

               validator: (cpass){

                 if(cpass!.isEmpty || cpass!=password){
                   return "Fields are empty or Password length must be greaterthan 6";
                 }else{
                   return null;
                 }
               },

             ),
           ),

           ElevatedButton(onPressed: (){
             final valid=formkey.currentState!.validate();
             if(valid){
               Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Login2()));
             }else{
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
           }, child: const Text("Sign UP")),
           TextButton(onPressed: (){
             Navigator.of(context).push(
                 MaterialPageRoute(builder: (context) => Login2()));
           }, child: const Text("Already have an account ? Login"))
         ],
        )

      ),
    );
  }
}
