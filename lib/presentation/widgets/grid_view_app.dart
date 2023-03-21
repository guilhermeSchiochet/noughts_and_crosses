import 'package:flutter/material.dart';

class GridViewApp extends StatelessWidget {
  final int itemCoun;
  final int crossAxisCount;
  final Widget Function(BuildContext context, int idx) component;

  const GridViewApp({
    super.key,
    required this.itemCoun,
    required this.component,
    required this.crossAxisCount,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 9,
      itemBuilder: this.component,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
        ),
    );
  }
}