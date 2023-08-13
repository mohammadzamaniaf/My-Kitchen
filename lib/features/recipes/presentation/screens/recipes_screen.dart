import 'package:flutter/material.dart';

import '/core/constants/categories.dart';
import '/core/constants/dummy_data.dart';
import '/core/utils/utils.dart';
import '/core/widgets/ios_back_button.dart';
import '/core/widgets/recipes_list.dart';
import '/features/recipes/data/models/recipe.dart';

class RecipesScreen extends StatefulWidget {
  const RecipesScreen({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  static const routeName = '/recipes';

  final String imageUrl;

  @override
  State<RecipesScreen> createState() => _RecipesScreenState();
}

class _RecipesScreenState extends State<RecipesScreen> {
  List<Recipe> myRecipes = [];
  late FoodCategory category;

  initRecipes() {
    myRecipes = recipes
        .where((recipe) => recipe.categories.contains(category))
        .toList();
  }

  @override
  void initState() {
    super.initState();
    category = findCategory(widget.imageUrl);
    if (myRecipes.isEmpty) {
      initRecipes();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    //! Back button
                    const IosBackButton(),
                    const Text(
                      'دستور پخت ها',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_vert),
                    ),
                  ],
                ),
                //! Recipes List
                RecipesList(recipes: myRecipes),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
