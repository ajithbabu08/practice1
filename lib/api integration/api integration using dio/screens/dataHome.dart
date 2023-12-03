import 'dart:js';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:lottie/lottie.dart';
import 'package:practice/api%20integration/api%20integration%20using%20dio/controller/dataController.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import 'detailsData.dart';


void main(){
  runApp(GetMaterialApp(home: DataHomePage(),));
}
class DataHomePage extends StatelessWidget {
  
  DataController controller=Get.put(DataController());
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Data Home"),),
      body: Obx(()=>SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: controller.isNetConnected.value?
        (controller.isLoading.value? loadAnimation():getData())
            : noInternet(context),
      )
      ),
      floatingActionButton: Obx(()=>controller.isNetConnected.value? buildFAB():Container()),
    );
  }

  FloatingActionButton buildFAB(){
    return FloatingActionButton(onPressed: (){
      controller.isListatDown.value?
          controller.scrollToUp():
          controller.scrollToDown();
    },
    backgroundColor: Colors.red,
      child: FaIcon(
        controller.isListatDown.value?
            FontAwesomeIcons.arrowUp:
            FontAwesomeIcons.arrowDown
      ),
    );
  }

  loadAnimation() {
    return Center(
      child: SizedBox(
        width: 150,
        height: 150,
        child: Lottie.asset("assets/animme/loadinghome.json"),
      ),
    );
  }

  RefreshIndicator getData() {
    return RefreshIndicator(
      onRefresh:(){
        return controller.fetchData();
      },
        child: ScrollablePositionedList.builder(
          itemScrollController: controller.itemController,
            physics: BouncingScrollPhysics(),
            itemCount: controller.datas.length,
            itemBuilder: (context,index){
              return InkWell(
                onTap: ()=>Get.to(DetailData(index:index)),
                child: Card(
                  child: ListTile(
                    leading: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.blue
                      ),
                      child: Center(
                        child: Text(controller.datas[index].id.toString()),
                      ),
                    ),
                    title: Text(controller.datas[index].title!,
                    style: TextStyle(
                      fontSize: 25,fontWeight: FontWeight.bold
                    ),),
                    subtitle: Text(controller.datas[index].body!,
                    style: const TextStyle(
                      fontSize: 25,fontStyle: FontStyle.italic,
                    ),),
                  ),
                ),
              );
            }));
  }
  Center  noInternet(BuildContext context){
    return Center(
      child: Column(
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: Lottie.asset("assets/animme/nointernet.json"),
          ),
          MaterialButton(color: Colors.green,
          onPressed: () async{
            if(await InternetConnectionChecker().hasConnection==true)
              controller.fetchData();
            else{
              showTopSnackBar(
                Overlay.of(context),
                CustomSnackBar.error(
                  message:
                  "No Internet Connection Available, try again",
                ),
              );
            }
          },)
        ],
      ),
    );
  }
}
