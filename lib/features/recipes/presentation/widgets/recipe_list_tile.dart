import 'package:flutter/material.dart';

import '/features/recipes/presentation/screens/recipe_details_screen.dart';
import '/features/recipes/data/models/recipe.dart';

class RecipeListTile extends StatelessWidget {
  const RecipeListTile({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(5),
        color: Theme.of(context).primaryColor,
      ),
      child: ListTile(
        onTap: () {
          Navigator.of(context).pushNamed(
            RecipeDetailsScreen.routeName,
            arguments: recipe,
          );
        },
        leading: SizedBox(
          width: 90,
          child: Image.asset(
            'assets/images/${recipe.imageUrl}.webp',
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          recipe.name,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
        subtitle: (recipe.amount == null && recipe.duration == null)
            ? Text(
                recipe.ingredients.toString(),
                overflow: TextOverflow.ellipsis,
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  recipe.duration != null
                      ? Text(
                          recipe.duration.toString().substring(0, 7),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : const SizedBox.shrink(),
                  recipe.amount != null
                      ? Text(recipe.amount!)
                      : const SizedBox.shrink(),
                ],
              ),
      ),
    );
  }
}
