import '/core/constants/categories.dart';

FoodCategory findCategory(String imageUrl) {
  switch (imageUrl) {
    case 'assets/images/food.jpg':
      return FoodCategory.food;
    case 'assets/images/pastry.jpg':
      return FoodCategory.pastry;
    case 'assets/images/cake.jpg':
      return FoodCategory.cake;
    case 'assets/images/vegetables.jpg':
      return FoodCategory.vegetables;
    case 'assets/images/drink.jpg':
      return FoodCategory.drink;
    case 'assets/images/fastfood.jpg':
      return FoodCategory.fastfood;
    default:
      return FoodCategory.food;
  }
}
