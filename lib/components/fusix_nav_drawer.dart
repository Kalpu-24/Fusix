import 'package:dice_icons/dice_icons.dart';
import 'package:flutter/material.dart';

Widget fusixNavDrawer(
    {required int selectedIndex,
    required Color backgroundColor,
    required Function(int) onDestinationSelected,
    required Function() onMenuPressed}) {
  return NavigationDrawer(
    selectedIndex: selectedIndex,
    onDestinationSelected: onDestinationSelected,
    backgroundColor: backgroundColor,
    children: [
      Padding(
        padding: EdgeInsets.all(20.0),
        child: Row(
          children: [
            IconButton(
                onPressed: () {
                  onMenuPressed();
                },
                icon: Icon(Icons.menu_open_rounded)),
            Icon(Icons.music_note_outlined),
            SizedBox(width: 8),
            Text('Fusix'),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: FloatingActionButton.extended(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100.0),
            ),
            icon: Icon(DiceIcons.dice5),
            onPressed: () {},
            label: Text('Random')),
      ),
      const Divider(),
      NavigationDrawerDestination(
        icon: Icon(Icons.home_outlined),
        selectedIcon: Icon(Icons.home),
        label: Text('Home'),
      ),
      NavigationDrawerDestination(
        icon: Icon(Icons.library_music_outlined),
        selectedIcon: Icon(Icons.library_music),
        label: Text('Library'),
      ),
      NavigationDrawerDestination(
        icon: Icon(Icons.settings_outlined),
        selectedIcon: Icon(Icons.settings),
        label: Text('Settings'),
      ),
    ],
  );
}
