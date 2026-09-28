package com.devnest.app

import io.flutter.embedding.android.FlutterActivity

/**
 * The single activity that hosts the Flutter UI.
 *
 * The Kotlin foreground service and process manager that own the bundled
 * runtimes will attach to this activity over the platform channels declared in
 * `lib/core/services/native_bridge.dart`. Until then this is the stock Flutter
 * activity.
 */
class MainActivity : FlutterActivity()
