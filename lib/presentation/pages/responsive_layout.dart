// presentation/pages/responsive_layout.dart
import 'package:flutter/material.dart';
import 'package:fusix/common/widgets/fusix_nav_bar.dart';
import 'package:fusix/common/widgets/fusix_nav_drawer.dart';
import 'package:fusix/common/widgets/fusix_nav_rail.dart';

class ResponsiveLayout extends StatefulWidget {
  const ResponsiveLayout({super.key});

  @override
  ResponsiveLayoutState createState() => ResponsiveLayoutState();
}

class ResponsiveLayoutState extends State<ResponsiveLayout> {
  int selectedIndex = 0;
  bool isExtended = false;

  final List<Widget> _pages = [
    const Center(child: Text('Home Page')),
    const Center(child: Text('Library')),
    const Center(child: Text('Settings')),
  ];

  @override
  Widget build(BuildContext context) {
    bool isWideScreen = MediaQuery.of(context).size.width > 800;

    return Scaffold(
      body: Row(
        children: [
          if (isWideScreen)
            isExtended
                ? fusixNavDrawer(
                    selectedIndex: selectedIndex,
                    backgroundColor:
                        Theme.of(context).colorScheme.surfaceContainer,
                    onDestinationSelected: (int index) {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    onMenuPressed: () {
                      setState(() {
                        isExtended = !isExtended;
                      });
                    },
                  )
                : fusixNavRail(
                    selectedIndex: selectedIndex,
                    backgroundColor:
                        Theme.of(context).colorScheme.surfaceContainer,
                    isExtended: isExtended,
                    onDestinationSelected: (int index) {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    onMenuPressed: () {
                      setState(() {
                        isExtended = !isExtended;
                      });
                    },
                  ),
          Expanded(child: _pages[selectedIndex]),
        ],
      ),
      bottomNavigationBar: isWideScreen
          ? null
          : fusixNavBar(
              selectedIndex: selectedIndex,
              backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
              onDestinationSelected: (int index) {
                setState(() {
                  selectedIndex = index;
                });
              },
            ),
    );
  }
}
