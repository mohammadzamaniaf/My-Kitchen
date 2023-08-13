import 'package:flutter/material.dart';

class IosBackButton extends StatelessWidget {
  const IosBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: Navigator.of(context).pop,
      icon: Icon(
        Icons.arrow_forward_ios,
        color: Theme.of(context).iconTheme.color,
      ),
    );
  }
}
