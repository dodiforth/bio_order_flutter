import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_product_order_flutter/home/cart_screen.dart';
import 'package:e_product_order_flutter/home/home_screen.dart';
import 'package:e_product_order_flutter/home/product_add_screen.dart';
import 'package:e_product_order_flutter/home/product_detail_screen.dart';
import 'package:e_product_order_flutter/login/login_screen.dart';
import 'package:e_product_order_flutter/login/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  if(kDebugMode) {
    try {
      await FirebaseAuth.instance.useAuthEmulator("localhost", 9099);
      FirebaseFirestore.instance.useFirestoreEmulator("localhost", 8080);
      FirebaseStorage.instance.useStorageEmulator("localhost", 9199);
      
    } catch (e) {
      print(e);
    }
  }
  runApp(BioOrderApp());
}

class BioOrderApp extends StatelessWidget {
  BioOrderApp({super.key});

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
