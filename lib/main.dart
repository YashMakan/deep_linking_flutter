import 'package:deep_linking_flutter/pages/color_app_home_page.dart';
import 'package:flutter/material.dart';
import 'deep_link_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DeepLinkHandler.instance
      .initUniLinks(); // Initialize deep link handling
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Deep Linking Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ColorAppHomePage(),
    );
  }
}
