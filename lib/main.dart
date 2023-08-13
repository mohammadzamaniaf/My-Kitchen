import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/app/router/app_router.dart';
import '/core/constants/dummy_data.dart';
import '/core/screens/bottom_navigation_bar_screen.dart';
import '/provider/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();

  final ids = prefs.getStringList('favorite_recipes_ids') ?? [];
  // log('main: ${ids.toString()}');

  for (var recipe in recipes) {
    if (ids.contains(recipe.imageUrl)) {
      recipe.isFavorite = true;
    }
  }

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: themeMode,
      theme: MyThemes.lightTheme,
      darkTheme: MyThemes.darkTheme,
      home: const BottomNavigationBarScreen(),
      onGenerateRoute: onGenerateRoute,
    );
  }
}
