import 'package:api_intergration/api_intergration/using_dio/service/dioService.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import '../../category_using_http/model/model.dart';



class Postcontroller extends GetxController {
  RxList<ProductModel> posts = RxList<ProductModel>();
  RxBool isLoading = true.obs;
  RxBool isListDowN = false.obs;
  RxBool isNetConnected = true.obs;
  var scrollController = ItemScrollController();

  Future<void> isInternetConnected() async {
    isNetConnected.value = await InternetConnection().hasInternetAccess;
    print("Internet connection status: ${isNetConnected.value}");
  }

  Future<void> fetchPosts() async {
    await isInternetConnected();
    if (!isNetConnected.value) {
      print("No internet connection.");
      isLoading.value = false;
      return;
    }

    isLoading.value = true;
    print("Fetching posts...");
    try {
      var response = await Dioservice.getPosts();
      print("Response status code: ${response.statusCode}");

      if (response.statusCode == 200) {
        print('Response data: ${response.data}');
        response.data.forEach((data) {
          posts.add(ProductModel.fromJson(data));
          print('Added post: ${data}');
        });
        isLoading.value = false;
      } else {
        print("Failed to fetch posts: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching posts: $e");
      isLoading.value = false;
    }
  }

  void scrollListDown() {
    scrollController.scrollTo(
      index: posts.length - 1,
      duration: Duration(seconds: 3),
      curve: Curves.easeInOutCirc,
    );
    isListDowN.value = false;
  }

  void scrollListUp() {
    scrollController.scrollTo(
      index: 0,
      duration: Duration(seconds: 3),
      curve: Curves.fastLinearToSlowEaseIn,
    );
    isListDowN.value = false;
  }

  @override
  void onInit() {
    super.onInit();
    fetchPosts();
  }
}


/*
class Postcontroller extends GetxController {
  RxList<ProductModel> posts = RxList();
  RxBool isLoading = true.obs;
  RxBool isListDowN = false.obs;
  RxBool isNetConnected = true.obs;
  var scrollController = ItemScrollController();

  // Checks if there is internet connection
  Future<void> isInternetConnected() async {
    isNetConnected.value = await InternetConnection().hasInternetAccess;
  }

  // Fetches posts from the API
  Future<void> fetchPosts() async {
    await isInternetConnected(); // Check for internet connection first
    if (!isNetConnected.value) { // If no internet, set isLoading to false and return
      isLoading.value = false;
      return;
    }

    isLoading.value = true; // Set loading state to true
    try {
      var response = await Dioservice().getPosts();
      if (response.statuscode == 200) {
        posts.clear(); // Clear previous posts before adding new ones
        response.data.forEach((data) {
          posts.add(ProductModel.fromJson(data));
        });
      } else {
        // Handle non-200 responses if needed
      }
    } catch (e) {
      // Handle errors if needed
    } finally {
      isLoading.value = false; // Set loading state to false in all cases
    }
  }

  // Scrolls the list down
  void scrollListDown() {
    scrollController.scrollTo(
      index: posts.length - 1,
      duration: Duration(seconds: 3),
      curve: Curves.easeInOutCirc,
    );
    isListDowN.value = false; // Set isListDowN to false when scrolling down
  }

  // Scrolls the list up
  void scrollListUp() {
    scrollController.scrollTo(
      index: 0,
      duration: Duration(seconds: 3),
      curve: Curves.fastLinearToSlowEaseIn,
    );
    isListDowN.value = true;  // Set isListDowN to true when scrolling up
  }

  @override
  void onInit() {
    super.onInit();
    fetchPosts(); // Fetch posts when the controller is initialized
  }
}

 */
// class Postcontroller extends GetxController {
//   RxList<ProductModel> posts = RxList();
//   RxBool isLoading = true.obs;
//   RxBool isListDowN = false.obs;
//   RxBool isNetConnected = true.obs;
//   var scrollController = ItemScrollController();
//
//   void isInternetConnected() async {
//     isNetConnected.value = await InternetConnection().hasInternetAccess;
//   }
//
//   fetchPosts() async {
//     isInternetConnected();
//     isLoading.value = true;
//     var response = await Dioservice().getPosts();
//     if (response.statuscode == 200) {
//       response.data.forEach((data) {
//         posts.add(ProductModel.fromJson(data));
//         print(posts);
//       });
//       isLoading.value = false;
//     }
//   }
//
//   scrollListDown() {
//     scrollController.scrollTo(
//         index: posts.length,
//         duration: Duration(seconds: 3),
//         curve: Curves.easeInOutCirc);
//     isListDowN.value = false;
//   }
//
//   scrollListUp() {
//     scrollController.scrollTo(
//         index: 0,
//         duration: Duration(seconds: 3),
//         curve: Curves.fastLinearToSlowEaseIn);
//     isListDowN.value = false;
//   }
//
//   @override
//   void onInit() {
//     fetchPosts();
//     isInternetConnected();
//     super.onInit();
//   }
// }
