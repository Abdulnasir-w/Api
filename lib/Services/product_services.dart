import 'dart:convert';

import 'package:api/Models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductServices {
  static final String api = "https://dummyjson.com/products/";

  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse(api));

    try {
      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data['products'] != null) {
          final List<dynamic> productJson = data['products'];

          return productJson.map((json) => Product.fromJson(json)).toList();
        } else {
          return [];
        }
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      throw Exception("Error $e");
    }
  }
}
