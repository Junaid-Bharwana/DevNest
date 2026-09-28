// Root Gradle build. Flutter's Gradle plugin reads the plugin versions pinned in
// settings.gradle.kts, so nothing is declared here beyond repositories.
allprojects {
    repositories {
        google()
        mavenCentral()
    }
}
// Keep every module's build output under the project-root `build/` directory,
// which is what `flutter build apk` and the CI artifact upload expect.
val newBuildDir: Directory =
    rootProject.layout.buildDirectory
        .dir("../../build")
        .get()
rootProject.layout.buildDirectory.value(newBuildDir)
subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
subprojects {
    project.evaluationDependsOn(":app")
}
tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
