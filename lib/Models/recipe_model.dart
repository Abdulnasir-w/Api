class Recipe {
  final int id;
  final String name;
  final List<String> ingredients;
  final List<String> instructions;
  final int prepTimeMinutes;
  final int cookTimeMinutes;
  final int servings;
  final String difficulty;
  final String cuisine;
  final int caloriesPerServing;
  final List<String> tags;
  final int userId;
  final String image;
  final double rating;
  final int reviewCount;
  final List<String> mealType;

  Recipe({
    required this.id,
    required this.name,
    required this.ingredients,
    required this.instructions,
    required this.prepTimeMinutes,
    required this.cookTimeMinutes,
    required this.servings,
    required this.difficulty,
    required this.cuisine,
    required this.caloriesPerServing,
    required this.tags,
    required this.userId,
    required this.image,
    required this.rating,
    required this.reviewCount,
    required this.mealType,
  });

  factory Recipe.fromJson(Map<String, dynamic> data) {
    return Recipe(
      id: data['id'] ?? 0,
      name: data['name'] ?? "No Name",
      ingredients:
          List<String>.from(data['ingredients'] ?? []), // Default to empty list
      instructions: List<String>.from(
          data['instructions'] ?? []), // Default to empty list
      prepTimeMinutes: data['prepTimeMinutes'] ?? 0,
      cookTimeMinutes: data['cookTimeMinutes'] ?? 0,
      servings: data['servings'] ?? 0,
      difficulty: data['difficulty'] ?? "No Data",
      cuisine: data['cuisine'] ?? "No Data",
      caloriesPerServing:
          data['caloriesPerServing'] ?? 0, // Default to 0 for integers
      tags: List<String>.from(data['tags'] ?? []), // Default to empty list
      userId: data['userId'] ?? 0,
      image: data['image'] ?? "Image is Not Exist",
      rating: (data['rating'] is int)
          ? (data['rating'] as int).toDouble()
          : (data['rating'] ?? 0.0), // Ensure double
      reviewCount: data['reviewCount'] ?? 0, // Default to 0 for integers
      mealType:
          List<String>.from(data['mealType'] ?? []), // Default to empty list
    );
  }
}
