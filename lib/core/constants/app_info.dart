/// Product facts that are true for every build.
///
/// Kept in one place so no widget hard-codes the product name, the tagline or
/// the version. [version] is mirrored from `pubspec.yaml`; reading it at runtime
/// would mean adding a package, which is not worth a dependency this early.
class AppInfo {
  const AppInfo._();

  /// Product name.
  static const String name = 'DevNest';

  /// Product tagline.
  static const String tagline = 'Your Development Server in Your Pocket';

  /// Semantic version, mirroring the `version` field in `pubspec.yaml`.
  static const String version = '0.1.0';

  /// Android application id (`android/app/build.gradle.kts`).
  static const String applicationId = 'com.devnest.app';

  /// The origin the first bundled process will serve project files on.
  static const String localOrigin = 'http://localhost:8080';
}
