import 'package:flutter/material.dart';

import '/features/recipes/data/models/recipe.dart';
import '/features/recipes/presentation/widgets/recipe_list_tile.dart';

class RecipesList extends StatelessWidget {
  const RecipesList({
    super.key,
    required this.recipes,
  });

  final List<Recipe> recipes;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return RecipeListTile(
            recipe: recipes[index],
          );
        },
      ),
    );
  }
}
