import 'package:flutter/material.dart';

/// The shared "not built in this phase" body.
///
/// Every placeholder screen uses it so the shell reads as deliberate rather
/// than unfinished, and so replacing one screen with the real implementation is
/// a single-file change. The body scrolls, which keeps it safe on small phones
/// and with large font scales.
class PhasePlaceholder extends StatelessWidget {
  const PhasePlaceholder({
    required this.icon,
    required this.title,
    required this.description,
    this.bullets = const <String>[],
    super.key,
  });

  /// Icon shown above the title.
  final IconData icon;

  /// Screen heading.
  final String title;

  /// One or two sentences explaining what this tab will do.
  final String description;

  /// Optional list of the concrete things planned for this tab.
  final List<String> bullets;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 32),
      children: <Widget>[
        Icon(icon, size: 48, color: theme.colorScheme.primary),
        const SizedBox(height: 16),
        Text(title, style: theme.textTheme.headlineSmall),
        const SizedBox(height: 8),
        Text(
          description,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        if (bullets.isNotEmpty) ...<Widget>[
          const SizedBox(height: 24),
          for (final String bullet in bullets)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    Icons.chevron_right,
                    size: 20,
                    color: theme.colorScheme.primary,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(bullet, style: theme.textTheme.bodyMedium),
                  ),
                ],
              ),
            ),
        ],
      ],
    );
  }
}
