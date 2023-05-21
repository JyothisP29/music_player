import 'package:audio/helpers/screen_navigator.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Screens.selectedIndexNotifier,
      builder: (BuildContext ctx, int updated, Widget? _) {
        return Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15),
          child: Container(
            margin: const EdgeInsets.only(bottom: 30),
            decoration: const BoxDecoration(),
            height: 48,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(18)),
              child: BottomNavigationBar(
                selectedLabelStyle:
                    const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                backgroundColor: Colors.grey.withOpacity(.5),
                selectedItemColor: Colors.white,
                currentIndex: updated,
                onTap: (newIndex) {
                  Screens.selectedIndexNotifier.value = newIndex;
                },
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home_outlined,
                      size: 25,
                    ),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.search,
                      size: 25,
                    ),
                    label: 'Search',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.settings_outlined,
                      size: 25,
                    ),
                    label: 'Settings',
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
