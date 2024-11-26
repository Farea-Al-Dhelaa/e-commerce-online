import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopping/widgets/components/custombuttonlogin.dart';
import 'package:shopping/widgets/components/custombuttonlogin_logo.dart';
import '../utils/constants.dart';
import '../widgets/components/textformfield.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Directionality(
        textDirection: TextDirection.ltr,
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
                        "Create Account",
                        style: TextStyle(color: kbuttonColor, fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 25),
                    CustomTextForm(
                      hinttext: "Enter your username",
                      mycontroller: username,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "This field cannot be empty";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 25),
                    CustomTextForm(
                      hinttext: "Enter your email",
                      mycontroller: email,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "This field cannot be empty";
                        } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return "Invalid email address";
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
                        } else if (value.length < 6) {
                          return "Password must be at least 6 characters";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 25),
                    CustomTextForm(
                      hinttext: "Confirm your password",
                      mycontroller: confirmpassword,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "This field cannot be empty";
                        } else if (value != password.text) {
                          return "Passwords do not match";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 25),
                  ],
                ),
              ),
              CustomButtonLogin(
                title: "Sign Up",
                onPressed: () async {
                  if (formState.currentState!.validate()) {
                    if (email.text.isEmpty || password.text.isEmpty) {
                      return;
                    }
                    try {
                      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: email.text,
                        password: password.text,
                      );
                      // Send email verification
                      FirebaseAuth.instance.currentUser!.sendEmailVerification();
                      Navigator.of(context).pushReplacementNamed('/LoginPage');
                    } on FirebaseAuthException catch (e) {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.error,
                        animType: AnimType.rightSlide,
                        title: "Registration Error",
                        desc: e.message,
                        transitionAnimationDuration: const Duration(seconds: 1),
                      ).show();
                    }
                  }
                },
              ),
              const SizedBox(height: 25),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamedAndRemoveUntil('/LoginPage', (route) => false);
                },
                child: const Center(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: "Already have an account? "),
                        TextSpan(
                          text: "Login",
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
