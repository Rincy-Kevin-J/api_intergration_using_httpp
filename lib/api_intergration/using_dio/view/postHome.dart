import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:lottie/lottie.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import '../../utils/snackbar.dart';
import '../controller/postController.dart';

class PostHome extends StatelessWidget {
  Postcontroller controller = Get.put(Postcontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
        backgroundColor: Colors.teal,
      ),
      body: Obx(() => SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: controller.isNetConnected.value == true
              ? controller.isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: Colors.purple,
                      ),
                    )
                  : getData()
              : noInternet(context))),
      floatingActionButton: Obx(() =>
          controller.isNetConnected.value == true ? buildFAB() : Container()),
    );
  }

  FloatingActionButton buildFAB() {
    return FloatingActionButton(
      onPressed: () {
        controller.isListDowN.value
            ? controller.scrollListUp()
            : controller.scrollListDown();
      },
      child: FaIcon(controller.isListDowN.value
          ? FontAwesomeIcons.arrowTrendUp
          : FontAwesomeIcons.arrowTrendDown),
    );
  }

  RefreshIndicator getData() {
    return RefreshIndicator(
      onRefresh: () => controller.fetchPosts(),
      child: ScrollablePositionedList.builder(
          itemScrollController: controller.scrollController,
          itemCount: controller.posts.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.brown[300],
                  child: Text(controller.posts[index].id!.toString()),
                ),
                title: Text(
                  controller.posts[index].title!,
                ),
                subtitle: Text(
                  controller.posts[index].body!,
                ),
              ),
            );
          }),
    );
  }

  Center noInternet(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Lottie.asset("assets/animation/hamsteranime.json"),
          MaterialButton(
            onPressed: () async {
              if (await InternetConnection().hasInternetAccess == true) {
                controller.fetchPosts();
              } else {
                showCustomSnackBar(context);
              }
            },
            shape: const StadiumBorder(),
            child: const Text("Retry"),
          )
        ],
      ),
    );
  }
}
