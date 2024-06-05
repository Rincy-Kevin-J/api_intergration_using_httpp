import 'package:api_intergration/api_intergration/album_using_http/controller/album_controller.dart';
import 'package:api_intergration/api_intergration/album_using_http/widget/album_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AlbumHome extends StatelessWidget{
  final AlbumController albumController=Get.put(AlbumController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Album"),
      ),
      body: SizedBox(
        child: Obx((){
          if(albumController.isLoading.value){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          else{
            return GridView.builder(
              itemCount: albumController.albumList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio:.5),
              itemBuilder: (context, index) {
                return AlbumTile(
                    albumController.albumList[index]
                );
              },);
          }
        }),
      ),
    );
  }
}
