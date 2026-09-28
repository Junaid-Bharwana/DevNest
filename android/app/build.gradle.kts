plugins {
    id("com.android.application")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin
    // Gradle plugins. It is what applies the Kotlin Android plugin declared in
    // settings.gradle.kts.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    // The application id is confirmed by the owner: com.devnest.app. It is used
    // as the namespace as well so the generated R/BuildConfig classes and every
    // Kotlin file live under the same package.
    namespace = "com.devnest.app"
    compileSdk = 36

    // `ndkVersion` is deliberately NOT set. This phase ships no NDK-built code —
    // bundled runtimes arrive as prebuilt arm64 .so files in jniLibs — and
    // declaring a version would make AGP fetch a ~1 GB NDK that never runs.

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    defaultConfig {
        applicationId = "com.devnest.app"
        // Android 10 — the floor for the bundled-runtime design (executing
        // binaries from the extracted native-library directory).
        minSdk = 29
        // Android 16 — Play requires API 36 for new apps from 31 Aug 2026, so
        // DevNest targets it from the first commit.
        targetSdk = 36
        versionCode = flutter.versionCode
        versionName = flutter.versionName

        // 64-bit ARM only. The bundled runtimes are bionic/ARM64 builds with
        // 16 KB ELF page alignment; every extra ABI means shipping and
        // maintaining a second binary set.
        ndk {
            abiFilters.add("arm64-v8a")
        }
    }

    buildTypes {
        release {
            // A real signing config is the owner's own later step; the debug key
            // keeps `flutter run --release` working in the meantime.
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

kotlin {
    compilerOptions {
        jvmTarget = org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_17
    }
}

flutter {
    source = "../.."
}
