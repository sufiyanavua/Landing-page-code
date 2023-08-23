import 'dart:developer';

import 'package:avua/core/color_constants.dart';
import 'package:avua/core/constants.dart';
import 'package:avua/logic/admin_login/admin_login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  @override
  void initState() {
    super.initState();
    passwordController = TextEditingController();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  String validateEmail(String value) {
    if (value.isEmpty) {
      return 'Please enter an email address.';
    } else if (!value.contains('@')) {
      return 'Please enter a valid email address.';
    }
    return "";
  }

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return 'Please enter a password.';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters long.';
    }
    return "";
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 800,
          ),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Admin Login",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                  SizeConstants.height30,
                  SizeConstants.height30,
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter an email address.';
                      }
                      // else if (!RegExp(
                      //         r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+$')
                      //     .hasMatch(emailController.text)) {
                      //   return 'Please enter a valid email address.';
                      // }
                      else if (!value.contains('@')) {
                        return 'Please enter a valid email address.';
                      }
                      return null;
                    },
                    controller: emailController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Email",
                    ),
                  ),
                  SizeConstants.height30,
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter the password.';
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters long.';
                      }
                      return null;
                    },
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "password",
                    ),
                  ),
                  SizeConstants.height30,
                  InkWell(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          // Perform login or authentication logic here
                          String email = emailController.text.trim();
                          String password = passwordController.text.trim();
                          // Your authentication logic goes here
                          log('Email: $email, Password: $password');
                          BlocProvider.of<AdminLoginBloc>(context).add(
                            AdminLoginEventFunction(
                              email: email,
                              password: password,
                              context: context,
                            ),
                          );
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        width: double.infinity,
                        height: 50,
                        color: ColorConstant.primaryColor,
                        child: Center(
                          child: BlocBuilder<AdminLoginBloc, AdminLoginState>(
                            builder: (context, state) {
                              if (state is AdminLoginStarted) {
                                return const CircularProgressIndicator();
                              } else if (state is AdminLoginFinished) {
                                return const Text("✓");
                              } else {
                                return const Text(
                                  "Login",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: ColorConstant.whiteColor,
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
