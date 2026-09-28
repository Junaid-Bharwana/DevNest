# DevNest

**Your Development Server in Your Pocket.**

DevNest is an Android app that turns a phone or tablet into a local web
development server — PHP, Nginx, MariaDB and Node.js running at `localhost`,
with no root required — wrapped in a modern Flutter (Material 3) interface over
a Kotlin native service layer that owns the actual runtimes.

This repository is at **Phase 1: the skeleton**. What exists today is the app
shell, the theming, the Android configuration and the CI pipeline that produces
an installable APK. The native runtimes are bundled and executed in a later
phase; nothing here downloads or runs server binaries yet.

> Development note: the machine this repository is written on has no Flutter,
> Java or Android SDK, and cannot produce binary Android files. The code is
> hand-written and reviewed here; **CI is where it is compiled**, and a change is
> only considered working once a CI run is green.

## Download the APK from CI

CI builds a debug APK on every push and pull request.

1. Open the repository's **Actions** tab and pick the latest green run of the
   **Android CI** workflow (running from `main`).
2. Under **Artifacts**, download **`devnest-debug-apk`**. Unzip it to get
   `app-debug.apk`.
3. Install it on an Android 10+ **arm64** device — over USB with
   `adb install -r app-debug.apk`, or by copying the file to the device and
   opening it (allow installing from unknown sources when prompted).

The artifact is a debug build signed with the debug key, so it can be sideloaded
but not published. A signed release build and any store submission are separate,
later steps.

## Run the app

Requires Flutter **3.47.5** (stable) and a JDK 17.

```bash
# 1. Materialise the generated Android platform files (Gradle wrapper, launcher
#    icons, launch theme). This is idempotent and never overwrites our files.
flutter create --platforms=android --org com.devnest --project-name devnest .

# 2. Drop the unused package that step derives from --org/--project-name.
rm -rf android/app/src/main/kotlin/com/devnest/devnest

# 3. Fetch dependencies, then run on a connected arm64 device.
flutter pub get
flutter run
```

`flutter analyze` and `flutter test` should both be clean; that is what CI runs.

## What is in this phase

- **App shell** — Material 3 `NavigationBar` with five destinations (Home,
  Projects, Services, Terminal, Settings). Navigation lives in
  `lib/app/app_destination.dart`; adding a screen means adding one enum value.
- **Theming** — light and dark themes generated from one seed colour
  (`lib/core/theme/app_theme.dart`), with the mode driven by a setting that
  defaults to *follow the device* (`lib/core/services/settings_service.dart`).
  No widget hard-codes a colour.
- **Placeholder screens** — each tab renders a labelled placeholder instead of
  real functionality; the reusable body is
  `lib/core/widgets/phase_placeholder.dart`.
- **Android configuration** — application id `com.devnest.app`, label `DevNest`,
  `minSdk 29`, `targetSdk 36`, `compileSdk 36`, `arm64-v8a` only, and
  `android:extractNativeLibs="true"` so bundled runtime binaries can be
  extracted and executed in a later phase.
- **CI** — `.github/workflows/android.yml` analyzes, tests and builds the debug
  APK, then uploads it as the `devnest-debug-apk` artifact.

Pinned toolchain: Flutter 3.47.5 (Dart 3.13) · JDK 17 · Gradle 9.3.1 ·
AGP 9.1.0 · Kotlin 2.4.0.

## Repository layout

```
lib/
  main.dart                     entry point
  app/                          app shell and navigation structure
  core/constants/               product facts (name, tagline, version)
  core/services/                settings, and the native platform-channel seam
  core/theme/                   Material 3 light + dark themes
  core/widgets/                 shared widgets
  features/<feature>/           one folder per tab
test/                           widget tests run by CI
android/                        hand-written Android configuration
.github/workflows/android.yml   the build (and the only place the app compiles)
```

## Where the project is going

Later tasks add the service dashboard (per-service state, CPU/RAM/storage
readouts, START ALL / STOP ALL / RESTART ALL) and the Kotlin foreground service
plus process manager that starts a real bundled runtime and serves a project at
`http://localhost:8080`. Multiple PHP versions, the extension manager, SSL,
backups, LAN access and the WordPress/Laravel installers come after that.

<!-- CI trigger probe -->
