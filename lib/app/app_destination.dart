import 'package:devnest/features/home/home_screen.dart';
import 'package:devnest/features/projects/projects_screen.dart';
import 'package:devnest/features/services/services_screen.dart';
import 'package:devnest/features/settings/settings_screen.dart';
import 'package:devnest/features/terminal/terminal_screen.dart';
import 'package:flutter/material.dart';

/// The five top-level destinations of the app shell, in bar order.
///
/// This enum is the whole navigation structure: [AppShell] renders one
/// [NavigationDestination] and one screen per value, so adding a screen means
/// adding a value here and nothing else.
enum AppDestination {
  home('Home', Icons.home_outlined, Icons.home),
  projects('Projects', Icons.folder_outlined, Icons.folder),
  services('Services', Icons.dns_outlined, Icons.dns),
  terminal('Terminal', Icons.terminal_outlined, Icons.terminal),
  settings('Settings', Icons.settings_outlined, Icons.settings);

  const AppDestination(this.label, this.icon, this.selectedIcon);

  /// Label shown under the destination icon.
  final String label;

  /// Icon shown when the destination is not selected.
  final IconData icon;

  /// Icon shown when the destination is selected.
  final IconData selectedIcon;

  /// The screen for this destination.
  ///
  /// Phase 1 returns placeholders; swapping one for the real screen is a
  /// one-line change here.
  Widget buildScreen() {
    switch (this) {
      case AppDestination.home:
        return const HomeScreen();
      case AppDestination.projects:
        return const ProjectsScreen();
      case AppDestination.services:
        return const ServicesScreen();
      case AppDestination.terminal:
        return const TerminalScreen();
      case AppDestination.settings:
        return const SettingsScreen();
    }
  }
}
