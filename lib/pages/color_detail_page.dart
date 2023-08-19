import 'package:flutter/material.dart';

class ColorDetailPage extends StatelessWidget {
  final Color color;

  const ColorDetailPage({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
    );
  }
}
