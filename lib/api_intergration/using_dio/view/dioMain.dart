import 'package:api_intergration/api_intergration/using_dio/view/postHome.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(ApiDio());
}

class ApiDio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(home: PostHome(),
      debugShowCheckedModeBanner: false,);
  }
}
