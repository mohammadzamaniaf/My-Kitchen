import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/provider/theme_provider.dart';

class ChangeThemeButton extends ConsumerStatefulWidget {
  const ChangeThemeButton({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ChangeThemeButtonState();
}

class _ChangeThemeButtonState extends ConsumerState<ChangeThemeButton> {
  late bool isChecked;

  @override
  void initState() {
    isChecked = ref.read(themeProvider.notifier).isDarkMode;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Switch.adaptive(
      value: isChecked,
      onChanged: (value) {
        isChecked = value;
        ref.read(themeProvider.notifier).toggleTheme(value);
        setState(() {});
      },
    );
  }
}
