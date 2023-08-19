import 'package:deep_linking_flutter/deep_link_handler.dart';
import 'package:flutter/material.dart';

import 'color_detail_page.dart';

class ColorAppHomePage extends StatefulWidget {
  const ColorAppHomePage({super.key});

  @override
  State<ColorAppHomePage> createState() => _ColorAppHomePageState();
}

class _ColorAppHomePageState extends State<ColorAppHomePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      DeepLinkHandler.instance.stream!.listen((Uri? uri) {
        if (uri != null) {
          DeepLinkHandler.instance.handleDeepLink(context, uri.toString());
        }
      });
    });
    super.initState();
  }

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
