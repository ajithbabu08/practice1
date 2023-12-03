import 'dart:html';

import 'package:flutter/material.dart';
import 'package:practice/storages%20in%20flutter/sqflite%20operation/sqflite%20crud/first%20sqflite%20pgm/sqfliteoperations.dart';


void main(){
  runApp(MaterialApp(home: SqfliteHome(),));
}

class SqfliteHome extends StatefulWidget {

  @override
  State<SqfliteHome> createState() => _SqfliteHomeState();
}

class _SqfliteHomeState extends State<SqfliteHome> {

  var isLoading=true;

  //to read all the values from sqflite db
  List<Map<String,dynamic>> contacts=[];

  @override
  void initstate(){
    loadUi();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Contacts"),),



      body: isLoading ?
      Center(
        child: CircularProgressIndicator(),)
          :ListView.builder(itemBuilder: (context,index){
            return Card(
              child: ListTile(
                title: Text(contacts[index]['cname']), //accessing single map from a list
                subtitle: Text(contacts[index]['cnumber']),
                trailing: Wrap(
                  children: [
                    IconButton(onPressed: (){
                      showSheet(contacts[index]["id"]);
                    }, icon: Icon(Icons.edit)),
                    IconButton(onPressed: (){
                      deleteContact(contacts[index]["id"]);
                    }, icon: Icon(Icons.delete))
                  ],
                )
              ),
            );
      }),


      floatingActionButton: FloatingActionButton(
        //creating a new data so the id will be null
        onPressed: ()=>showSheet(null),
        child: Icon(Icons.add),
      ),
    );
  }

  final name_control=TextEditingController();
  final phone_control=TextEditingController();


  void showSheet(int? id) async{
    if(id!= null){
      final existingcontact=contacts.firstWhere((element) => element["id"]==id);
      name_control.text=existingcontact["cname"];
      phone_control.text=existingcontact["cnumber"];
    }
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context){
      return Container(
        child: Padding(
          padding: EdgeInsets.only(
              left: 15,right: 15,top: 15,
              bottom: MediaQuery.of(context).viewInsets.bottom+120),
          child: Column(mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: name_control,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),hintText: "Name"
                ),
              ),
              SizedBox(height: 10,),

              TextField(
                controller: phone_control,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),hintText: "Phone number"
                ),
              ),
              SizedBox(height: 10,),
              ElevatedButton(
                  onPressed: ()async{
                    if(id==null){
                      await createContact();
                    }
                    if(id !=null){
                      await updateContact(id);
                    }
                    name_control.text="";
                    phone_control.text="";
                    Navigator.pop(context);
                  }, child: Text(id== null?
              "Create Contact": "Update Contact"))
            ],
          ),
        ),
      );
    });
  }

  Future<void> createContact() async{
  await SQLHelper.create_contact(name_control.text,phone_control.text);
  loadUi(); //refresh list each time
}

void loadUi() async{
    final data=await SQLHelper.readContacts();
    setState(() {
      contacts=data; //we are performing crud in this list so it must be inside setstate
      isLoading=false;
    });
}

  Future<void> updateContact(int id) async{
    await SQLHelper.updateContact(id,name_control.text,phone_control.text);
    loadUi();
  }

  Future<void> deleteContact(int id) async{
    await SQLHelper.deleteContact(id);
    loadUi();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Successfully deleted")));
  }
}
