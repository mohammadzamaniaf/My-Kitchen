import 'package:flutter/material.dart';

import '/core/screens/about_us_screen.dart';
import '/core/screens/bottom_navigation_bar_screen.dart';
import '/core/screens/error_screen.dart';
import '/core/screens/favorites_screen.dart';
import '/features/recipes/data/models/recipe.dart';
import '/features/recipes/presentation/screens/recipe_details_screen.dart';
import '/features/recipes/presentation/screens/recipe_image_screen.dart';
import '/features/recipes/presentation/screens/recipes_screen.dart';
import '/features/search_recipe/presentation/screens/filter_screen.dart';
import '/features/settings/screens/settings_screen.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SettingsScreen.routeName:
      return const SettingsScreen().getRoute();
    case RecipesScreen.routeName:
      final imageUrl = settings.arguments as String;
      return RecipesScreen(
        imageUrl: imageUrl,
      ).getRoute();
    case FavoritesScreen.routeName:
      return const FavoritesScreen().getRoute();
    case AboutUsScreen.routeName:
      return const AboutUsScreen().getRoute();
    case BottomNavigationBarScreen.routeName:
      return const BottomNavigationBarScreen().getRoute();
    case FilterScreen.routeName:
      return const FilterScreen().getRoute();
    case RecipeDetailsScreen.routeName:
      final recipe = settings.arguments as Recipe;
      return RecipeDetailsScreen(
        recipe: recipe,
      ).getRoute();
    case RecipeImageScreen.routeName:
      final imageUrl = settings.arguments as String;
      return RecipeImageScreen(
        imageUrl: imageUrl,
      ).getRoute();
    default:
      return const ErrorScreen(
        error: 'The page you entered does not exist.',
      ).getRoute();
  }
}

extension GetRoute on Widget {
  MaterialPageRoute getRoute() {
    return MaterialPageRoute(builder: (_) => this);
  }
}
