import 'package:flutter/material.dart';

import '/features/recipes/data/models/recipe.dart';
import '/features/recipes/presentation/widgets/recipe_list_tile.dart';

class FilterResultWidget extends StatelessWidget {
  const FilterResultWidget({
    Key? key,
    required this.selectedRecipes,
    required this.onPressed,
  }) : super(key: key);

  final List<Recipe> selectedRecipes;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: selectedRecipes.length,
            itemBuilder: (context, index) {
              final item = selectedRecipes[index];
              return RecipeListTile(
                recipe: item,
              );
            },
          ),
        ),
        ElevatedButton(
          onPressed: onPressed,
          child: const Text(
            'بازگشت به صفحه قبل',
          ),
        ),
      ],
    );
  }
}
