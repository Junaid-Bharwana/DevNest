import 'package:devnest/app/devnest_app.dart';
import 'package:flutter/material.dart';

/// DevNest entry point.
///
/// Deliberately trivial: everything the app needs lives in [DevNestApp]. Future
/// start-up work (restoring settings, warming the native layer) belongs here.
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const DevNestApp());
}
