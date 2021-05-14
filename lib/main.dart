import 'package:flutter/material.dart';

import 'package:ejemplo1/src/pages/slideshow_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Diseños App',
      debugShowCheckedModeBanner: false,
      home: SlideShowPage()
    );
  }
}
