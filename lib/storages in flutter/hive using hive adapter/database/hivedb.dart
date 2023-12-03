import 'package:hive/hive.dart';
import 'package:practice/storages%20in%20flutter/hive%20using%20hive%20adapter/models/user_model.dart';

class HiveDb{

  HiveDb.internal();
  static HiveDb instance=HiveDb.internal();

  factory HiveDb(){     // factory constructor for creating singleton class
    return instance;    // these class have only one instance
  }

  Future<void> addUser(User user) async{
    final db=await Hive.openBox<User>('userdata');
    db.put(user.id, user);
  }

  Future<List<User>> getUser() async{
    final db= await Hive.openBox<User>('userData');
    return db.values.toList();
  }
}