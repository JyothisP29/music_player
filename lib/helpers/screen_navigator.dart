import 'package:flutter/material.dart';

import '../elements/bottom_navigation.dart';
import '../screens/home_screen.dart';
import '../screens/search_screen.dart';

class Screens extends StatelessWidget {
  Screens({Key? key}) : super(key: key);
  static ValueNotifier<int> selectedIndexNotifier = ValueNotifier(0);
  final _pages = [
    const HomeScreen(),
    const SearchScreen(),
    const SearchScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      bottomNavigationBar: Container(
          height: 90,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18),
              topRight: Radius.circular(18),
            ),
          ),
          child: const BottomNav()),
      body: SafeArea(
        child: ValueListenableBuilder(
            valueListenable: selectedIndexNotifier,
            builder: (BuildContext context, int updated, _) {
              return _pages[updated];
            }),
      ),
    );
  }
}
