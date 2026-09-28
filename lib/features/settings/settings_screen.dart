import 'package:devnest/core/constants/app_info.dart';
import 'package:devnest/core/services/settings_scope.dart';
import 'package:devnest/core/services/settings_service.dart';
import 'package:flutter/material.dart';

/// Settings tab.
///
/// The only real setting in Phase 1 is the theme mode, which is what proves the
/// theming is driven by a setting rather than hard-coded. It is not persisted
/// yet: see [SettingsService].
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final SettingsService settings = SettingsScope.of(context);
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 32),
      children: <Widget>[
        Text('Appearance', style: theme.textTheme.titleMedium),
        const SizedBox(height: 4),
        Text(
          'Defaults to following the device setting.',
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        for (final ThemeMode mode in ThemeMode.values)
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Icon(_iconFor(mode)),
            title: Text(_labelFor(mode)),
            trailing: settings.themeMode == mode
                ? Icon(Icons.check, color: theme.colorScheme.primary)
                : null,
            onTap: () {
              settings.themeMode = mode;
            },
          ),
        const Divider(height: 32),
        Text('About', style: theme.textTheme.titleMedium),
        const SizedBox(height: 8),
        const ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Icon(Icons.info_outline),
          title: Text('Version'),
          subtitle: Text(AppInfo.version),
        ),
        const ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Icon(Icons.tag),
          title: Text('Application id'),
          subtitle: Text(AppInfo.applicationId),
        ),
        const ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Icon(Icons.language),
          title: Text('Local origin'),
          subtitle: Text(AppInfo.localOrigin),
        ),
      ],
    );
  }

  static String _labelFor(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.system:
        return 'Match system';
      case ThemeMode.light:
        return 'Light';
      case ThemeMode.dark:
        return 'Dark';
    }
  }

  static IconData _iconFor(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.system:
        return Icons.brightness_auto;
      case ThemeMode.light:
        return Icons.light_mode;
      case ThemeMode.dark:
        return Icons.dark_mode;
    }
  }
}
