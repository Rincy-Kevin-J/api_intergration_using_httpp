import 'package:api_intergration/api_intergration/using%20http/model/product.dart';
import 'package:http/http.dart' as http;

class HttpService {
  static Future<List<Products>> getProducts() async {
    var response =
        await http.get(Uri.parse("https://fakestoreapi.com/products"));
    if (response.statusCode == 200) {
      var data = response.body; //type of body is string
      return productsFromJson(data);
    } else {
      throw Exception();
    }
  }
}
