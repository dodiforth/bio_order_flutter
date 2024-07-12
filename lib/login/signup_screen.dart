import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_product_order_flutter/common/theme/custom_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailTextController = TextEditingController();
  TextEditingController pwdTextController = TextEditingController();

  Future<bool> signUp(String emailAddress, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailAddress, password: password);
      FirebaseFirestore.instance.collection("users").add({
        "uid": credential.user?.uid ?? "",
        "email": credential.user?.email ?? "",
      });
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print("weak password");
        return false;
      } else if (e.code == 'email-already-in-use') {
        print("email already in use");
        return false;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sign Up",
              style: TextStyle(fontSize: 22, fontFamily: "DraftingMono")),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(48.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    "Welcome to \nJoin us!",
                    style: TextStyle(
                        fontSize: 32,
                        fontFamily: "DraftingMono",
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 42,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: emailTextController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        TextFormField(
                          controller: pwdTextController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Password',
                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  MaterialButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        final result = await signUp(
                          emailTextController.text.trim(),
                          pwdTextController.text.trim(),
                        );
                        if (result) {
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Sign Up Successful"),
                              ),
                            );
                            context.go("/login");
                          }
                        } else {
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Sign Up Failed"),
                              ),
                            );
                          }
                        }
                      }
                    },
                    height: 48,
                    minWidth: double.infinity,
                    color: CustomThemeColors.primary,
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          fontFamily: "DraftingMono",
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
