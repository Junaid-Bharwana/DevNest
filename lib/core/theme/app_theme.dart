import 'package:flutter/material.dart';

/// The DevNest theme, in light and dark.
///
/// Both themes are generated from one seed colour, so widgets can rely on
/// `Theme.of(context).colorScheme` and never hard-code a colour. Anything that
/// is not themed by default (for example a future code/log viewer) belongs here
/// rather than in a widget.
class AppTheme {
  const AppTheme._();

  /// Seed for the DevNest palette: a developer-tool teal.
  static const Color _seedColor = Color(0xFF00695C);

  /// Theme used when the device (or the user's setting) asks for light mode.
  static ThemeData light() => _build(Brightness.light);

  /// Theme used when the device (or the user's setting) asks for dark mode.
  static ThemeData dark() => _build(Brightness.dark);

  static ThemeData _build(Brightness brightness) {
    final ColorScheme colorScheme = ColorScheme.fromSeed(
      seedColor: _seedColor,
      brightness: brightness,
    );
    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
    );
  }
}
