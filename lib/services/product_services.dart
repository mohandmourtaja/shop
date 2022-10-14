import 'package:http/http.dart' as http;
import 'package:project_1/model/product_mode.dart';
import 'package:project_1/utils/utils_string.dart';

class ProductServices {
  static Future<List<ProductModels>> getProduct() async {
    var response = await http.get(Uri.parse('$baseUrl/products'));

    if (response.statusCode == 200) {
      var jsonData = response.body;
      return productModelsFromJson(jsonData);
    } else {
      return throw Exception("Faild to load product");
    }
  }
}
