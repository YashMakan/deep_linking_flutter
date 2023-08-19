
# Flutter Deep Linking

A flutter project to understand the whole process to setup deeplinks.

## Android Configuration:
a. Open your Android project in Android Studio.
b. In the AndroidManifest.xml file, within the `<activity>` tag for your app's main activity, add an `<intent-filter>` to handle deep links:
```
 <!-- Deep Links -->
<intent-filter>
    <action android:name="android.intent.action.VIEW" />
    <category android:name="android.intent.category.DEFAULT" />
    <category android:name="android.intent.category.BROWSABLE" />
    <!-- Accepts URIs that begin with YOUR_SCHEME://YOUR_HOST -->
    <data
        android:scheme="[YOUR_SCHEME]"
        android:host="[YOUR_HOST]" />
</intent-filter>

<!-- App Links / Unique Links with assetlinks.json -->
<intent-filter android:autoVerify="true">
    <action android:name="android.intent.action.VIEW" />
    <category android:name="android.intent.category.DEFAULT" />
    <category android:name="android.intent.category.BROWSABLE" />
    <!-- Accepts URIs that begin with https://YOUR_HOST -->
    <data
        android:scheme="https"
        android:host="[YOUR_HOST]" />
</intent-filter>
```

## iOS Configuration:
a. Open your iOS project in Xcode.
b. In the Info.plist file, add a key-value pair to specify your custom scheme in the CFBundleURLTypes array:
```
<key>CFBundleURLTypes</key>
<array>
    <dict>
        <key>CFBundleTypeRole</key>
        <string>Editor</string>
        <key>CFBundleURLSchemes</key>
        <array>
            <string>yourappscheme</string> <!-- Replace with your custom scheme -->
        </array>
    </dict>
</array>
```

## Website Configuration:
a. Create a webpage on your website that contains a link to your app's deep link: [Optional]
```
<a href="yourappscheme://some/path">Open My App</a>
```
b. In the `<head>` section of your webpage, add HTML meta tags for Android App Links:
```
<meta property="al:android:url" content="yourappscheme://some/path">
<meta property="al:web:url" content="https://www.yourwebsite.com/some/path">
```
c. Create an `assetlinks.json` file and place it at the root of your website's domain (e.g., `https://www.example.com/.well-known/assetlinks.json`). Example content:
```
[
    {
        "relation": ["delegate_permission/common.handle_all_urls"],
        "target": {
            "namespace": "android_app",
            "package_name": "com.example.myapp",
            "sha256_cert_fingerprints": [...]
        }
    }
]
```

## Flutter Code Changes
a. Add the uni_links dependency in your `pubspec.yaml`:
```
dependencies:
  flutter:
    sdk: flutter
  go_router: ^10.1.0
```
b. Initialize the router in your app's `main.dart` file.
```
import 'package:flutter/material.dart';
import 'deep_link_handler.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DeepLinkHandler.initUniLinks(); // Initialize deep link handling
  runApp(MyApp());
}
```

## Testing
```
adb shell 'am start -W -a android.intent.action.VIEW -c android.intent.category.BROWSABLE -d "https://yashmakan.co.in/red"'
```
or
click link [https://yashmakan.co.in/red](https://yashmakan.co.in/red) from phone to check.