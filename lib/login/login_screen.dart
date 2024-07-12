import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
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

  Future<UserCredential?> signIn(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      print(credential);
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<UserCredential?> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

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
                padding: const EdgeInsets.only(top: 16),
                child: MaterialButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      final result = await signIn(
                          emailTextController.text.trim(),
                          pwdTextController.text.trim());
                      if (result == null) {
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Login failed"),
                            ),
                          );
                        }

                        return;
                      }
                      // login and auth validation success
                      if (context.mounted) {
                        context.go("/");
                      }
                    }
                  },
                  height: 48,
                  minWidth: double.infinity,
                  color: CustomThemeColors.primary,
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 22),
                child: MaterialButton(
                  onPressed: () => context.push("/sign_up"),
                  height: 48,
                  minWidth: double.infinity,
                  child: const Text(
                    "Don't have an account? Sign Up",
                    style: TextStyle(
                      color: CustomThemeColors.footerText,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              const Divider(),
              InkWell(
                onTap: () async {
                  final userCredit = await signInWithGoogle();
                },
                child: Image.asset("assets/images/btn_google_signin.png"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
