import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

void main()async{
  await Hive.initFlutter();
  await Hive.openBox("to_do_Box");
  runApp(MaterialApp(home: Hive_crud(),));
}

class Hive_crud extends StatefulWidget {


  @override
  State<Hive_crud> createState() => _Hive_crudState();
}

class _Hive_crudState extends State<Hive_crud> {


  List<Map<String,dynamic>> task= [];
  final mybox=Hive.box("to_do_Box");



  @override
  void initState() {
    load_or_read_Task();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Note"),
      ),
      body: task.isEmpty? Center(child: CircularProgressIndicator(),
      )
          :ListView.builder(
        itemCount: task.length,
          itemBuilder: (ctx,index){
          final mytask=task[index];

            return Card(
              child: ListTile(
                title: Text(task[index]["taskname"]),
                subtitle: Text(mytask["taskcont"]),
                trailing: Wrap(
                  children: [
                    IconButton(onPressed: (){
                      showTask(context, mytask['id']);
                    }, icon: Icon(Icons.edit)),
                    IconButton(onPressed: (){
                      deleteTask(mytask['id']);
                    }, icon: Icon(Icons.delete))
                  ],
                ),
              ),
            );
      }),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: ()=>showTask(context,null),
        label: Text("New Task"),
      icon: Icon(Icons.add),),
    );
  }

  final task_controller=TextEditingController();
  final content_controller=TextEditingController();

  void showTask(BuildContext context, int? itemkey) {
    if(itemkey!=null){
      final existingTask= task.firstWhere((element) => element['id']==itemkey);
      task_controller.text=existingTask['taskname'];
      content_controller.text=existingTask['taskcont'];
    }

    //itemkey similar to id in sqflite
    showModalBottomSheet(
      isScrollControlled: true,
        context: context, builder: (context){
      return Container(
        padding: EdgeInsets.only(
          top: 15,
          left: 15,
          right: 15,
          bottom: MediaQuery.of(context).viewInsets.bottom+120
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: task_controller,
              decoration: InputDecoration(border: OutlineInputBorder(),
              hintText: "Task Name"),
            ),
            SizedBox(height: 20),
            TextField(
              controller: content_controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Write here"
              ),
            ),

            ElevatedButton(onPressed: (){
              if(task_controller.text!=""&& content_controller.text!=""){
                if(itemkey==null){
                  createTask({
                    "heading":task_controller.text.trim(),
                    "content":content_controller.text.trim(),
                  });
                }else{
                  updateTask(itemkey,{
                    "heading":task_controller.text.trim(),
                    "content":content_controller.text.trim()
                  });
                }
              }
              task_controller.text="";
              content_controller.text="";
              Navigator.of(context).pop();
            },
                child: Text(itemkey==null? "Create Task" : "Update Task"))
          ],
        ),
      );
    });
  }

  Future<void>createTask(Map<String, dynamic> task) async {
    await mybox.add(task);
    load_or_read_Task();

  }

  void updateTask(int? itemkey, Map<String, String> uptask) async{
    await mybox.put(itemkey, uptask);
    load_or_read_Task();
  }

  void load_or_read_Task() {
    final task_from_hive=mybox.keys.map((key) {
      final value = mybox.get(key);
      return {
        "id": key,
        "taskname": value["heading"],
        "taskcont": value["content"]
      };
    }).toList();
    setState(() {
      task=task_from_hive.reversed.toList();
    });
  }

  Future<void> deleteTask(int itemkey) async{
    await mybox.delete(itemkey);
    load_or_read_Task();
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.red,
        content: Text("Successfully deleted")));
  }
}
