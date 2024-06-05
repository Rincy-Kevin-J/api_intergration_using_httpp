import 'package:dio/dio.dart';

class Dioservice {
  Future<dynamic> getPosts() async {
    Dio dio = Dio();
    return await dio
        .get("https://jsonplaceholder.typicode.com/posts",
            options: Options(responseType: ResponseType.json, method: "Get"))
        .then((response) {
      return response;
    });
  }
}
