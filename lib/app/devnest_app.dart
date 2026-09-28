import 'package:devnest/app/app_shell.dart';
import 'package:devnest/core/constants/app_info.dart';
import 'package:devnest/core/services/settings_scope.dart';
import 'package:devnest/core/services/settings_service.dart';
import 'package:devnest/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

/// Root widget: owns the settings and builds the [MaterialApp].
///
/// The theme is chosen from [SettingsService.themeMode], which defaults to
/// [ThemeMode.system], so a fresh install follows the device setting and the
/// Settings tab can override it live.
class DevNestApp extends StatefulWidget {
  const DevNestApp({super.key});

  @override
  State<DevNestApp> createState() => _DevNestAppState();
}

class _DevNestAppState extends State<DevNestApp> {
  final SettingsService _settings = SettingsService();

  @override
  void dispose() {
    _settings.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SettingsScope(
      settings: _settings,
      child: AnimatedBuilder(
        animation: _settings,
        builder: (BuildContext context, Widget? child) {
          return MaterialApp(
            title: AppInfo.name,
            debugShowCheckedModeBanner: false,
            theme: AppTheme.light(),
            darkTheme: AppTheme.dark(),
            themeMode: _settings.themeMode,
            home: const AppShell(),
          );
        },
      ),
    );
  }
}
