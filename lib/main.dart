import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() => runApp(Root());

class Root extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "chat",
      home: HomePage(),
    );
  }
}
