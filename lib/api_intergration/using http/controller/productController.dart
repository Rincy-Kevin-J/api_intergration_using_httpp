import 'package:api_intergration/api_intergration/using%20http/service/api_service.dart';
import 'package:get/get.dart';

class Productcontroller extends GetxController{
  var isLoading =true.obs;
  var productList=[].obs;
  @override
  void onInit() {
    readProducts();
    super.onInit();
  }
  void readProducts()async{
    try{
      isLoading(true);
      var product=await HttpService.getProducts();
      if(product!=null){
        productList.value=product;
      }
    }catch(e){
      print(e);
    }finally{
      isLoading(false);
    }
  }

}