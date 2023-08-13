import 'package:flutter/material.dart';

import '/core/widgets/ios_back_button.dart';

class RecipeImageScreen extends StatelessWidget {
  const RecipeImageScreen({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  static const routeName = '/recipe-image';

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: const IosBackButton(),
        ),
        body: Center(
          child: Image.asset(
            'assets/images/$imageUrl.webp',
          ),
        ),
      ),
    );
  }
}
