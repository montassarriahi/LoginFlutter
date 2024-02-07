// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logincubit/cubit/validlogin_cubit.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController EmailController = TextEditingController();
  final TextEditingController PasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login Page',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple[300],
      ),
      body: Form(
        key: context.read<ValidloginCubit>().formKey,
        child: BlocConsumer<ValidloginCubit, ValidloginState>(
          listener: (context, state) {
            if (state is Validlogins) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                      'Your email is ${state.Email} and you password is ${state.Password}'),
                  backgroundColor: Colors.green,
                ),
              );
            } else {
              return null;
              // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              //   content: Text("please fill the input"),
              //   backgroundColor: Colors.red,
              // ),
              // );
            }
          },
          builder: (context, state) {
            return Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Welcome Back!",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 50),
                    // Email Input Field
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter Your Email";
                        } else if (isValidEmail(value)) {
                          return null;
                        } else {
                          return "please enter a valid email adress";
                        }
                      },
                      // this is controler
                      controller: EmailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                    ),

                    SizedBox(height: 16),

                    // Password Input Field
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter Your Password";
                        } else if (value.length < 6) {
                          return "Password must be at least 6 characters";
                        }
                        return null; 
                      },
                      controller: PasswordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                      ),
                      obscureText: true,
                    ),

                    SizedBox(height: 24),

                    // Login Button
                    ElevatedButton(
                      onPressed: () {
                        String email = EmailController.text;
                        String password = PasswordController.text;
                        context
                            .read<ValidloginCubit>()
                            .Information(email, password);
                        // context.read<ValidloginCubit>().formKey.currentState!.validate();
                        // context.read<ValidloginCubit>().Information(
                        //     EmailController.text, PasswordController.text);
                      },
                      child: Text('Login'),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
