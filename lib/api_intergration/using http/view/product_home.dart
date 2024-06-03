import 'package:api_intergration/api_intergration/using%20http/controller/productController.dart';
import 'package:api_intergration/api_intergration/using%20http/widget/product-tiles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductHome extends StatelessWidget{
  final Productcontroller productcontroller=Get.put(Productcontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
      ),
      body: SizedBox(
        child: Obx((){
          if(productcontroller.isLoading.value){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          else{
            return GridView.builder(
              itemCount: productcontroller.productList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio:.5),
                itemBuilder: (context, index) {
                 return ProductTiles(
                   productcontroller.productList[index]
                 );
                },);
          }
        }),
      ),
    );
  }
}