import 'package:finance_app_firebase/config/app_colors.dart';
import 'package:finance_app_firebase/core/router/app_router.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        router.pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.blueSecondary,
                        size: 30,
                      )),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: [
                    Text(
                      "Create account",
                      style: TextStyle(fontSize: 35, color: AppColors.white),
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: [
                    Text(
                      "Please fill the input fields below",
                      style: TextStyle(
                          fontSize: 18, color: AppColors.blueSecondary),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.grey.withOpacity(0.1),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: "Full name",
                              labelStyle: TextStyle(
                                  color: AppColors.white, fontSize: 18),
                              prefixIcon:
                                  Icon(Icons.person, color: AppColors.white),
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              hintText: "Enter your full name",
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(171, 157, 149, 168)),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.grey.withOpacity(0.1),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: "Email",
                              labelStyle: TextStyle(
                                  color: AppColors.white, fontSize: 18),
                              prefixIcon:
                                  Icon(Icons.email, color: AppColors.white),
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              hintText: "Enter email",
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(171, 157, 149, 168)),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.grey.withOpacity(0.1),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: TextFormField(
                            obscureText: obscureText,
                            decoration: InputDecoration(
                              labelText: "Password",
                              labelStyle: const TextStyle(
                                  color: AppColors.white, fontSize: 18),
                              prefixIcon: const Icon(Icons.lock,
                                  color: AppColors.white),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  obscureText
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: AppColors.white,
                                ),
                                onPressed: () {
                                  setState(() {
                                    obscureText = !obscureText;
                                  });
                                },
                              ),
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              hintText: "Enter password",
                              hintStyle: const TextStyle(
                                  color: Color.fromARGB(171, 157, 149, 168)),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.grey.withOpacity(0.1),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: TextFormField(
                            obscureText: obscureText,
                            decoration: const InputDecoration(
                              labelText: "Confirm password",
                              labelStyle: TextStyle(
                                  color: AppColors.white, fontSize: 18),
                              prefixIcon:
                                  Icon(Icons.lock, color: AppColors.white),
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              hintText: "Enter password",
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(171, 157, 149, 168)),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.tealPrimary),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      color: AppColors.backgroundColor,
                                      fontSize: 25),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
