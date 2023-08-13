import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/core/constants/difficulty.dart';
import '/features/recipes/data/models/recipe.dart';

class RecipeInfoWidget extends StatefulWidget {
  const RecipeInfoWidget({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  final Recipe recipe;

  @override
  State<RecipeInfoWidget> createState() => _RecipeInfoWidgetState();
}

class _RecipeInfoWidgetState extends State<RecipeInfoWidget> {
  String difficulty = '';

  @override
  void initState() {
    if (widget.recipe.difficulty == Difficulty.easy) {
      difficulty = 'آسان';
    } else if (widget.recipe.difficulty == Difficulty.medium) {
      difficulty = 'متوسط';
    } else if (widget.recipe.difficulty == Difficulty.difficult) {
      difficulty = 'سخت';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        if (widget.recipe.amount == null && widget.recipe.duration == null)
          Expanded(
            child: Column(
              children: [
                const Icon(Icons.signal_cellular_alt),
                Text(difficulty),
              ],
            ),
          )
        else
          const SizedBox.shrink(),
        widget.recipe.amount != null
            ? Expanded(
                child: Column(
                  children: [
                    const Icon(Icons.people),
                    Text(widget.recipe.amount!)
                  ],
                ),
              )
            : const SizedBox.shrink(),
        widget.recipe.duration != null
            ? Expanded(
                child: Column(
                  children: [
                    const Icon(Icons.timer_sharp),
                    Text(
                      widget.recipe.duration.toString().substring(0, 7),
                    )
                  ],
                ),
              )
            : const SizedBox.shrink(),
        Expanded(
          child: IconButton(
            icon: Icon(
              widget.recipe.isFavorite == true
                  ? Icons.favorite
                  : Icons.favorite_outline,
              color: Colors.red,
            ),
            onPressed: () => changeFavorite(widget.recipe),
          ),
        ),
      ],
    );
  }

  Future<void> changeFavorite(Recipe recipe) async {
    final prefs = await SharedPreferences.getInstance();
    final favs = prefs.getStringList('favorite_recipes_ids') ?? [];
    setState(
      () {
        recipe.isFavorite = !recipe.isFavorite;
        if (recipe.isFavorite) {
          favs.add(recipe.imageUrl);
          prefs.setStringList('favorite_recipes_ids', favs);
        } else {
          favs.removeWhere((id) => id == recipe.imageUrl);
          prefs.setStringList('favorite_recipes_ids', favs);
        }
      },
    );
  }
}
