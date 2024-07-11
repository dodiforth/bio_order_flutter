import 'package:e_product_order_flutter/home/cart_screen.dart';
import 'package:e_product_order_flutter/home/home_screen.dart';
import 'package:e_product_order_flutter/home/product_add_screen.dart';
import 'package:e_product_order_flutter/home/product_detail_screen.dart';
import 'package:e_product_order_flutter/login/login_screen.dart';
import 'package:e_product_order_flutter/login/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final router = GoRouter(
    initialLocation: "/login",
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => HomeScreen(),
        routes: [
          GoRoute(
            path: "cart/:uid",
            builder: (context, state) => CartScreen(
              uid: state.pathParameters["uid"] ?? "",
            ),
          ),
          GoRoute(
            path: "product",
            builder: (context, state) => ProductDetailScreen(),
          ),
          GoRoute(
            path: "product/add",
            builder: (context, state) => ProductAddScreen(),
          ),
        ],
      ),
      GoRoute(
        path: "/login",
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        path: "/sign_up",
        builder: (context, state) => SignUpScreen(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'BIO ORDER',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
