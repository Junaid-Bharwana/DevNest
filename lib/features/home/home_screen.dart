import 'package:devnest/core/constants/app_info.dart';
import 'package:flutter/material.dart';

/// Home tab: the branded landing surface.
///
/// Phase 1 shows the brand and what this build actually does. The dashboard
/// from the plan (service cards with Running / Stopped / Starting / Error, CPU /
/// RAM / storage readouts, START ALL / STOP ALL / RESTART ALL) replaces the
/// "what works today" card below without touching the shell.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 32),
      children: <Widget>[
        Icon(
          Icons.terminal,
          size: 56,
          color: theme.colorScheme.primary,
        ),
        const SizedBox(height: 16),
        Text(
          AppInfo.name,
          style: theme.textTheme.displaySmall?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          AppInfo.tagline,
          style: theme.textTheme.titleMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 20),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: <Widget>[
            Chip(label: Text('v${AppInfo.version}')),
            const Chip(label: Text('Android 10+')),
            const Chip(label: Text('arm64-v8a')),
          ],
        ),
        const SizedBox(height: 24),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('What this build is', style: theme.textTheme.titleMedium),
                const SizedBox(height: 8),
                Text(
                  'A Phase 1 skeleton: a Material 3 shell with five tabs, '
                  'light and dark themes, and an installable debug APK produced '
                  'by CI. The dashboard and the native process pipeline follow '
                  'in the next tasks.',
                  style: theme.textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Planned next', style: theme.textTheme.titleMedium),
                const SizedBox(height: 8),
                Text(
                  'A Kotlin foreground service starts a bundled runtime and '
                  'serves a project at ${AppInfo.localOrigin}.',
                  style: theme.textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
