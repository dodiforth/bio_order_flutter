import 'package:e_product_order_flutter/common/theme/custom_colors.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailTextController = TextEditingController();
  TextEditingController pwdTextController = TextEditingController();

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
                  onPressed: () {},
                  height: 48,
                  minWidth: double.infinity,
                  color: CustomThemeColors.primary,
                  child: Text("Sign Up",
                  style: TextStyle(fontFamily: "DraftingMono",fontWeight: FontWeight.w600),),
                ),
              ],
            ),
          ),
        ));
  }
}
