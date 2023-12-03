import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class Permission_First_pgm extends StatefulWidget {
  const Permission_First_pgm({super.key});

  @override
  State<Permission_First_pgm> createState() => _Permission_First_pgmState();
}

class _Permission_First_pgmState extends State<Permission_First_pgm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Permission Handler"),),
      body: Column(
        children: [
          ElevatedButton(onPressed: requestCameraPermission, child: Text("Request Camera Permission")),
          SizedBox(height: 20,),

          ElevatedButton(onPressed: requestMultiplePermission, child: Text("Request Camera Permission")),
          SizedBox(height: 20,),

          ElevatedButton(onPressed: requestSettingsPermission, child: Text("Request Camera Permission")),
          SizedBox(height: 20,),
        ],
      ),
    );
  }
  void requestCameraPermission () async{
    var status=await Permission.camera.status;
    if(status.isGranted){
      ImagePicker picker=ImagePicker();
      picker.pickImage(source: ImageSource.camera);
      print("Permission granted");
    }else if(status.isDenied)
      {
      if(await Permission.camera.request().isGranted){
        print("Permission was granted");
      }
    }
  }

  void requestMultiplePermission()async{
    Map<Permission,PermissionStatus> statuses= await[
      Permission.location,
      Permission.storage,
      Permission.phone,
      Permission.photos
    ].request();
    print("location Permission: ${statuses[Permission.location]},"
    "storage permission: ${statuses[Permission.storage]}");
  }
  void requestSettingsPermission() async{
    openAppSettings();
  }
}
