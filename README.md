# TRYM'd PARTNER & BUSINESS APPLICATION

A new Flutter project.

## Getting Started

Trymd Business and Partner application is built to run on the Flutter _stable_ release.

### IMPORTANT:

For projects with Firestore integration, you must first run the following commands to ensure the project compiles:

```
flutter pub get
flutter packages pub run build_runner build --delete-conflicting-outputs
```

This command creates the generated files that parse each Record from Firestore into a schema object.

### Getting started continued:

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


### in pubsec.yaml file

    - change version: 1.0.0+1 to version: 1.0.0+2
    - then open your code in android by selecting

File -> Open -> your Flutter Code workspace -> Android icon of project

### Now go to build.gradle
```
def flutterVersionCode = localProperties.getProperty('flutter.versionCode')
if (flutterVersionCode == null) {
    flutterVersionCode = '1'
}

def flutterVersionName = localProperties.getProperty('flutter.versionName')
if (flutterVersionName == null) {
    flutterVersionName = '1.0.0'
}
```
to
```
def flutterVersionCode = localProperties.getProperty('flutter.versionCode')
if (flutterVersionCode == null) {
    flutterVersionCode = '2'
}

def flutterVersionName = localProperties.getProperty('flutter.versionName')
if (flutterVersionName == null) {
    flutterVersionName = '1.0.2'
}
```

### Now last one local.property file

```
sdk.dir=C:/Users/Admin/AppData/Local/Android/Sdk
flutter.sdk=D:\\flutter_windows\\flutter
flutter.buildMode=debug
flutter.versionName=1.0.0
flutter.versionCode=1
```

to
```
sdk.dir=C:/Users/Admin/AppData/Local/Android/Sdk
flutter.sdk=D:\\flutter_windows\\flutter
flutter.buildMode=debug
flutter.versionName=1.0.2
flutter.versionCode=2
```