import 'package:e_product_order_flutter/home/home_screen.dart';
import 'package:e_product_order_flutter/home/product_add_screen.dart';
import 'package:e_product_order_flutter/login/login_screen.dart';
import 'package:e_product_order_flutter/login/signup_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BIO ORDER',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}
