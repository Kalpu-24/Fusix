import 'package:dice_icons/dice_icons.dart';
import 'package:flutter/material.dart';

Widget fusixNavRail(
    {required int selectedIndex,
    required Color backgroundColor,
    required bool isExtended,
    required Function(int) onDestinationSelected,
    required Function() onMenuPressed}) {
  return NavigationRail(
    selectedIndex: selectedIndex,
    onDestinationSelected: onDestinationSelected,
    extended: isExtended,
    leading: Column(
      children: [
        Icon(Icons.music_note_outlined),
        SizedBox(width: 8),
        Text('Fusix'),
        SizedBox(height: 16),
        IconButton(
            onPressed: () {
              onMenuPressed();
            },
            icon: Icon(Icons.menu_rounded)),
        SizedBox(height: 8),
        FloatingActionButton(onPressed: () {}, child: Icon(DiceIcons.dice5)),
      ],
    ),
    labelType: NavigationRailLabelType.all,
    backgroundColor: backgroundColor,
    destinations: const [
      NavigationRailDestination(
        icon: Icon(Icons.home_outlined),
        selectedIcon: Icon(Icons.home),
        label: Text('Home'),
      ),
      NavigationRailDestination(
        icon: Icon(Icons.library_music_outlined),
        selectedIcon: Icon(Icons.library_music),
        label: Text('Library'),
      ),
      NavigationRailDestination(
        icon: Icon(Icons.settings_outlined),
        selectedIcon: Icon(Icons.settings),
        label: Text('Settings'),
      ),
    ],
  );
}
