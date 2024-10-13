import 'dart:convert';

import 'package:api/Models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductServices {
  static final String api = "https://dummyjson.com/products/";

  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse(api));
    print('API Response: ${response.body}');

    try {
      if (response.statusCode == 200) {
        // Decode the entire response
        final data = json.decode(response.body);

        // Check if 'products' key exists and is not null
        if (data['products'] != null) {
          final List<dynamic> productJson = data['products'];

          // Return a list of Product objects
          return productJson.map((json) => Product.fromJson(json)).toList();
        } else {
          // If no products key is found, return an empty list
          return [];
        }
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      print("Error in Product Services $e");
      throw Exception("Error $e");
    }
  }
}
