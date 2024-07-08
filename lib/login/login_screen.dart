import 'package:flutter/material.dart';
import '../common/theme/custom_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController pwdTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(48.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/logo_plain.png"),
              const Text(
                "Bio Order",
                style: TextStyle(
                  fontFamily: "RentStrike",
                  fontWeight: FontWeight.w800,
                  fontSize: 50,
                ),
              ),
              const SizedBox(
                height: 64,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailTextController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Email cannot be empty";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    TextFormField(
                      controller: pwdTextController,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password cannot be empty";
                        }
                        return null;
                      },
                    )
                  ],
                ),
    ),
    Padding(
    padding: const EdgeInsets.only(top : 16),
    child: MaterialButton(
    onPressed: () {},
    height: 48,
    minWidth: double.infinity,
    color: const CustomThemeColors().primary,
    child: const Text("Login", style: TextStyle(color: Colors.white, fontSize: 18,),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top : 22),
                child: MaterialButton(
                  onPressed: () {},
                  height: 48,
                  minWidth: double.infinity,
                  child: const Text("Don't have an account? Sign Up", style: TextStyle(color: CustomThemeColors.footerText, fontSize: 15,),),
                ),
              ),
              const Divider(),
              Image.asset("assets/images/btn_google_signin.png"),
            ],
          ),
        ),
      ),
    );
  }
}
