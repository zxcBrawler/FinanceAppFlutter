import 'package:finance_app_firebase/config/app_colors.dart';
import 'package:finance_app_firebase/core/router/app_router.dart';
import 'package:finance_app_firebase/core/router/router_utils.dart';
import 'package:finance_app_firebase/core/utils/app_validator.dart';
import 'package:finance_app_firebase/di/service.dart';
import 'package:finance_app_firebase/feature/data/model/login_dto.dart';
import 'package:finance_app_firebase/feature/presentation/bloc/auth/auth_bloc.dart';
import 'package:finance_app_firebase/feature/presentation/bloc/auth/auth_event.dart';
import 'package:finance_app_firebase/feature/presentation/bloc/auth/auth_state.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var appValidator = AppValidator();
  final authBloc = service<AuthBloc>();
  final TextEditingController _emailController =
      TextEditingController(text: '');
  final TextEditingController _passwordController =
      TextEditingController(text: '');

  final LoginDto loginDto = LoginDto();

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
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.withOpacity(0.1),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: _emailController,
                              validator: appValidator.validateEmail,
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
                      ),
                      const SizedBox(height: 15),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.withOpacity(0.1),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: _passwordController,
                              validator: appValidator.validatePassword,
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
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: _submit,
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
                      const SizedBox(height: 120),
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

  void _submit() {
    if (_formKey.currentState!.validate()) {
      loginDto.email = _emailController.text;
      loginDto.password = _passwordController.text;
      authBloc.add(Login(loginDto: loginDto));

      authBloc.stream.listen((event) {
        if (event is AuthError) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(event.message)));
        }
        if (event is AuthDone) {
          router.go(Pages.dashboard.screenPath);
        }
        if (event is AuthLoading) {
          ScaffoldMessenger.of(_formKey.currentContext!)
              .showSnackBar(const SnackBar(content: Text("Loading...")));
        }
      });
    }
  }
}
