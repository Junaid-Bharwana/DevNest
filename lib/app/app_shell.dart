import 'package:devnest/app/app_destination.dart';
import 'package:devnest/core/constants/app_info.dart';
import 'package:flutter/material.dart';

/// The five-tab application shell.
///
/// The shell owns navigation only. Each tab renders its own screen inside an
/// [IndexedStack], so switching tabs keeps each screen's state (scroll position,
/// future terminal buffer) alive.
class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    const List<AppDestination> destinations = AppDestination.values;
    return Scaffold(
      appBar: AppBar(title: const Text(AppInfo.name)),
      body: SafeArea(
        child: IndexedStack(
          index: _selectedIndex,
          children: <Widget>[
            for (final AppDestination destination in destinations)
              destination.buildScreen(),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: <Widget>[
          for (final AppDestination destination in destinations)
            NavigationDestination(
              icon: Icon(destination.icon),
              selectedIcon: Icon(destination.selectedIcon),
              label: destination.label,
            ),
        ],
      ),
    );
  }
}
