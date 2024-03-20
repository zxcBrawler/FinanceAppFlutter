import 'package:finance_app_firebase/config/app_colors.dart';
import 'package:finance_app_firebase/core/router/app_router.dart';
import 'package:finance_app_firebase/core/utils/app_validator.dart';
import 'package:finance_app_firebase/di/service.dart';
import 'package:finance_app_firebase/feature/data/model/login_dto.dart';
import 'package:finance_app_firebase/feature/presentation/bloc/auth/auth_bloc.dart';
import 'package:finance_app_firebase/feature/presentation/bloc/auth/auth_event.dart';
import 'package:finance_app_firebase/feature/presentation/bloc/auth/auth_state.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController =
      TextEditingController(text: '');
  final TextEditingController _passwordController =
      TextEditingController(text: '');
  final TextEditingController _fullNameController =
      TextEditingController(text: '');
  final TextEditingController _confirmPasswordController =
      TextEditingController(
    text: '',
  );

  final authBloc = service<AuthBloc>();
  final LoginDto loginDto = LoginDto();
  var appValidator = AppValidator();
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
                              controller: _fullNameController,
                              validator: appValidator.validateName,
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
                      ),
                      const SizedBox(
                        height: 20,
                      ),
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
                              controller: _confirmPasswordController,
                              validator: appValidator.validatePassword,
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

  Future<void> _submit() async {
    if (_formKey.currentState!.validate()) {
      if (_confirmPasswordController.text != _passwordController.text) {
        ScaffoldMessenger.of(_formKey.currentContext!).showSnackBar(
            const SnackBar(content: Text("Passwords don't match")));
        return;
      } else {
        loginDto.email = _emailController.text;
        loginDto.password = _passwordController.text;
        loginDto.fullName = _fullNameController.text;
        authBloc.add(Register(loginDto: loginDto));

        authBloc.stream.listen((event) {
          if (event is AuthError) {
            ScaffoldMessenger.of(_formKey.currentContext!)
                .showSnackBar(SnackBar(content: Text(event.message)));
          }
          if (event is AuthDone) {
            router.pop();
          }
          if (event is AuthLoading) {
            ScaffoldMessenger.of(_formKey.currentContext!)
                .showSnackBar(const SnackBar(content: Text("Loading...")));
          }
        });
      }
    }
  }
}
