import 'package:flutter/material.dart';

import '/core/screens/favorites_screen.dart';
import '/core/widgets/main_drawer.dart';
import '/features/recipes/presentation/screens/home_screen.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({
    Key? key,
    this.index,
  }) : super(key: key);

  final int? index;

  static const routeName = '/bottom-navigation-bar';

  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  int currentIndex = 0;

  @override
  void initState() {
    currentIndex = widget.index ?? 0;
    super.initState();
  }

  final screensList = const [
    HomeScreen(),
    FavoritesScreen(),
  ];

  final _navBarItems = const [
    BottomNavigationBarItem(
      activeIcon: Icon(Icons.home, color: Colors.deepPurple),
      icon: Icon(Icons.home_outlined),
      label: 'خانه',
    ),
    BottomNavigationBarItem(
      activeIcon: Icon(Icons.favorite, color: Colors.red),
      icon: Icon(Icons.favorite_outline),
      label: 'مورد علاقه ها',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        drawer: const MainDrawer(),
        body: screensList[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: _navBarItems,
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() => currentIndex = index);
          },
        ),
      ),
    );
  }
}
