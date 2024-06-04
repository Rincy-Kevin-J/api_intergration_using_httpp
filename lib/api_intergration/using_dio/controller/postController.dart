import 'package:api_intergration/api_intergration/using_dio/service/dioService.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import '../../category_using_http/model/model.dart';

class Postcontroller extends GetxController{
  RxList<ProductModel>posts=RxList();
  RxBool isLoading=true.obs;
  RxBool isListDowN=false.obs;
  RxBool isNetConnected=true.obs;
  var scrollController=ItemScrollController();
  void isInternetConnected()async {
    isNetConnected.value = await InternetConnection().hasInternetAccess;

  }
  fetchPosts()async{
    isInternetConnected();
    isLoading.value=true;
    var response=await Dioservice().getPosts();
    if(response.statuscode==200){
      response.data.forEach((data){
        posts.add(ProductModel.fromJson(data));
        print(posts);
      });
      isLoading.value=false;
    }
  }
  scrollListDown(){
    scrollController.scrollTo(index: posts.length, duration: Duration(seconds: 3),
      curve: Curves.easeInOutCirc
      );
    isListDowN.value=false;
  }
  scrollListUp(){
    scrollController.scrollTo(index:0, duration: Duration(seconds: 3),
        curve: Curves.easeInOutCirc
    );
    isListDowN.value=false;
  }
  @override
  void onInit() {
    fetchPosts();
    isInternetConnected();
    super.onInit();
  }

  }