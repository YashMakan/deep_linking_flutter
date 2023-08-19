import 'package:deep_linking_flutter/pages/color_app_home_page.dart';
import 'package:deep_linking_flutter/pages/color_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Deep Linking Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: GoRouter(routes: [
        GoRoute(
          path: "/",
          builder: (context, state) => const ColorAppHomePage(),
        ),
        GoRoute(
          path: "/red",
          builder: (context, state) => const ColorDetailPage(color: Colors.red),
        ),
        GoRoute(
          path: "/blue",
          builder: (context, state) =>
              const ColorDetailPage(color: Colors.blue),
        ),
      ]),
    );
  }
}
