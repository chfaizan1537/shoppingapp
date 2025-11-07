import 'package:flutter/material.dart';
import 'package:shoppingapp/screens/01splashscreen.dart';

void main() {
  runApp(mai());
}
class mai extends StatelessWidget {
  const mai({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:splash(),
    );
  }
}

