import 'package:flutter/material.dart';

import '../../data/models/recipe.dart';

class RecipeSteps extends StatelessWidget {
  const RecipeSteps({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: recipe.steps.length,
      itemBuilder: (context, index) {
        final step = recipe.steps[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Theme.of(context).iconTheme.color,
            child: Text('${index + 1}'),
          ),
          title: Text(step),
        );
      },
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
    );
  }
}
