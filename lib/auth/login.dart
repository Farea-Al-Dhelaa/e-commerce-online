import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shopping/widgets/components/custom_button_signwith_google.dart';
import 'package:shopping/widgets/components/custombuttonlogin.dart';
import 'package:shopping/widgets/components/custombuttonlogin_logo.dart';
import 'package:shopping/widgets/components/textformfield.dart';
import '../utils/constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  Future<void> signInWithEmailAndPassword() async {
    if (formState.currentState!.validate()) {
      try {
        final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text,
          password: password.text,
        );
        if (credential.user!.emailVerified) {
          Navigator.of(context).pushReplacementNamed('/BottomNavBar');
        } else {
          await FirebaseAuth.instance.currentUser!.sendEmailVerification();
          if (mounted) {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.error,
              animType: AnimType.rightSlide,
              title: 'Login Error',
              desc: 'Please verify your email address.',
            ).show();
          }
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          if (mounted) {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.error,
              animType: AnimType.rightSlide,
              title: 'Login Error',
              desc: 'No user found with this email address.',
            ).show();
          }
        } else if (e.code == 'wrong-password') {
          if (mounted) {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.error,
              animType: AnimType.rightSlide,
              title: 'Login Error',
              desc: 'Incorrect password for this user.',
            ).show();
          }
        } else {
          if (mounted) {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.error,
              animType: AnimType.rightSlide,
              title: 'Login Error',
              desc: e.message,
            ).show();
          }
        }
      }
    } else {
      print("Form is not valid");
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        return; // User canceled the login
      }
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      Navigator.of(context).pushNamedAndRemoveUntil('/BottomNavBar', (route) => false);
    } catch (e) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.rightSlide,
        title: 'Login Error',
        desc: 'Failed to login with Google. Please try again.',
      ).show();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Directionality(
        textDirection: TextDirection.ltr, // Changed direction to match English layout
        child: Container(
          padding: const EdgeInsets.all(25),
          child: ListView(
            children: [
              Form(
                key: formState,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 50),
                    const CustomLogoAuth(),
                    const SizedBox(height: 25),
                    const Center(
                      child: Text(
                        "Login",
                        style: TextStyle(color: kbuttonColor, fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 25),
                    CustomTextForm(
                      hinttext: "Enter your email address",
                      mycontroller: email,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "This field cannot be empty";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 25),
                    CustomTextForm(
                      hinttext: "Enter your password",
                      mycontroller: password,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "This field cannot be empty";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    InkWell(
                      onTap: () async {
                        if (email.text.isEmpty) {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.error,
                            animType: AnimType.rightSlide,
                            title: 'Error',
                            desc: 'Please enter your email before tapping Forgot Password.',
                            btnCancelOnPress: () {},
                            btnOkOnPress: () {},
                          ).show();
                          return;
                        }
                        try {
                          await FirebaseAuth.instance.sendPasswordResetEmail(email: email.text);
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.success,
                            animType: AnimType.rightSlide,
                            title: 'Success',
                            desc: 'Check your email to reset your password.',
                            transitionAnimationDuration: const Duration(seconds: 1),
                          ).show();
                        } catch (e) {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.error,
                            animType: AnimType.rightSlide,
                            title: 'Error',
                            desc: 'Please ensure the email address is correct.',
                          ).show();
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 10, bottom: 25),
                        alignment: Alignment.topLeft,
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              CustomButtonLogin(
                title: "Login",
                onPressed: signInWithEmailAndPassword,
              ),
              const SizedBox(height: 25),
              CustomButtonSignWithGoogle(
                onPressed: signInWithGoogle,
              ),
              const SizedBox(height: 25),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamedAndRemoveUntil('/SignUpPage', (route) => false);
                },
                child: const Center(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Don't have an account? ",
                        ),
                        TextSpan(
                          text: "Sign Up",
                          style: TextStyle(color: kbuttonColor, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
