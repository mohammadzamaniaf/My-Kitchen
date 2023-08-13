import 'package:flutter/material.dart';

import '/core/constants/dummy_data.dart';
import '/core/constants/styles.dart';
import '/core/widgets/recipes_list.dart';
import '/features/recipes/data/models/recipe.dart';
import '/features/recipes/presentation/widgets/recipe_categories_list.dart';
import '/features/recipes/presentation/widgets/recipe_category_appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final TextEditingController _controller;

  List<Recipe> myRecipes = recipes;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    bool isNotSearching = _controller.text.isEmpty;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          children: [
            const SizedBox(height: 10),
            CategoryAppBarWidget(
              title: 'کتگوری های غذا',
              onPressed: Scaffold.of(context).openDrawer,
            ),
            const SizedBox(height: 10),
            TextField(
              autofocus: false,
              controller: _controller,
              decoration: InputDecoration(
                fillColor: Theme.of(context).primaryColor,
                filled: true,
                hintText: 'اسم غذای مورد نظر را بنویسید',
                border: searchFieldBorderStyle,
                focusedBorder: searchFieldFocusedBorderStyle,
                enabledBorder: searchFieldBorderStyle,
                prefixIcon: const Icon(Icons.search),
                contentPadding: const EdgeInsets.only(
                  right: 10,
                  left: 0,
                  top: 0,
                  bottom: 0,
                ),
              ),
              onChanged: (value) {
                searchRecipes(value);
              },
            ),
            const SizedBox(height: 10),
            isNotSearching
                ? const RecipeCategoriesList()
                : WillPopScope(
                    onWillPop: () {
                      setState(() {
                        _controller.text = '';
                      });
                      return Future.value(false);
                    },
                    child: RecipesList(
                      recipes: myRecipes,
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  void searchRecipes(String query) {
    List<Recipe> suggestions = recipes.where((recipe) {
      final title = recipe.name;
      return title.contains(query);
    }).toList();

    setState(() => myRecipes = suggestions);
  }
}
