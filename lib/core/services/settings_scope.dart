import 'package:devnest/core/services/settings_service.dart';
import 'package:flutter/widgets.dart';

/// Makes the single [SettingsService] available to the widget tree.
///
/// Screens read it with `SettingsScope.of(context)`. Using an inherited widget
/// instead of a global keeps the settings testable and lets a later task swap
/// in a persisted implementation without changing any screen.
class SettingsScope extends InheritedNotifier<SettingsService> {
  const SettingsScope({
    required SettingsService settings,
    required super.child,
    super.key,
  }) : super(notifier: settings);

  /// The settings for this tree.
  ///
  /// Throws a [FlutterError] rather than returning null: a missing scope is a
  /// programming error, and failing loudly keeps it out of release builds.
  static SettingsService of(BuildContext context) {
    final SettingsScope? scope =
        context.dependOnInheritedWidgetOfExactType<SettingsScope>();
    if (scope == null) {
      throw FlutterError(
        'SettingsScope.of() was called with a context that does not contain a '
        'SettingsScope. Wrap the widget tree in a SettingsScope (see '
        'lib/app/devnest_app.dart).',
      );
    }
    return scope.notifier!;
  }
}
