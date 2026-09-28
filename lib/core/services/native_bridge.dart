import 'package:flutter/services.dart';

/// Channel names and the seam the Kotlin native layer will plug into.
///
/// Phase 1 has no native code yet: a later task adds a foreground service and
/// process manager on the Kotlin side and binds it here. The names are declared
/// now so both sides agree on them from the start, and so the launch layer can
/// be replaced (for example if executing from the native-library directory stops
/// working on a future Android release) without touching the UI.
class NativeBridge {
  const NativeBridge._();

  /// Method channel for commands such as starting and stopping a service.
  static const String commandChannel = 'devnest/native/commands';

  /// Event channel that streams process log lines to the UI.
  static const String logEventChannel = 'devnest/native/logs';

  /// The directory name bundled runtimes are extracted to. On a device this is
  /// `context.applicationInfo.nativeLibraryDir`, which is why the manifest sets
  /// `android:extractNativeLibs="true"`.
  static const String nativeLibraryDirectoryHint = 'nativeLibraryDir';
}
