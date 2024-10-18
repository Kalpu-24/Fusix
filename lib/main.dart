import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fusix/common/widgets/fusix_nav_bar.dart';
import 'package:fusix/common/widgets/fusix_nav_drawer.dart';
import 'package:fusix/common/widgets/fusix_nav_rail.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );
  runApp(FusixApp());
}

class FusixApp extends StatelessWidget {
  const FusixApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690), // Base design size
      minTextAdapt: true, // Responsive text adaptation
      builder: (context, child) {
        return DynamicColorBuilder(
          builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
            ColorScheme? lightScheme;
            ColorScheme? darkScheme;

            if (!kIsWeb) {
              lightScheme = lightDynamic;
              darkScheme = darkDynamic;
            } else {
              lightScheme = ColorScheme.fromSeed(seedColor: Colors.blue);
              darkScheme = ColorScheme.fromSeed(
                seedColor: Colors.blue,
                brightness: Brightness.dark,
              );
            }

            return MaterialApp(
              theme: ThemeData(colorScheme: lightScheme, useMaterial3: true),
              darkTheme: ThemeData(colorScheme: darkScheme, useMaterial3: true),
              themeMode: ThemeMode.system,
              home: const ResponsiveLayout(),
            );
          },
        );
      },
    );
  }
}

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
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Row(
        children: [
          if (isWideScreen) ...[
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
          ],
          Expanded(
            child: _pages[selectedIndex],
          ),
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
