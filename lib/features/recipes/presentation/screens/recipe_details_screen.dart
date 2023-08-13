import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import '/core/widgets/ios_back_button.dart';
import '/features/recipes/data/models/recipe.dart';
import '/features/recipes/presentation/screens/recipe_image_screen.dart';
import '/features/recipes/presentation/widgets/recipe_info_widget.dart';
import '/features/recipes/presentation/widgets/recipe_ingredients.dart';
import '/features/recipes/presentation/widgets/recipe_steps.dart';

class RecipeDetailsScreen extends StatefulWidget {
  const RecipeDetailsScreen({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  static const routeName = '/recipe-detail';

  final Recipe recipe;

  @override
  State<RecipeDetailsScreen> createState() => _RecipeDetailsScreenState();
}

class _RecipeDetailsScreenState extends State<RecipeDetailsScreen> {
  late final Recipe _recipe;

  @override
  void initState() {
    _recipe = widget.recipe;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            //! Sliver App Bar
            _buildSliverAppBar(),
            //! Body
            SliverToBoxAdapter(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 10),
                  //! Recipe Info
                  RecipeInfoWidget(
                    recipe: _recipe,
                  ),
                  //! Recipe Name
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        _recipe.name,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                  //! Recipe How to make label
                  const Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        'مواد لازم',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Divider(color: Theme.of(context).iconTheme.color),
                  //! Ingradients
                  RecipeIngredients(
                    recipe: _recipe,
                  ),
                  const SizedBox(height: 20),
                  //! How to make
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        'طرز تهیه',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Divider(color: Theme.of(context).iconTheme.color),
                  //! Steps
                  RecipeSteps(
                    recipe: _recipe,
                  ),
                  //! Share button
                  IconButton(
                    onPressed: () {
                      Share.share(_recipe.toStringNew());
                    },
                    icon: const Icon(Icons.share),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSliverAppBar() => SliverAppBar(
        shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
          ),
        ),
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.only(right: 20),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: IosBackButton(),
          ),
        ),
        pinned: true,
        title: Text(
          _recipe.name,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
          ),
        ),
        expandedHeight: MediaQuery.of(context).size.height * 0.4,
        flexibleSpace: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          child: FlexibleSpaceBar(
            background: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(
                  RecipeImageScreen.routeName,
                  arguments: _recipe.imageUrl,
                );
              },
              child: Image.asset(
                'assets/images/${_recipe.imageUrl}.webp',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      );
}
