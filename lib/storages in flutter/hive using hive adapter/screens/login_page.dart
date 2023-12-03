
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:practice/storages%20in%20flutter/hive%20using%20hive%20adapter/database/hivedb.dart';
import 'package:practice/storages%20in%20flutter/hive%20using%20hive%20adapter/screens/register_page.dart';

import '../models/user_model.dart';
import 'home.dart';


void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  await Hive.openBox<User>('userData');
  runApp(MaterialApp(home: Login(),));
}

class Login extends StatelessWidget {
  final email=TextEditingController();
  final pass=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hive Login"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: email,
              decoration: const InputDecoration(
                hintText: "Username"
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: pass,
              decoration: const InputDecoration(
                hintText: "Password"
              ),
            ),
          ),

          ElevatedButton(
              onPressed: ()async{
              final users=await HiveDb.instance.getUser();
              checkUserExist(context,users);
          },
              child: Text("Login")),
          TextButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>RegisterHive()));
          },
              child: const Text("Not a User? Register Here !!"))
        ],
      ),
    );
  }

  Future<void> checkUserExist(BuildContext context, List<User> users) async{
    final lemail=email.text.trim();
    final lpass=pass.text.trim();
    bool userFound=false;
    if(lemail !="" && lpass!=""){
      await Future.forEach(users, (singleUser) {
        if(lemail==singleUser.email && lpass==singleUser.password){
          userFound=true;
        }else{
          userFound=false;
        }
      });
      if(userFound==true){
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>HiveHome(email: lemail,)));
      }else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login failed, User not found")));
      }
    }else{

  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Fiels must not  be empty")));
        }

  }

}
