import 'package:flutter/material.dart';
import 'package:shopping_cart/view/login.dart';
import 'package:shopping_cart/view/product_list.dart';
import 'package:shopping_cart/view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
