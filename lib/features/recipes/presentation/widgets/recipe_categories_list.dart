import 'package:flutter/material.dart';

import '/core/constants/dummy_data.dart';
import '/core/models/category.dart';
import '/features/recipes/presentation/screens/recipes_screen.dart';
import '/features/recipes/presentation/widgets/recipe_category_widget.dart';

class RecipeCategoriesList extends StatelessWidget {
  const RecipeCategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index] as Category;
          return RecipeCategoryWidget(
            categoryImageUrl: category.imageUrl,
            categoryTitle: category.category,
            onPressed: () {
              Navigator.of(context).pushNamed(
                RecipesScreen.routeName,
                arguments: category.imageUrl,
              );
            },
          );
        },
      ),
    );
  }
}
