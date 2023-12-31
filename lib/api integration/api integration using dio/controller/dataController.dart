import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:practice/api%20integration/api%20integration%20using%20dio/service/dio_service.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../model/datamodel.dart';

class DataController extends GetxController{
  RxList<DataModel> datas=RxList(); // observable
  RxBool isLoading=true.obs;
  RxBool isListatDown=false.obs;
  RxBool isNetConnected=true.obs;


  var url="https://jsonplaceholder.typicode.com/posts";
  var itemController= ItemScrollController();


  isInternetConnected() async{
    isNetConnected.value= await InternetConnectionChecker().hasConnection;
  }

  // to get all the datas from api

  fetchData()async{
    isInternetConnected();
    isLoading.value=true;
    var response= await DioService().getData(url);
    if(response.statusCode ==200){
      response.data.forEach((element){
        datas.add(DataModel.fromJson(element));
      });
      isLoading.value=false;
    }
  }

  //scroll listview to down
  scrollToDown(){
    itemController.scrollTo(
        index: datas.length,
        duration: Duration(seconds: 3),
        curve: Curves.bounceInOut,
    );
    isListatDown.value=true;
  }


  // scroll listview to up
  scrollToUp(){
    itemController.scrollTo(index: 0, duration: Duration(seconds: 3),
    curve: Curves.bounceInOut);
    isListatDown.value= false;
  }

  @override
  void onInit() {
    fetchData();
    isInternetConnected();
    super.onInit();
  }

}