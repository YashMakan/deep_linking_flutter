import 'package:flutter/material.dart';
import 'color_detail_page.dart';

class ColorAppHomePage extends StatefulWidget {
  const ColorAppHomePage({super.key});

  @override
  State<ColorAppHomePage> createState() => _ColorAppHomePageState();
}

class _ColorAppHomePageState extends State<ColorAppHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ColorDetailPage(
                              color: Colors.red,
                            )));
              },
              style: ElevatedButton.styleFrom(surfaceTintColor: Colors.red),
              child: const Text('Red Screen'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ColorDetailPage(
                              color: Colors.blue,
                            )));
              },
              style: ElevatedButton.styleFrom(surfaceTintColor: Colors.blue),
              child: const Text('Blue Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
