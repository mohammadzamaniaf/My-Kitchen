import '/core/constants/categories.dart';
import '/core/constants/difficulty.dart';

class Recipe {
  String name;
  Duration? duration;
  String? amount;
  List<String> ingredients;
  List<String> steps;
  List<FoodCategory> categories;
  String imageUrl;
  bool isFavorite;
  Difficulty difficulty;
  bool isHealhty;

  Recipe({
    required this.name,
    this.duration,
    this.amount,
    required this.ingredients,
    required this.steps,
    required this.categories,
    required this.imageUrl,
    this.isFavorite = false,
    required this.difficulty,
    this.isHealhty = true,
  });

  String toStringNew() {
    final recipeIngredients = ingredients.map((ingredient) => '$ingredient\n');
    final recipeSteps = steps;
    final recipeCategories = [];

    for (int i = 0; i < steps.length; i++) {
      recipeSteps[i] = '$i--${recipeSteps[i]}\n';
    }

    if (categories.contains(FoodCategory.food)) {
      recipeCategories.add('غذا');
    } else if (categories.contains(FoodCategory.drink)) {
      recipeCategories.add('نوشیدنی');
    } else if (categories.contains(FoodCategory.fastfood)) {
      recipeCategories.add('فست فود');
    } else if (categories.contains(FoodCategory.pastry)) {
      recipeCategories.add('شیرینی');
    } else if (categories.contains(FoodCategory.vegetables)) {
      recipeCategories.add('سبزیجات');
    } else if (categories.contains(FoodCategory.cake)) {
      recipeCategories.add('کیک');
    }

    return '$name\n\n$recipeIngredients\n\n$recipeSteps\n\n$recipeCategories\n';
  }
}
