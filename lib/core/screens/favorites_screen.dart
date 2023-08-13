import 'package:flutter/material.dart';

import '/core/constants/dummy_data.dart';
import '/core/widgets/recipes_list.dart';
import '/features/recipes/data/models/recipe.dart';
import '/features/recipes/presentation/widgets/recipe_category_appbar.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  static const routeName = '/favorites';

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  List<Recipe> favorites = [];

  @override
  void initState() {
    super.initState();
    favorites = recipes.where((recipe) => recipe.isFavorite == true).toList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
        child: Column(
          children: [
            //! Favorites screen appBar
            const FavoritesScreenAppBar(),
            const SizedBox(height: 10),
            //! Favorites recipes list
            RecipesList(recipes: favorites),
          ],
        ),
      ),
    );
  }
}

class FavoritesScreenAppBar extends StatelessWidget {
  const FavoritesScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: CategoryAppBarWidget(
        title: 'غذا های مورد علاقه',
        onPressed: Scaffold.of(context).openDrawer,
      ),
    );
  }
}
