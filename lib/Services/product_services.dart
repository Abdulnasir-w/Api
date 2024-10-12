import 'dart:convert';

import 'package:api/Models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductServices {
  static final String api = "https://dummyjson.com/products";

  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse(api));

    try {
      if (response.statusCode == 200) {
        final List product = json.decode(response.body)['producs'];
        return product.map((json) => Product.fromJson(json)).toList();
      } else {
        throw Exception("Failed to Load Products");
      }
    } catch (e) {
      throw Exception("Error $e");
    }
  }
}
