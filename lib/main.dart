import 'package:api_intergration/api_intergration/using%20http/view/product_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(ApiHttp());
}

class ApiHttp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        home: ProductHome()

    );
  }
}
