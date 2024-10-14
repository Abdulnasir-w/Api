import 'dart:convert';

import 'package:api/Models/recipe_model.dart';
import 'package:http/http.dart' as http;

class RecipeServices {
  static final String api = "https://dummyjson.com/recipes";

  Future<List<Recipe>> fetchRecipes() async {
    final response = await http.get(Uri.parse(api));

    try {
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data["recipes"] != null) {
          final List<dynamic> recipeFromJson = data['recipes'];
          return recipeFromJson.map((json) => Recipe.fromJson(json)).toList();
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
