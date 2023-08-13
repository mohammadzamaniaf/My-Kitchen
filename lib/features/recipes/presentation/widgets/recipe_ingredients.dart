import 'package:flutter/material.dart';

import '../../data/models/recipe.dart';

class RecipeIngredients extends StatelessWidget {
  const RecipeIngredients({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 7,
        borderOnForeground: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: recipe.ingredients.map(
              (ingradient) {
                return SizedBox(
                  width: double.infinity,
                  child: SelectableText(ingradient),
                );
              },
            ).toList(),
          ),
        ),
      ),
    );
  }
}
