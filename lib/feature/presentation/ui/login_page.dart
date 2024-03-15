import 'package:finance_app_firebase/config/app_colors.dart';
import 'package:finance_app_firebase/core/router/app_router.dart';
import 'package:finance_app_firebase/core/router/router_utils.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          // Wrap the Column with SingleChildScrollView
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 150),
                const Text(
                  "Login",
                  style: TextStyle(fontSize: 40),
                ),
                const Text(
                  "Please sign in to continue",
                  style:
                      TextStyle(color: AppColors.blueSecondary, fontSize: 20),
                ),
                const SizedBox(height: 20),
                Form(
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
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                router.go(Pages.dashboard.screenPath);
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.tealPrimary),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      color: AppColors.backgroundColor,
                                      fontSize: 25),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Forgot password?",
                            style: TextStyle(
                                color: AppColors.tealPrimary, fontSize: 18),
                          )
                        ],
                      ),
                      const SizedBox(height: 100),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text(
                              "Don't have an account?",
                              style: TextStyle(
                                  color: AppColors.blueSecondary, fontSize: 15),
                            ),
                            TextButton(
                              onPressed: () {
                                router.push(Pages.register.screenPath);
                              },
                              child: const Text(
                                "Sign up",
                                style: TextStyle(
                                    color: AppColors.tealPrimary,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
