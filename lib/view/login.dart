// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:project/view/appbar.dart';

import '../widgets/boxdecoration.dart';
import 'signup.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool validatePhone(String value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10}$)';
    RegExp regex = RegExp(pattern);
    return (!regex.hasMatch(value)) ? false : true;
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    return Form(
      key: _formKey,
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: Center(
            child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    height: 120,
                  ),
                  Container(
                      height: height * 0.09,
                      // color: Colors.red,
                      child: Image.asset('assets/images/logo.png')),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text('Welcome to Complaint Management System',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text('Sign in to continue',
                      style: TextStyle(
                        fontSize: 17,
                      )),
                  const SizedBox(
                    height: 38,
                  ),
                  TextFormField(
                    decoration: textDecoration.copyWith(
                      labelText: "Phone number",
                      prefixIcon: const Icon(Icons.phone),
                    ),
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'Enter phone number';
                    //   } else if (validatePhone(value) == false) {
                    //     return 'Enter 10 digit number only';
                    //   }

                    //   return null;
                    // },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: textDecoration.copyWith(
                      labelText: "Password",
                      prefixIcon: const Icon(Icons.lock),
                    ),
                    obscureText: true,
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'Please enter some text';
                    //   } else if (value.length < 5) {
                    //     return 'Password too Small';
                    //   }
                    //   return null;
                    // }
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                      width: double.infinity,
                      height: height * 0.07,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              textStyle: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Appbar(),
                                  ));
                            }
                          },
                          child: const Text(
                            "Sign in",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ))),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () {},
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  RichText(
                    text: TextSpan(children: [
                      const TextSpan(
                        text: "Don't have a account? ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                      TextSpan(
                          text: 'Register',
                          style: const TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const Signup(),
                                      ))
                                }),
                    ]),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
