import '/core/constants/categories.dart';

class CategoryWrapItem {
  final String category;
  final FoodCategory enumCategory;
  bool isSelected;

  CategoryWrapItem({
    required this.category,
    required this.enumCategory,
    this.isSelected = false,
  });

  @override
  String toString() {
    return 'category: $category';
  }
}
